USE hospital_data;
GO

CREATE OR ALTER VIEW dbo.vw_staff AS
SELECT
    staff_id,
    name,
    department_id,
    role,

    TRY_CONVERT(DECIMAL(12,2), salary) AS salary,

    TRY_CONVERT(DATE, joining_date) AS joining_date,

    shift,
    phone,
    email,
    address,

    Column11,
    Column12

FROM dbo.Staff;
GO

SELECT TOP 20 *
FROM dbo.vw_staff;


