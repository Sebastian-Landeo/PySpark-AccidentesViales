# Análisis de Accidentes Viales en Perú (2021-2023)

##  Tablas de Dimensiones

### 1. **dim_ubigeo.csv**
**Descripción:** Dimensión geográfica que contiene información sobre la división político-administrativa del Perú a nivel de departamento, provincia y distrito.

| Campo | Tipo | Descripción |
|-------|------|-------------|
| `id_ubigeo` | Integer | Identificador único autoincremental |
| `ubigeo` | String(6) | Código UBIGEO de 6 dígitos (CCPPDD) |
| `departamento` | String | Nombre del departamento |
| `codigo_departamento` | String(2) | Código del departamento (01-25) |
| `provincia` | String | Nombre de la provincia |
| `codigo_provincia` | String(2) | Código de la provincia |
| `distrito` | String | Nombre del distrito |
| `codigo_distrito` | String(2) | Código del distrito |
| `tipomuni` | Integer | Tipo de municipalidad (1=Provincial, 2=Distrital, 3=Centro Poblado) |
| `tipo_muni_desc` | String | Descripción del tipo de municipalidad |
| `region_natural` | String | Región natural (Costa, Sierra, Selva) |
| `clasificacion_municipalidad` | String | Clasificación A-G según capacidad de gestión |

**Fuente:** RENAMU 2022, INEI UBIGEO 2022, Clasificación MEF

---

### 2. **dim_tiempo.csv**
**Descripción:** Dimensión temporal que desagrega las fechas y horas de los siniestros para análisis cronológico.

| Campo | Tipo | Descripción |
|-------|------|-------------|
| `pk_tiempo` | String(10) | Clave primaria: YYYYMMDDHH |
| `fecha` | Date | Fecha del siniestro (YYYY-MM-DD) |
| `anio` | Integer | Año (2021-2023) |
| `mes` | Integer | Mes (1-12) |
| `mes_str` | String(2) | Mes con formato de 2 dígitos (01-12) |
| `nombre_mes` | String | Nombre del mes en español |
| `dia` | Integer | Día del mes (1-31) |
| `dia_semana` | String | Nombre del día de la semana |
| `hora_int` | Integer | Hora del día (0-23) |
| `trimestre` | Integer | Trimestre del año (1-4) |
| `semestre` | Integer | Semestre del año (1-2) |

**Fuente:** Derivado de BBDD ONSV - SINIESTROS 2021-2023

---

### 3. **dim_red_vial.csv**
**Descripción:** Información sobre la infraestructura vial nacional, incluyendo carreteras, autopistas y características físicas de las vías.

| Campo | Tipo | Descripción |
|-------|------|-------------|
| `id_red_vial` | Integer | Identificador único autoincremental |
| `cod_red_vial` | Integer | Código original del tramo vial |
| `codigo_ruta` | String | Código de la ruta (ej: PE-1S, PE-3N) |
| `nombre_ruta` | String | Nombre completo de la ruta |
| `id_tramo` | Integer | Número de identificación del tramo |
| `km_inicio` | Float | Kilómetro inicial del tramo |
| `km_final` | Float | Kilómetro final del tramo |
| `longitud_km` | Float | Longitud del tramo en kilómetros |
| `nro_carriles` | Integer | Número de carriles |
| `ancho_calzada` | Float | Ancho de la calzada en metros |
| `tipo_red` | String | Tipo de red (Red Nacional, Red Vial, Otro) |
| `clasificacion` | String | Clasificación (Nacional, Ramal, Transversal, Otro) |
| `es_autopista` | String | Indicador Si/No |
| `sentido` | String | Unidireccional, Bidireccional, Desconocido |
| `cod_departamento` | String | Código INEI del departamento |
| `departamento` | String | Nombre del departamento |
| `cod_provincia` | String | Código INEI de la provincia |
| `region` | String | Región geográfica (Costa, Sierra, Selva) |
| `topografia` | String | Tipo de topografía del terreno |
| `estado_via` | String | Estado de la vía (Montañoso, Plano, Otro) |
| `superficie_km2` | Float | Superficie relevante en km² |
| `logistico` | Float | Índice logístico |
| `operacion` | String | Tipo de operación (RM, Concesión, etc.) |
| `imd` | Float | Intensidad Media Diaria de tráfico |
| `peajes` | String | Información sobre peajes |

**Fuente:** Red Vial Nacional 2024 (MTC)

---

### 4. **dim_personas.csv**
**Descripción:** Características demográficas y condiciones de las personas involucradas en los siniestros viales.

| Campo | Tipo | Descripción |
|-------|------|-------------|
| `id_persona` | Integer | Identificador único autoincremental |
| `cod_persona` | String | Código original de la persona |
| `sexo` | String(1) | M=Masculino, F=Femenino, O=Otro |
| `edad` | Integer | Edad de la persona |
| `grupo_edad` | String | Niño (<12), Adolescente (12-17), Adulto (18-59), Adulto mayor (60+) |
| `tipo_persona` | String | Conductor, Pasajero, Peatón, Otro |
| `gravedad` | String | Fallecido, Herido, Ileso |
| `situacion_persona` | String | Identificado, No identificado |
| `nacionalidad` | String | País de nacionalidad |
| `nacionalidad_otro` | String | Especificación si es otro país |
| `tiene_licencia` | String | Si, No, Desconocido |
| `estado_licencia` | String | Estado de la licencia de conducir |
| `clase_licencia` | String | Clase de licencia (A, B, C, etc.) |
| `dosaje_cualit` | String | Se sometió a dosaje etílico cualitativo (Si/No) |
| `dosaje_cualit_res` | String | Resultado del dosaje cualitativo |
| `dosaje_cuantit` | String | Se sometió a dosaje etílico cuantitativo (Si/No) |

**Fuente:** BBDD ONSV - PERSONAS 2021-2023

---

### 5. **dim_vehiculo.csv**
**Descripción:** Información sobre los vehículos involucrados en los siniestros, incluyendo tipo, modalidad de transporte y estado de documentación.

| Campo | Tipo | Descripción |
|-------|------|-------------|
| `id_vehiculo` | Integer | Identificador único autoincremental |
| `cod_vehiculo` | String | Código original del vehículo |
| `situacion` | String | Identificado, No identificado |
| `estado_modalidad` | String | Estado de la modalidad de transporte |
| `modalidad` | String | Particular, Carga, Pasajeros, Otro |
| `elemento_transportado` | String | Descripción de la carga o elementos |
| `ambito_servicio` | String | Ámbito del servicio de transporte |
| `posee_seguro` | String | Si, No, Desconocido |
| `estado_soat` | String | Estado del SOAT |
| `tipo_seguro` | String | Tipo de seguro vehicular |
| `compania_seguro` | String | Nombre de la compañía aseguradora |
| `posee_citv` | String | Posee certificado de inspección técnica (Si/No) |
| `estado_citv` | String | Estado del CITV |
| `lugar_impacto` | String | Lugar del impacto en el vehículo |
| `tipo_vehiculo` | String | Motocicleta, Camión, Automóvil, Pickup, Otro |
| `tipo_via` | String | Carretera, Avenida, Calle, Otro |

**Fuente:** BBDD ONSV - VEHICULOS 2021-2023

---

### 6. **dim_tipo_siniestro.csv**
**Descripción:** Clasificación de los tipos de siniestros viales según su naturaleza.

| Campo | Tipo | Descripción |
|-------|------|-------------|
| `id_tipo_siniestro` | Integer | Identificador único autoincremental |
| `clase_siniestro` | String | Tipo normalizado: Despiste, Atropello, Choque, Volcadura, Caída de pasajero, etc. |

**Valores comunes:** Despiste, Atropello, Atropello (Fuga), Choque, Choque (Fuga), Choque con objeto fijo, Caída de pasajero, Volcadura, Ferroviario, Incendio, Especial

**Fuente:** BBDD ONSV - SINIESTROS 2021-2023

---

### 7. **dim_causa_siniestro.csv**
**Descripción:** Causas y factores que originaron los siniestros viales.

| Campo | Tipo | Descripción |
|-------|------|-------------|
| `id_causa` | Integer | Identificador único autoincremental |
| `causa_factor` | String | Factor principal normalizado (Conductor-Imprudencia, Conductor-Negligencia, etc.) |
| `categoria_causa` | String | Categorización: Alcohol/Drogas, Velocidad, Maniobras indebidas, Fallas mecánicas, etc. |
| `causa_especifica` | String | Descripción específica de la causa |

**Categorías principales:**
- Alcohol / Drogas
- Velocidad / Conducción temeraria
- Maniobras indebidas
- Desacato a señalización
- Distracción
- Fallas mecánicas
- Conducta del pasajero/peatón
- Entorno / Vía

**Fuente:** BBDD ONSV - SINIESTROS 2021-2023

---

## Tabla de Hechos

### **fact_siniestros.csv**
**Descripción:** Tabla de hechos central que registra cada siniestro vial con sus métricas y relaciones a las dimensiones.

| Campo | Tipo | Descripción |
|-------|------|-------------|
| `id_fact_siniestro` | Integer | Identificador único del hecho |
| `id_siniestro` | String | Código original del siniestro |
| `fk_tiempo` | String(10) | Clave foránea a dim_tiempo |
| `fk_ubigeo` | Integer | Clave foránea a dim_ubigeo |
| `fk_tipo_siniestro` | Integer | Clave foránea a dim_tipo_siniestro |
| `fk_causa_siniestro` | Integer | Clave foránea a dim_causa_siniestro |
| `fk_vehiculo` | Integer | Clave foránea a dim_vehiculo |
| `fk_persona` | Integer | Clave foránea a dim_personas |
| `num_vehiculos` | Integer | Cantidad de vehículos involucrados |
| `num_personas` | Integer | Cantidad de personas involucradas |
| `num_lesionados` | Integer | Cantidad de personas lesionadas |
| `num_fallecidos` | Integer | Cantidad de fallecidos |
| `descripcion_siniestro` | String | Descripción del siniestro |

**Granularidad:** Un registro por cada combinación única de siniestro-vehículo-persona

**Métricas principales:**
- Conteo de siniestros
- Suma de fallecidos
- Suma de lesionados
- Suma de vehículos involucrados

**Fuente:** BBDD ONSV - SINIESTROS 2021-2023

---

## Modelo Dimensional

**Tipo:** Esquema estrella (Star Schema)

**Fact Table:** fact_siniestros

**Dimensiones:**
1. dim_tiempo (temporal)
2. dim_ubigeo (geográfica)
3. dim_tipo_siniestro (descriptiva)
4. dim_causa_siniestro (descriptiva)
5. dim_vehiculo (descriptiva)
6. dim_personas (descriptiva)
7. dim_red_vial (geográfica/infraestructura)

---

## Notas de Transformación

### Limpieza aplicada:
- **Normalización de texto:** Conversión a mayúsculas/minúsculas según corresponda
- **Valores nulos:** Reemplazados por "No identificado", "Desconocido" o "No especificado"
- **UBIGEO:** Formato estandarizado a 6 dígitos con padding de ceros
- **Fechas:** Conversión de dd/MM/yyyy a formato ISO (YYYY-MM-DD)
- **Categorización:** Agrupación de valores similares en categorías estandarizadas

### Calidad de datos:
- Se identificaron y documentaron registros con información faltante
- Se aplicaron reglas de negocio para normalización de campos categóricos
- Se generaron IDs autoincrementales para todas las dimensiones

---

## Período de Análisis
**2021 - 2023**

## Fuentes de Datos
- **ONSV (Observatorio Nacional de Seguridad Vial):** Datos de siniestros, personas y vehículos
- **MTC (Ministerio de Transportes y Comunicaciones):** Red vial nacional
- **INEI:** UBIGEO y división política
- **RENAMU 2022:** Registro Nacional de Municipalidades
- **MEF:** Clasificación de municipalidades
