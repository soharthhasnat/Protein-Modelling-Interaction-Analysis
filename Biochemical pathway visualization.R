
# Set working directory to your specific folder
setwd("S:/BSMRAU/Training")

# Load necessary libraries
library(readxl) 
library(ggplot2)
library(dplyr)

# 1. Read the data directly from the Excel file
df <- read_excel("Demo data.xlsx")

# Clean up column names 
colnames(df) <- c("Pathway", "Count")

# 2. Reorder the factor levels
df$Pathway <- factor(df$Pathway, levels = rev(df$Pathway))

# 3. Create the styled bar chart
p <- ggplot(df, aes(x = Count, y = Pathway)) +
  annotate("rect", xmin = -Inf, xmax = Inf, ymin = 0.5, ymax = 15.5, 
           fill = "#E0F7FA", alpha = 0.5) +
  geom_col(fill = "#00FFFF", width = 0.7) +
  annotate("text", x = 62, y = 8, label = "Carbohydrate\nmetabolism", 
           angle = 270, fontface = "bold", size = 5) +
  scale_x_continuous(limits = c(0, 68), expand = c(0, 0)) +
  theme_classic() +
  labs(x = "Gene Number", y = NULL) +
  theme(
    axis.text.y = element_text(size = 11, color = "black", hjust = 1),
    axis.ticks.y = element_blank(), 
    axis.line.y = element_blank(),  
    axis.text.x = element_text(size = 12, color = "black"),
    axis.title.x = element_text(size = 12, face = "bold", margin = margin(t = 10)),
    plot.margin = margin(t = 20, r = 20, b = 20, l = 10)
  )

# 4. Display the plot
print(p)

# Save the plot as a high-resolution PNG image
ggsave("High_Resolution_Plot.png", plot = p, width = 9, height = 6, dpi = 300)
