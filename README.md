shiny
=====

Shiny is a program that allows you to create interactive web-based plots through RStudio. 

Here is an example of a Shiny app that I created in order to demonstrate some of the utilities of Shiny. To run, open RStudio and run:

install.packages("shiny")
library(shiny)
runGitHub("shiny", "kmpeck")

The app shows a plot of virus evolution rates against virus mutation rates (compiled from Sanjuan 2012 and Sanjuan et al. 2010). 
The user can choose a particular virus to highlight and also whether to display the evolution rate, mutation rate, or virus class.
