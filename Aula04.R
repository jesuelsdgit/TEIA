library(nycflights13)
library(tidyverse)
library(plyr)


p <- mpg |> ggplot(aes(x = displ, y = hwy, color = class)) +
  geom_point() +
  theme_minimal() +
  theme(legend.position = "bottom")
print(p)

p <- mpg |> ggplot(aes(x = displ, y = hwy, color = drv)) +
  geom_point() +
  #geom_smooth(method = "lm")+
  geom_smooth(level = 0.99) +
  theme_minimal() +
  theme(legend.position = "bottom")

print(p)

p <- mpg |> ggplot(aes(x = displ, y = hwy)) +
            geom_point() +
            geom_point(
            data = mpg |> filter(class == "2seater"),
            color = "red"
            ) +
            geom_point(
              data = mpg |> filter(class == "2seater"),
              color = "red", shape = "circle open", 
              size = 3
            ) +
            geom_text(
            data = mpg |> filter(between(displ,5,5,5)&
                                   between(hwy,22,28)),
            aes(label = paste(manufacturer, "\n", model)), size = 3
            ) +
            annotate("text", x = 6.5, y = 28,
                    label = "chevrolet \n 2seater",
                    color = "red", size = 3)+
            theme_minimal()

print(p)
