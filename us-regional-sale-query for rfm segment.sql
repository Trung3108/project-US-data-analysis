-- Tính RFM và phân loại Segment trên cùng một bảng US_Regional_Sales_Data

;WITH RFM_CTE AS
(
    SELECT
        s.CustomerID,
        -- Recency: số ngày từ lần mua gần nhất đến ngày tham chiếu
        DATEDIFF(
            DAY,
            MAX(s.OrderDate),
            '2020-12-31'
        ) AS Recency,

        -- Frequency: đếm số đơn hàng duy nhất
        COUNT(DISTINCT s.OrderNumber) AS Frequency,

        -- Monetary: tổng doanh thu
        SUM(s.Revenue) AS Monetary
    FROM US_Regional_Sales_Data s
    group by [CustomerID]
),
RFM_SCORED AS
(
    SELECT
        CustomerID,
        Recency,
        Frequency,
        Monetary,

        -- R_Score: Recency càng nhỏ => điểm càng cao, đảo chiều bằng (5 - NTILE(5))
        R_Score = NTILE(5) OVER (ORDER BY Recency desc),

        -- F_Score: Frequency càng lớn => điểm càng cao
        F_Score = NTILE(5) OVER (ORDER BY Frequency aSC),

        -- M_Score: Monetary càng lớn => điểm càng cao
        M_Score = NTILE(5) OVER (ORDER BY Monetary aSC)
    FROM RFM_CTE
),

RFM_Final AS
(
    SELECT
        [CustomerID],
        R_Score, 
        F_Score, 
        M_Score,
        -- Ghép thành chuỗi 3 ký tự (vd: "213", "455", ...)
        CONCAT(R_Score, F_Score, M_Score) as rfm_segment, 
        Recency,
        Frequency,
        Monetary
    FROM RFM_SCORED
)

SELECT
    CustomerID,
    rfm_segment,
    Recency,
    Frequency,
    Monetary,
    R_Score, 
    F_Score, 
    M_Score,
     -- CASE WHEN phân loại theo danh sách bạn đưa ra
            CASE
                WHEN rfm_segment IN (
                    '213','221','231','241','251','261','312','321','331'
                ) THEN 'About To Sleep'

                WHEN rfm_segment IN (
                    '243','244','245','252','253','254','255','124','125','133','134','135',
                    '142','143','145','152','153','224','225','234','235','242'
                ) THEN 'At Risk'

                WHEN rfm_segment IN (
                    '113','114','115','144','154','155','214','215'
                ) THEN 'Cannot Lose Them'

                WHEN rfm_segment IN (
                    '445','454','455','544','545','554','555'
                ) THEN 'Champions'

                WHEN rfm_segment IN (
                    '122','123','132','211','212','222','223','231','232','233','241','251',
                    '322','332'
                ) THEN 'Hibernating customers'

                WHEN rfm_segment IN (
                    '111','112','121','131','141','151'
                ) THEN 'Lost Customers'

                WHEN rfm_segment IN (
                    '335','344','345','354','355','435','444','543'
                ) THEN 'Loyal'

                WHEN rfm_segment IN (
                    '324','325','334','343','434','443','534','535'
                ) THEN 'Need Attention'

                WHEN rfm_segment IN (
                    '311','411','412','421','422','511','512'
                ) THEN 'New Customers'

                WHEN rfm_segment IN (
                    '323','333','341','342','351','352','353','423','431','432','433','441','442',
                    '451','452','453','531','532','533','541','542','551','552','553'
                ) THEN 'Potential Loyalist'

                WHEN rfm_segment IN (
                    '313','314','315','413','414','415','424','425','513','514','515','521','522',
                    '523','524','525'
                ) THEN 'Promising'

                ELSE 'Other'
            END as segment_name
FROM RFM_Final
ORDER BY [CustomerID];
