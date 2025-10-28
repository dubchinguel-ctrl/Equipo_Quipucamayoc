## Equipo Quipucamayoc

 #### Evaluación de servicios ecosistémicos de regulación hídrica, almacenamiento de carbono y pastizales, para la gestión de ecosistemas altoandinos: caso Picotani - Puno
### Objetivo del proyecto

<p>
Evaluar los servicios ecosistémicos de regulación hídrica, almacenamiento de carbono y pastizales, para la gestión de ecosistemas altoandinos en el ámbito de Picotani, provincia de Carabaya, Región de Puno. 
</p>

# README de Datos del Proyecto Picotani

Este repositorio contiene dos grupos de datos documentados conforme a los lineamientos del Datathon:

## 1. DatosUsadosDeCIP/


| Nombre del dataset                                               | Fuente | Año / Fecha | Variables clave                         | Formato / Tamaño | Preprocesamiento aplicado                  |
| ---------------------------------------------------------------- | ------ | ----------- | --------------------------------------- | ---------------- | ------------------------------------------ |
| Assessment of grassland condition – biomasa y digestibilidad     | SERFOR | 2024        | Biomasa seca (g/m²), digestibilidad (%) | Excel (.xlsx)    | Limpieza básica, homogenización de nombres |
| Assessment of grassland condition – forage availability          | SERFOR | 2024        | Cobertura y disponibilidad de forraje   | Excel (.xlsx)    | Limpieza básica, homogenización de nombres |
| Georreferenciación Picotani                                      | Trabajo de campo | 2024–2025 | Clases de uso de suelo (Lat/Long)        | Excel .csv             | Sin cambios        |

## Clasificación de la Cuenca Picotani

Este proyecto documenta el proceso de clasificación supervisada de uso y cobertura del suelo en la cuenca Picotani, empleando un enfoque integrado de teledetección, análisis geoespacial y datos de muestreo en campo.

## Objetivo

Generar un mapa temático de la cuenca Picotani con alta precisión, utilizando datos satelitales multitemporales combinados con 383 puntos de muestreo verificados en campo.

## Metodología General

* **Delimitación del área de estudio** mediante rasterización del atributo `Reg_class`.
* **Construcción de mosaicos anuales** Landsat 5/7/8/9 (y Sentinel-2 según disponibilidad).
* **Preprocesamiento**: máscara de nubes y sombras, reflectancia (0–10 000), composición mediana anual.
* **Datos de campo**: 383 puntos, 10 clases de uso identificadas.
* **Índices espectrales**: NDSI, NDVI, NDWI en escala byte (0–200).
* **Variable auxiliar**: pendiente (slope) derivada de SRTM.
* **Etiquetado**: propiedad `clase`, partición 70 % entrenamiento / 30 % validación.

## Algoritmos de Clasificación Implementados

* Random Forest (RF) → **modelo final seleccionado**.
* Classification and Regression Tree (CART).
* Support Vector Machine (SVM).

## Resultados de Precisión

| Indicador                    | Valor              | Umbral recomendado |
| ---------------------------- | ------------------ | ------------------ |
| OA (Exactitud Global)        | 0.85               | > 0.85             |
| Kappa                        | 0.75               | > 0.75 excelente   |
| UA (Precisión del Usuario)   | 0.92 / 0.78 / 0.90 | > 0.80             |
| PA (Precisión del Productor) | 0.88 / 0.82 / 0.92 | > 0.80             |

Resultado: clasificación robusta y científicamente aceptable.

## Exportación

Mosaico clasificado e indicadores exportados a **Assets** y **Google Drive** para respaldo y análisis comparativo.


## 2. DatosSecundarios/

## README – Modelo Hidrológico (AQUATOOL / EVALIHD)
El modelo hidrológico fue desarrollado en la plataforma **AQUATOOL** ([https://aquatool.webs.upv.es/aqt/](https://aquatool.webs.upv.es/aqt/)) utilizando el módulo **EVALIHD**, el cual permite implementar modelos de tipo **Precipitación–Escorrentía**. El modelo aplicado corresponde al **modelo Témez**, que estima la generación de escorrentía superficial a partir de **precipitación**, **temperatura** y **evapotranspiración potencial**, además de calcular la **infiltración** en cada subcuenca.

Previo a la configuración de la topología del modelo, se realizó la **preparación de los datos de entrada** utilizando información climática y de caudales del conjunto **PISCO – SENAMHI**.

### Variables utilizadas para el modelamiento hidrológico


| Nombre del Dataset                      | Fuente            | Año/Fecha | Variables clave              | Tamaño/Formato | Preprocesamiento     |
| --------------------------------------- | ----------------- | --------- | ---------------------------- | -------------- | -------------------- |
| PISCO_Tem_Max                           | SENAMHI HSR PISCO | 1981–2016 | Temperatura Máxima (°C)      | 49.3 MB / .nc  | Sin preprocesamiento |
| PISCO_Tem_Min                           | SENAMHI HSR PISCO | 1981–2016 | Temperatura Mínima (°C)      | 49.3 MB / .nc  | Sin preprocesamiento |
| PISCOEVAPO                              | SENAMHI HSR PISCO | 1981–2016 | Evapotranspiración potencial | 49.3 MB / .nc  | Sin preprocesamiento |
| PISCOPrec                               | SENAMHI HSR PISCO | 1981–2016 | Precipitación (mm/mes)       | 44.44 MB / .nc | Sin preprocesamiento |
| PISCOQdal                               | SENAMHI HSR PISCO | 1981–2016 | Caudal (m³/s)                | 6.08 MB / .nc  | Sin preprocesamiento |
| Evapotranspiración_media_682_parte_alta | SENAMHI HSR PISCO | 1981–2016 | Evapotranspiración (mm/mes)  | 12 KB / .csv   | Extraído con RStudio |
| Evapotranspiración_media_682_parte_baja | SENAMHI HSR PISCO | 1981–2016 | Evapotranspiración (mm/mes)  | 12 KB / .csv   | Extraído con RStudio |
| Evapotranspiración_media_picotani       | SENAMHI HSR PISCO | 1981–2016 | Evapotranspiración (mm/mes)  | 12 KB / .csv   | Extraído con RStudio |
| Precipitacion_Media_682_parte_alta      | SENAMHI HSR PISCO | 1981–2016 | Precipitación media          | 12 KB / .csv   | Extraído con RStudio |
| Precipitacion_Media_682_parte_baja      | SENAMHI HSR PISCO | 1981–2016 | Precipitación media          | 12 KB / .csv   | Extraído con RStudio |
| Precipitacion_Media_picotani            | SENAMHI HSR PISCO | 1981–2016 | Precipitación media          | 12 KB / .csv   | Extraído con RStudio |
| Temperatura_Media_682_parte_alta        | SENAMHI HSR PISCO | 1981–2016 | Temperatura promedio (°C)    | 12 KB / .csv   | Extraído con RStudio |
| Temperatura_Media_682_parte_baja        | SENAMHI HSR PISCO | 1981–2016 | Temperatura promedio (°C)    | 12 KB / .csv   | Extraído con RStudio |
| Temperatura_Media_picotani              | SENAMHI HSR PISCO | 1981–2016 | Temperatura promedio (°C)    | 12 KB / .csv   | Extraído con RStudio |
| 682                                     | SENAMHI HSR PISCO | 2025      | Área cuenca 682              | 9 KB / .shp    | Sin cambios          |
| Cuenca_682_parte-alta                   | SENAMHI HSR PISCO | 2025      | Subcuenca alta               | 12 KB / .shp   | Adaptado para modelo |
| Cuenca_682_parte-baja                   | SENAMHI HSR PISCO | 2025      | Subcuenca baja               | 19 KB / .shp   | Adaptado para modelo |
| Cc_picotani_WGS84                       | CIP               | 2025      | Área de estudio              | 29 KB / .shp   | Sin cambios          |
| Leer_pisco_qdal                         | —                 | 2025      | Extracción de datos          | 5 KB / .R      | Script de apoyo      |

---

## Datos espaciales

 `Datos_SIG`

| Nombre del Dataset      | Fuente            | Año/Fecha | Descripción        | Tamaño/Formato    | Preprocesamiento             |
| ----------------------- | ----------------- | --------- | ------------------ | ----------------- | ---------------------------- |
| Cuenca_682_Area_Estudio | SENAMHI HSR PISCO | 2025      | Área de subcuencas | 53 KB / .shp      | Adaptado al estudio          |
| Rios_Cuenca             | —                 | 2025      | Red hídrica        | 262 KB / .shp     | Generado desde DEM           |
| Datos_SIG               | —                 | 2025      | Proyecto completo  | 6 MB / ArcGIS MXD | Contiene datasets anteriores |


###  Flujo general del modelo

1. Preparación de datos en RStudio.
2. Configuración de subcuencas en AQUATOOL.
3. Carga de series de precipitación, ETp, temperatura y caudal.
4. Selección del modelo Témez y calibración automática.
5. Optimización de parámetros.
6. Estimación de infiltración anual.

## 3. Valorización Económica

## 1. Valoración del Servicio de Almacenamiento de Carbono

**Superficie evaluada (ha):**

* Bofedal inundado: 1183
* Bofedal con pasto: 1997
* Pajonal: 510
* Pajonal y pastizal de puna: 182
* Pajonal, pastizal y afloramiento rocoso: 1155
* Pastizal de puna: 10 260
* **Total:** 15 287 ha

**Contenido de carbono en suelo (tC/ha):** valores entre 171 y 230 tC/ha.
**Conversión a CO₂:** factor 3.67 → subtotal 4435.01 tCO₂/ha.
**Precio social del carbono (MEF):** 30 US$/tCO₂.
**Valor económico estimado total:** **US$ 347,083,394.93**.

## 2. Valoración de Provisión de Alimentos (Pasto)

* Área total: 15 287 ha → 40 % con cobertura: 6044.48 ha.
* Biomasa seca producida: 1777.04 kg MS/ha.año.
* Biomasa disponible utilizable: 5 759 475.61 kg MS/año.
* Costo evitado (rye grass): 0.64 S/kg MS.
* **Ahorro anual total:** 3 677 658.32 S → **US$ 1 081 664.21**.

## 3. Valoración del Servicio de Regulación Hídrica

**Volumen recargado:** 84.93 hm³/año → agrícola 79.9 %, consumo humano 5.1 %.

### 3.1 Actividad Agrícola

* Demanda papa bajo riego: 0.00666 hm³/ha.
* Hectáreas beneficiarias: 10 187.99 ha.
* VAB papa: 8 996.64 S/ha.
* **Valor económico anual:** **US$ 26 958 151.37**.

### 3.2 Consumo Humano

* Familias beneficiarias: 43 952.
* DAP promedio: 58.56 S/año.familia.
* **Valor económico anual:** **US$ 757 001.64**.

## 4. Resumen General

| Servicio                      | Valor estimado (US$) |
| ----------------------------- | -------------------- |
| Almacenamiento de CO₂         | 347 083 394.93       |
| Provisión de pasto            | 1 081 664.21         |
| Regulación hídrica – agrícola | 26 958 151.37        |
| Regulación hídrica – humano   | 757 001.64           |
| **Total beneficios**          | **375 880 212.16**   |
