# Load ggplot2
> library(ggplot2)
> 
> # Create the data frame
> energy_data <- data.frame(
+     Cartridge = c("340 Weatherby Magnum",
+                   "338 Lapua Magnum",
+                   "375 H&H Magnum"),
+     Energy_J = c(6607, 6878, 5915)
+ )
> 
> # Create histogram
> ggplot(energy_data, aes(x = Energy_J)) +
+     geom_histogram(
+         binwidth = 200,
+         boundary = 0,
+         closed = "left",
+         fill = "steelblue",
+         color = "black"
+     ) +
+     labs(
+         title = "Histogram of Rifle Bullet Impact Energy",
+         x = "Impact Energy (Joules)",
+         y = "Frequency"
+     ) +
+     theme_minimal(base_size = 14) +
+     theme(
+         plot.title = element_text(hjust = 0.5, face = "bold"),
+         axis.title = element_text(face = "bold"),
+         panel.grid.minor = element_blank()
+     )
> 
> 
> 
