# Load libraries
library(ggplot2)
library(dplyr)

# Data (original velocities in m/s)
data <- data.frame(
  Cartridge = c("340 Weatherby Magnum", "338 Lapua Magnum", "375 H&H Magnum"),
  Grain = c(250, 285, 270),
  Velocity_ms = c(945, 936, 850)
)

# Convert m/s to fps
data <- data %>%
  mutate(Velocity_fps = Velocity_ms * 3.28084) %>%
  arrange(Grain)  # Sort by grain (low to high)

# Bar chart
ggplot(data, aes(x = factor(Cartridge, levels = Cartridge),
                 y = Velocity_fps,
                 fill = Grain)) +
  geom_bar(stat = "identity", width = 0.6, color = "black") +
  scale_fill_gradient(
    low = "#add8e6",
    high = "#00008b",
    name = "Grain Weight"
  ) +
  labs(
    title = "Muzzle Velocity by Cartridge and Grain",
    x = "Cartridge",
    y = "Velocity (fps)"
  ) +
  theme_minimal(base_size = 14) +
  theme(
    plot.title = element_text(hjust = 0.5, face = "bold", color = "#003366"),
    axis.title = element_text(face = "bold"),
    axis.text.x = element_text(angle = 15, hjust = 1),
    legend.position = "right",
    panel.grid.major = element_line(color = "#d3d3d3"),
    panel.grid.minor = element_blank()
  )
