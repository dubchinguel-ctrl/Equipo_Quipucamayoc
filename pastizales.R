#LEER
datos <- read.table("pastizales.csv", header = TRUE, sep = ";", dec = ".")
datos <- datos[, c("Evaluation_unit","Cover", "Date", "Eval_quadrant","Utilization_degree")]

# 2. Convertir tipos de datos
datos$Eval_quadrant <- as.numeric(datos$Eval_quadrant)
datos$Utilization_degree <- as.numeric(datos$Utilization_degree)
datos$Evaluation_unit <- as.factor(datos$Evaluation_unit)
datos$Cover <- as.factor(datos$Cover)
# 3. Verificar la estructura del dataset
str(datos)
summary(datos)

library(dplyr)

# Resumen por Evaluation_unit
resumen_sitios <- datos %>%
  group_by(Evaluation_unit) %>%
  summarise(
    mean_util = mean(Utilization_degree, na.rm=TRUE),
    sd_util = sd(Utilization_degree, na.rm=TRUE),
    n = n()
  )
print(resumen_sitios)
datos$Sector <- ifelse(grepl("^TAM", datos$Evaluation_unit), "TAM", "CHAL")
datos$Sector <- as.factor(datos$Sector)

library(ggplot2)

ggplot(datos, aes(x=Evaluation_unit, y=Utilization_degree, fill=Cover)) +
  geom_boxplot() +
  ggtitle("Impacto del pastizal por sitio y cobertura") +
  ylab("Grado de utilización (%)") +
  xlab("Sitio (Evaluation_unit)") +
  theme_minimal() +
  facet_wrap(~Sector, scales = "free_x")  # Separa por sector

  