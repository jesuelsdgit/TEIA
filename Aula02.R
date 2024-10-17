library(tidyverse)
library(janitor)
library(palmerpenguins)
library(readxl)
#library(ggthems)
#x <- read_csv("data/file.csv")
#x <- read_csv("data\\file.csv") #windows
#x <- read_csv(file.path("data","file.csv"))str()

students <- read_csv("https://pos.it/r4ds-students-csv",
                     na = c("N/A",""))
#students <- students |> rename(student_id = 'Student ID',
#                              full_name = 'Full Name')
students <- students |> janitor::clean_names() |>
  mutate(
      age = parse_number(if_else(age == "five", "5", age))
  )

#students <- rename(students,student_id = 'Student ID',
#                   full_name = 'Full Name')
#w <- x |> f(y,z) |> g(t)
w <- f(x,y,z)

p <- penguins |> ggplot(aes(x= flipper_length_mm, 
             y= body_mass_g,
             color = species)) +
  geom_point() +
  theme_bw() +
  theme(legend.position = "bottom")
print(p)

penguins |> map_vec(\(x) sum(is.na(x)))
