library(nycflights13)
library(tidyverse)
library(plyr)

m <- flights |>
  filter(dest == "IAH") |> 
  group_by(year, month, day) |> 
  summarize(
    arr_delay = mean(arr_delay, na.rm = TRUE)
  )

p <- m |> ggplot(aes(x = 1:nrow(m), y = arr_delay)) +
  #p <- m |> ggplot(aes(x = month, y = arr_delay)) +
  geom_line() + 
  theme_minimal()
print(p)

#arrange
m <- flights |> 
  arrange(desc(dep_delay))

#mutate
m <- flights |> 
  mutate(
    gain = dep_delay - arr_delay,
    speed = distance / air_time * 60
  )


m <- flights |> 
     mutate(
     gain = dep_delay - arr_delay,
     hours = air_time / 60,
     gain_per_hour = gain / hours,
     .keep = "used"
  )

#select
m <- flights |> 
     select(year, month, day)

m <- flights |> 
     select(!year:day)

m <- flights |> 
     select(where(is.character))

m<- flights |> 
    rename(tail_num = tailnum) |> 
    select(tail_num)

m <- flights |> 
  relocate(time_hour)

m <- flights |> 
  filter(dest == "IAH") |> 
  mutate(speed = distance / air_time * 60) |> 
  select(year:day, dep_time, carrier, flight, speed) |> 
  arrange(desc(speed))

m <- flights |> 
  group_by(month) |> 
  summarize(
    avg_delay = mean(dep_delay, na.rm = T),
    n = n()
  )

m <- billboard |> 
    pivot_longer(
    cols = starts_with("wk"), 
    names_to = "week", 
    values_to = "rank"
  )
m <- billboard |> 
  pivot_longer(
    cols = starts_with("wk"), 
    names_to = "week", 
    values_to = "rank",
    values_drop_na = TRUE
  ) |>
  mutate(week = parse_number(week))

p <- m |> filter(artist == "Bon Jovi") |>
  ggplot(aes(x = week, y = rank)) +
  geom_line() +
  ylim(1,105) #escala do eixo y
  theme_minimal()


print(p)




p <- m  |> 
  ggplot(aes(x = week, y = rank, group = track)) + 
  geom_line(alpha = 0.25) + 
  scale_y_reverse() + 
  theme_minimal()
print(p)

m <- who2 |> 
  pivot_longer(
    cols = !(country:year),
    names_to = c("diagnosis", "gender", "age"), 
    names_sep = "_",
    values_to = "count"
  ) |> 
  mutate(age_new = case_when(
    age == "014" - "0-14",
    age == "1524" - "15-24",
    age == "2534" - "25-34",
    age == "3544" - "35-44",
    age == "4554" - "45-54",
    age == "5564" - "55-64",
    .default = "65-INF"
  )
  ) |>
  relocate(age_new, .after = age) |>
    separate(age_new, c("age1","age2"), remove = F)

m <- m |> mutate(gender2 = as.factor(gender), .after = gender) |> 
  mutate(gender2 = revalue(gender,
                           c("m" = "male", "f" = "female")))
  relocate(gender2, .after = gender)
