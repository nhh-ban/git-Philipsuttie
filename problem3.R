# Create a scatterplot of log_lk vs. distance (D)
scatter_plot <- ggplot(galaxies, aes(x = D, y = log_lk)) +
  geom_point() +
  labs(
    title = "Scatterplot of Galaxy Distance vs. log_lk",
    x = "Distance from Earth (Mpc)",
    y = "log_lk (Logarithm of Stellar Mass)"
  ) +
  theme_minimal()

# Display the scatterplot
scatter_plot

#As we can see in this scatterplot there is almost no galaxies with a log value of
#above 5 in stellar mass when the distance from Earth increases. This might indicate that 
#with the current technology we are not able to detect and see smaller galaxies further away.
