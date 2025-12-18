CREATE TABLE DimUbigeo (
    id_ubigeo INT PRIMARY KEY,
    ubigeo CHAR(6) NOT NULL,
    departamento NVARCHAR(100),
    codigo_departamento INT,
    provincia NVARCHAR(100),
    codigo_provincia INT,
    distrito NVARCHAR(100),
    codigo_distrito INT,
    tipomuni INT,
    region_natural NVARCHAR(50),
    clasificacion_municipalidad CHAR(1),
    tipo_muni_desc NVARCHAR(100)
);
