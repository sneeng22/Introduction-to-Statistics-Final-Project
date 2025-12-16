> # Load libraries
> library(ggplot2)
> library(dplyr)
> 
> # Cartridge data (fps)
> data <- data.frame(
+     Cartridge = c("340 Weatherby Magnum", "338 Lapua Magnum", "375 H&H Magnum"),
+     Velocity_fps = c(2963, 2830, 2559)
+ )
> 
> # Distances
> distances <- data.frame(
+     Distance = c(300, 1000)
+ )
> 
> # Expand data for plotting
> plot_data <- merge(data, distances)
> 
> # Model Coriolis drop assumptions
> # 300 yd = zero
> # 1000 yd ≈ 5.5 inches scaled by inverse velocity (time-of-flight proxy)
> plot_data <- plot_data %>%
+     mutate(
+         Coriolis_in = ifelse(
+             Distance == 300,
+             0,
+             5.5 * (max(Velocity_fps) / Velocity_fps)
+         )
+     )
> 
> # Convert distance to factor for clean bars
> plot_data$Distance <- factor(plot_data$Distance,
+                              levels = c(300, 1000),
+                              labels = c("300 yd (Zero)", "1000 yd"))
> 
> # Plot
> ggplot(plot_data,
+        aes(x = Distance, y = Coriolis_in, fill = Cartridge)) +
+     geom_bar(stat = "identity",
+              position = position_dodge(width = 0.7),
+              width = 0.6,
+              color = "black") +
+     labs(
+         title = "Modeled Coriolis Vertical Deflection\n300 yd vs 1000 yd",
+         x = "Distance",
+         y = "Coriolis Drop (inches)",
+         fill = "Cartridge"
+     ) +
+     theme_minimal(base_size = 14) +
+     theme(
+         plot.title = element_text(
+             hjust = 0.5,
+             face = "bold",
+             color = "#003366"
+         ),
+         axis.title = element_text(face = "bold"),
+         panel.grid.major = element_line(color = "#d3d3d3"),
+         panel.grid.minor = element_blank(),
+         legend.position = "right"
+     ) +
+     scale_fill_manual(
+         values = c("#add8e6", "#6495ED", "#00008b")
