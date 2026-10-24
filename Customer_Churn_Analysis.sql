-- Customer Churn Analysis
-- Tool: Oracle SQL
-- Analysis 1: Overall Customer Churn

SELECT
    COUNT(*) AS TOTAL_CUSTOMERS,
    SUM(
        CASE
            WHEN DBMS_LOB.SUBSTR("Churn", 100, 1) = 'Yes'
            THEN 1
            ELSE 0
        END
    ) AS CHURNED_CUSTOMERS,
    ROUND(
        100 * SUM(
            CASE
                WHEN DBMS_LOB.SUBSTR("Churn", 100, 1) = 'Yes'
                THEN 1
                ELSE 0
            END
        ) / COUNT(DBMS_LOB.SUBSTR("Churn", 100, 1)),
        2
    ) AS CHURN_RATE_PERCENT
FROM CUSTOMER_CHURN
WHERE DBMS_LOB.SUBSTR("Churn", 100, 1) IS NOT NULL;

-- Analysis 2: Customer Churn by Contract Type

SELECT
    DBMS_LOB.SUBSTR("Contract_Type", 100, 1) AS CONTRACT_TYPE,
    COUNT(*) AS TOTAL_CUSTOMERS,
    SUM(
        CASE
            WHEN DBMS_LOB.SUBSTR("Churn", 100, 1) = 'Yes'
            THEN 1
            ELSE 0
        END
    ) AS CHURNED_CUSTOMERS,
    ROUND(
        100 * SUM(
            CASE
                WHEN DBMS_LOB.SUBSTR("Churn", 100, 1) = 'Yes'
                THEN 1
                ELSE 0
            END
        ) / COUNT(*),
        2
    ) AS CHURN_RATE_PERCENT
FROM CUSTOMER_CHURN
WHERE DBMS_LOB.SUBSTR("Churn", 100, 1) IS NOT NULL
GROUP BY DBMS_LOB.SUBSTR("Contract_Type", 100, 1)
ORDER BY CHURN_RATE_PERCENT DESC;

-- Analysis 3: Customer Churn by Subscription Type

SELECT
    DBMS_LOB.SUBSTR("Subscription_Type", 100, 1)
        AS SUBSCRIPTION_TYPE,
    COUNT(*) AS TOTAL_CUSTOMERS,
    SUM(
        CASE
            WHEN DBMS_LOB.SUBSTR("Churn", 100, 1) = 'Yes'
            THEN 1
            ELSE 0
        END
    ) AS CHURNED_CUSTOMERS,
    ROUND(
        100 * SUM(
            CASE
                WHEN DBMS_LOB.SUBSTR("Churn", 100, 1) = 'Yes'
                THEN 1
                ELSE 0
            END
        ) / COUNT(*),
        2
    ) AS CHURN_RATE_PERCENT
FROM CUSTOMER_CHURN
WHERE DBMS_LOB.SUBSTR("Churn", 100, 1) IS NOT NULL
GROUP BY DBMS_LOB.SUBSTR("Subscription_Type", 100, 1)
ORDER BY CHURN_RATE_PERCENT DESC;

-- Analysis 4: Customer Churn by Internet Service

SELECT
    DBMS_LOB.SUBSTR("Internet_Service", 100, 1)
        AS INTERNET_SERVICE,
    COUNT(*) AS TOTAL_CUSTOMERS,
    SUM(
        CASE
            WHEN DBMS_LOB.SUBSTR("Churn", 100, 1) = 'Yes'
            THEN 1
            ELSE 0
        END
    ) AS CHURNED_CUSTOMERS,
    ROUND(
        100 * SUM(
            CASE
                WHEN DBMS_LOB.SUBSTR("Churn", 100, 1) = 'Yes'
                THEN 1
                ELSE 0
            END
        ) / COUNT(*),
        2
    ) AS CHURN_RATE_PERCENT
FROM CUSTOMER_CHURN
WHERE DBMS_LOB.SUBSTR("Churn", 100, 1) IS NOT NULL
GROUP BY DBMS_LOB.SUBSTR("Internet_Service", 100, 1)
ORDER BY CHURN_RATE_PERCENT DESC;

-- Analysis 5: Customer Churn by Tenure Group

SELECT
    DBMS_LOB.SUBSTR("Tenure_Group", 100, 1) AS TENURE_GROUP,
    COUNT(*) AS TOTAL_CUSTOMERS,
    SUM(
        CASE
            WHEN DBMS_LOB.SUBSTR("Churn", 100, 1) = 'Yes'
            THEN 1
            ELSE 0
        END
    ) AS CHURNED_CUSTOMERS,
    ROUND(
        100 * SUM(
            CASE
                WHEN DBMS_LOB.SUBSTR("Churn", 100, 1) = 'Yes'
                THEN 1
                ELSE 0
            END
        ) / COUNT(*),
        2
    ) AS CHURN_RATE_PERCENT
FROM CUSTOMER_CHURN
WHERE DBMS_LOB.SUBSTR("Churn", 100, 1) IS NOT NULL
GROUP BY DBMS_LOB.SUBSTR("Tenure_Group", 100, 1)
ORDER BY CHURN_RATE_PERCENT DESC;

-- Analysis 6: Customer Churn by Tech Support

SELECT
    DBMS_LOB.SUBSTR("Tech_Support", 100, 1) AS TECH_SUPPORT,
    COUNT(*) AS TOTAL_CUSTOMERS,
    SUM(
        CASE
            WHEN DBMS_LOB.SUBSTR("Churn", 100, 1) = 'Yes'
            THEN 1
            ELSE 0
        END
    ) AS CHURNED_CUSTOMERS,
    ROUND(
        100 * SUM(
            CASE
                WHEN DBMS_LOB.SUBSTR("Churn", 100, 1) = 'Yes'
                THEN 1
                ELSE 0
            END
        ) / COUNT(*),
        2
    ) AS CHURN_RATE_PERCENT
FROM CUSTOMER_CHURN
WHERE DBMS_LOB.SUBSTR("Churn", 100, 1) IS NOT NULL
GROUP BY DBMS_LOB.SUBSTR("Tech_Support", 100, 1)
ORDER BY CHURN_RATE_PERCENT DESC;

-- Analysis 7: Customer Churn by Payment Method

SELECT
    DBMS_LOB.SUBSTR("Payment_Method", 100, 1)
        AS PAYMENT_METHOD,
    COUNT(*) AS TOTAL_CUSTOMERS,
    SUM(
        CASE
            WHEN DBMS_LOB.SUBSTR("Churn", 100, 1) = 'Yes'
            THEN 1
            ELSE 0
        END
    ) AS CHURNED_CUSTOMERS,
    ROUND(
        100 * SUM(
            CASE
                WHEN DBMS_LOB.SUBSTR("Churn", 100, 1) = 'Yes'
                THEN 1
                ELSE 0
            END
        ) / COUNT(*),
        2
    ) AS CHURN_RATE_PERCENT
FROM CUSTOMER_CHURN
WHERE DBMS_LOB.SUBSTR("Churn", 100, 1) IS NOT NULL
GROUP BY DBMS_LOB.SUBSTR("Payment_Method", 100, 1)
ORDER BY CHURN_RATE_PERCENT DESC;

-- Analysis 8: Customer Churn by Monthly Charges

SELECT
    CASE
        WHEN "Monthly_Charges" < 1000 THEN 'Low Charges'
        WHEN "Monthly_Charges" < 2000 THEN 'Medium Charges'
        ELSE 'High Charges'
    END AS CHARGE_GROUP,
    COUNT(*) AS TOTAL_CUSTOMERS,
    SUM(
        CASE
            WHEN DBMS_LOB.SUBSTR("Churn", 100, 1) = 'Yes'
            THEN 1
            ELSE 0
        END
    ) AS CHURNED_CUSTOMERS,
    ROUND(
        100 * SUM(
            CASE
                WHEN DBMS_LOB.SUBSTR("Churn", 100, 1) = 'Yes'
                THEN 1
                ELSE 0
            END
        ) / COUNT(*),
        2
    ) AS CHURN_RATE_PERCENT
FROM CUSTOMER_CHURN
WHERE DBMS_LOB.SUBSTR("Churn", 100, 1) IS NOT NULL
GROUP BY
    CASE
        WHEN "Monthly_Charges" < 1000 THEN 'Low Charges'
        WHEN "Monthly_Charges" < 2000 THEN 'Medium Charges'
        ELSE 'High Charges'
    END
ORDER BY CHURN_RATE_PERCENT DESC;

-- Analysis 9: Monthly Revenue by Churn Status

SELECT
    DBMS_LOB.SUBSTR("Churn", 100, 1) AS CHURN_STATUS,
    COUNT(*) AS TOTAL_CUSTOMERS,
    ROUND(AVG("Monthly_Charges"), 2) AS AVG_MONTHLY_CHARGES,
    ROUND(AVG("Monthly_Revenue"), 2) AS AVG_MONTHLY_REVENUE,
    ROUND(SUM("Monthly_Revenue"), 2) AS TOTAL_REVENUE
FROM CUSTOMER_CHURN
WHERE DBMS_LOB.SUBSTR("Churn", 100, 1) IS NOT NULL
GROUP BY DBMS_LOB.SUBSTR("Churn", 100, 1)
ORDER BY CHURN_STATUS;

-- Analysis 10: Contract Type Data Quality Check

SELECT
    NVL(
        DBMS_LOB.SUBSTR("Contract_Type", 100, 1),
        'Unknown/Missing'
    ) AS CONTRACT_TYPE,
    COUNT(*) AS TOTAL_CUSTOMERS,
    SUM(
        CASE
            WHEN DBMS_LOB.SUBSTR("Churn", 100, 1) = 'Yes'
            THEN 1
            ELSE 0
        END
    ) AS CHURNED_CUSTOMERS
FROM CUSTOMER_CHURN
WHERE DBMS_LOB.SUBSTR("Churn", 100, 1) IS NOT NULL
GROUP BY NVL(
    DBMS_LOB.SUBSTR("Contract_Type", 100, 1),
    'Unknown/Missing'
)
ORDER BY TOTAL_CUSTOMERS DESC;

-- Analysis 11: Payment Method Data Quality Check

SELECT
    NVL(
        DBMS_LOB.SUBSTR("Payment_Method", 100, 1),
        'Unknown/Missing'
    ) AS PAYMENT_METHOD,
    COUNT(*) AS TOTAL_CUSTOMERS,
    SUM(
        CASE
            WHEN DBMS_LOB.SUBSTR("Churn", 100, 1) = 'Yes'
            THEN 1
            ELSE 0
        END
    ) AS CHURNED_CUSTOMERS
FROM CUSTOMER_CHURN
WHERE DBMS_LOB.SUBSTR("Churn", 100, 1) IS NOT NULL
GROUP BY NVL(
    DBMS_LOB.SUBSTR("Payment_Method", 100, 1),
    'Unknown/Missing'
)
ORDER BY TOTAL_CUSTOMERS DESC;

-- Analysis 12: Customer Churn Distribution

SELECT
    DBMS_LOB.SUBSTR("Churn", 100, 1) AS CHURN_STATUS,
    COUNT(*) AS TOTAL_CUSTOMERS,
    ROUND(
        100 * COUNT(*) /
        (SELECT COUNT(*)
         FROM CUSTOMER_CHURN
         WHERE DBMS_LOB.SUBSTR("Churn", 100, 1) IS NOT NULL),
        2
    ) AS CUSTOMER_PERCENTAGE
FROM CUSTOMER_CHURN
WHERE DBMS_LOB.SUBSTR("Churn", 100, 1) IS NOT NULL
GROUP BY DBMS_LOB.SUBSTR("Churn", 100, 1)
ORDER BY TOTAL_CUSTOMERS DESC;

-- Analysis 13: Contract Type Churn Rate for Visualization

SELECT
    DBMS_LOB.SUBSTR("Contract_Type", 100, 1) AS CONTRACT_TYPE,
    ROUND(
        100 * SUM(
            CASE
                WHEN DBMS_LOB.SUBSTR("Churn", 100, 1) = 'Yes'
                THEN 1
                ELSE 0
            END
        ) / COUNT(*),
        2
    ) AS CHURN_RATE_PERCENT
FROM CUSTOMER_CHURN
WHERE DBMS_LOB.SUBSTR("Churn", 100, 1) IS NOT NULL
  AND DBMS_LOB.SUBSTR("Contract_Type", 100, 1) IS NOT NULL
GROUP BY DBMS_LOB.SUBSTR("Contract_Type", 100, 1)
ORDER BY CHURN_RATE_PERCENT DESC;

-- Analysis 14: Subscription Type Churn Rate for Visualization

SELECT
    DBMS_LOB.SUBSTR("Subscription_Type", 100, 1)
        AS SUBSCRIPTION_TYPE,
    ROUND(
        100 * SUM(
            CASE
                WHEN DBMS_LOB.SUBSTR("Churn", 100, 1) = 'Yes'
                THEN 1
                ELSE 0
            END
        ) / COUNT(*),
        2
    ) AS CHURN_RATE_PERCENT
FROM CUSTOMER_CHURN
WHERE DBMS_LOB.SUBSTR("Churn", 100, 1) IS NOT NULL
  AND DBMS_LOB.SUBSTR("Subscription_Type", 100, 1) IS NOT NULL
GROUP BY DBMS_LOB.SUBSTR("Subscription_Type", 100, 1)
ORDER BY CHURN_RATE_PERCENT DESC;

-- Analysis 15: Internet Service Churn Rate for Visualization

SELECT
    DBMS_LOB.SUBSTR("Internet_Service", 100, 1)
        AS INTERNET_SERVICE,
    ROUND(
        100 * SUM(
            CASE
                WHEN DBMS_LOB.SUBSTR("Churn", 100, 1) = 'Yes'
                THEN 1
                ELSE 0
            END
        ) / COUNT(*),
        2
    ) AS CHURN_RATE_PERCENT
FROM CUSTOMER_CHURN
WHERE DBMS_LOB.SUBSTR("Churn", 100, 1) IS NOT NULL
  AND DBMS_LOB.SUBSTR("Internet_Service", 100, 1) IS NOT NULL
GROUP BY DBMS_LOB.SUBSTR("Internet_Service", 100, 1)
ORDER BY CHURN_RATE_PERCENT DESC;

