#LEER
datos <- read.table("Forraje_disponibilidad.csv", header = TRUE, sep = ";", dec = ".")
datos <- datos[, c("Evaluation_unit","Transect", "Cover", "Date", "Subunit","Cover_perc","Fresh_weight")]
# 2. Convertir tipos de datos
datos$Cover_perc <- as.numeric(datos$Cover_perc)
datos$Fresh_weight <- as.numeric(datos$Fresh_weight)
datos$Evaluation_unit <- as.factor(datos$Evaluation_unit)
datos$Transect <- as.factor(datos$Transect)
datos$Cover <- as.factor(datos$Cover)
# Clasificación técnica por rangos de peso fresco
datos$Forraje_class <- cut(
  datos$Fresh_weight,
  breaks = c(-Inf, 50, 100, Inf),
  labels = c("Baja", "Media", "Alta")
)
# Verificar cuántas observaciones hay en cada clase
table(datos$Forraje_class)

# Clasificación automática usando cuartiles
cuartiles <- quantile(datos$Fresh_weight, probs = c(0, 0.33, 0.66, 1), na.rm = TRUE)

datos$Forraje_class <- cut(
  datos$Fresh_weight,
  breaks = cuartiles,
  labels = c("Baja", "Media", "Alta"),
  include.lowest = TRUE
)

# Verificar cuartiles y clases asignadas
cuartiles
table(datos$Forraje_class)


library(dplyr)

resumen <- datos %>%
  group_by(Evaluation_unit, Transect) %>%
  summarise(
    mean_cover = mean(Cover_perc, na.rm = TRUE),
    mean_fresh = mean(Fresh_weight, na.rm = TRUE),
    forraje_class_mode = names(sort(table(Forraje_class), decreasing = TRUE))[1]
  )

print(resumen)
#grafica por tipo de cobertura

library(ggplot2)

ggplot(datos, aes(x = Evaluation_unit, y = Fresh_weight, fill = Forraje_class)) +
  geom_boxplot() +
  labs(
    title = "Disponibilidad de forraje por unidad de evaluación",
    x = "Unidad de evaluación",
    y = "Peso fresco (g)",
    fill = "Clase de disponibilidad"
  ) +
  theme_minimal()
