> library(gridExtra)
> library(grid)
> library(dplyr)
> 
> # Constants
> fps_to_m_s <- 0.3048
> grain_to_kg <- 0.00006479891
> 
> # Cartridge data
> dope_data <- data.frame(
+     Cartridge = c("340 Weatherby Magnum", "338 Lapua Magnum", "375 H&H Magnum"),
+     Grain = c(250, 285, 300),
+     Velocity_fps = c(2963, 2830, 2559),
+     Coriolis_in = c(5.0, 5.4, 6.0)
+ )
> 
> # Convert units and calculate impact energy
> dope_data <- dope_data %>%
+     mutate(
+         Mass_kg = Grain * grain_to_kg,
+         Velocity_ms = Velocity_fps * fps_to_m_s,
+         Energy_J = 0.5 * Mass_kg * Velocity_ms^2,
+         Energy_lower = Energy_J * 0.992,
+         Energy_upper = Energy_J * 1.008,
+         Wind_mph = 8.5
+     )
> 
> # Prepare table for display
> table_data <- dope_data %>%
+     select(Cartridge, Grain, Velocity_fps, Energy_J, Energy_lower, Energy_upper, Coriolis_in) %>%
+     rename(
+         "Cartridge" = Cartridge,
+         "Grain (gr)" = Grain,
+         "Velocity (fps)" = Velocity_fps,
+         "Impact Energy (J)" = Energy_J,
+         "Energy ±0.8% Lower" = Energy_lower,
+         "Energy ±0.8% Upper" = Energy_upper,
+         "Coriolis Drop (in)" = Coriolis_in
+     )
> 
> # Create a tableGrob
> dope_table <- tableGrob(
+     table_data,
+     rows = NULL,  # no row names
+     theme = ttheme_default(
+         core = list(fg_params=list(col="#003366", cex=1), 
+                     bg_params=list(fill=c("#E6F0FA", "#CFE0F8", "#B0D0F0"))),
+         colhead = list(fg_params=list(col="white", fontface="bold", cex=1),
+                        bg_params=list(fill="#003366"))
+     )
+ )
> 
> # Add a title above the table
> title <- textGrob(
+     "DOPE Sheet - Long Range Test (Wind: 8.5 mph, 300 yd Zero, 1000 yd Observation)",
+     gp=gpar(fontsize=14, fontface="bold", col="#003366")
+ )
> 
> # Arrange title and table together
> grid.arrange(title, dope_table, nrow=2, heights=c(0.1, 0.9))
> 
> 
