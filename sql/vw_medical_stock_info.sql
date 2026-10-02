USE hospital_data;
GO

CREATE OR ALTER VIEW dbo.vw_medical_stock_info AS
SELECT
    medicine_id,
    name AS medicine_name,
    category,
    supplier_id,

    TRY_CONVERT(DECIMAL(12,2), cost_price) AS cost_price,
    TRY_CONVERT(DECIMAL(12,2), unit_price) AS unit_price,
    TRY_CONVERT(INT, stock_qty) AS stock_qty,

    TRY_CONVERT(DATE, expiry_date) AS expiry_date,
    TRY_CONVERT(DATE, manufacture_date) AS manufacture_date,

    batch_number,
    TRY_CONVERT(INT, reorder_level) AS reorder_level,

    supplier_name

FROM dbo.[Medical Stock];
GO


SELECT TOP 20 *
FROM dbo.vw_medical_stock_info;