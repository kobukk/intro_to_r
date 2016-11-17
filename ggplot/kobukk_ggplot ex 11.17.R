library(ggplot2)
library(dplyr)

install.packages("data.table")
library(data.table)

load("suicides.rdata")
all_suicides <- copy(suicides)

suicides <- suicides %>%
  group_by(year, state, means) %>%
  mutate(deaths = sum(deaths))

## the most basic

bare <- ggplot(suicides)

## add plot asethetics

aestetic <- ggplot(suicides, aes(x=year, y=deaths))

## add points 

scatter <- ggplot(suicides, aes(x=year, y=deaths)) +
         geom_point()

## split means by color 

color_by_means <- ggplot(suicides, aes(x=year, y=deaths, color=means)) +
             geom_point()

## facet by state

state_facet <- ggplot(suicides, aes(x=year, y=deaths, color=means)) +
          geom_point() +
          facet_wrap(~state, scales="free")
state_facet

## line plot

line_by_state <- ggplot(suicides, aes(x=year, y=deaths, color=means)) +
  geom_line(size=2) +
  facet_wrap(~state, scales="free")
line_by_state

## bar plot

bar_plot <- ggplot(suicides, aes(x=year, y=deaths, color=means)) +
        geom_bar(aes(fill=means), stat='identity') +
        facet_wrap(~state, scales="free")
bar_plot









