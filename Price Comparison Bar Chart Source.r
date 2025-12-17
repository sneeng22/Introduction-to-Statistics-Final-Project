# Load required library
> library(ggplot2)
> 
> # Create the dataset
> cartridge_prices <- data.frame(
+     Cartridge = c(".340 Weatherby",
+                   ".338 Lapua",
+                   ".375 H&H",
+                   ".338 Winchester",
+                   ".300 PRC",
+                   ".338-378 Weatherby"),
+     Price_USD = c(89.00, 132.00, 109.99, 65.99, 42.99, 195.99)
+ )
> 
> # Create the bar chart
> ggplot(cartridge_prices, aes(x = reorder(Cartridge, Price_USD),
+                              y = Price_USD)) +
+     geom_col(fill = "#1f4fd8", width = 0.7) +
+     geom_text(aes(label = paste0("$", Price_USD)),
+               hjust = -0.1,
+               size = 4,
+               color = "#0b1c4d") +
+     coord_flip() +
+     labs(
+         title = "Price Comparison of Competing Rifle Cartridges",
+         subtitle = "Retail price per box (USD)",
+         x = "Cartridge",
+         y = "Price (USD)"
+     ) +
+     theme_minimal(base_size = 13) +
+     theme(
+         plot.title = element_text(face = "bold", color = "#0b1c4d"),
+         plot.subtitle = element_text(color = "#1f4fd8"),
+         axis.title = element_text(face = "bold"),
+         panel.grid.major.y = element_blank(),
+         panel.grid.minor = element_blank()
+     ) +
+     ylim(0, max(cartridge_prices$Price_USD) * 1.15)
> 
> 
