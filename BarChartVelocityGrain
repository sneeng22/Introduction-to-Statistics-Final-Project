> library("ggplot2")
> # Make sure ggplot2 is loaded
> library(ggplot2)
> 
> # Example data
> data <- data.frame(
+     Grain = c(250, 285, 300),
+     Velocity = c(3000,2850,2559)
+ )
> 
> # Convert Grain to factor to keep order
> data$Grain <- factor(data$Grain, levels = data$Grain)
> 
> # Create bar chart
> ggplot(data, aes(x = Grain, y = Velocity)) +
+     geom_col() +
+     labs(
+         title = "Bullet Velocity by Grain Weight",
+         x = "Bullet Weight (grains)",
+         y = "Muzzle Velocity (fps)"
+     ) +
+     theme_minimal()
> 
>
 

