# test_colourpicker

Package to test the utilization of `colourpicker` in a package

# Run the package 

## Does not work

```r
if(!require("devtools")) install.packages("devtools")
devtools::install_github("emanuelhuber/testcolourpicker")
library(testcolourpicker)
testcolourpicker::runApp()

```

## Workaround

**Restart R**

```r
if(!require("devtools")) install.packages("devtools")
devtools::install_github("emanuelhuber/testcolourpicker")
library(testcolourpicker)

shiny::addResourcePath("colourpicker-lib/js",
                system.file("www/shared/colourpicker/js", package="colourpicker"))
shiny::addResourcePath("colourpicker-lib/css",
                system.file("www/shared/colourpicker/css",package="colourpicker"))
shiny::addResourcePath("colourpicker-binding",
                system.file("srcjs",package="colourpicker"))
                
testcolourpicker::runApp()

```

# Run the functions

**Restart R**


```r
library(shiny)
library(colourpicker)

# Define UI for application that draws a histogram
shinyAppUI <- fluidPage(

    # Application title
    titlePanel("Old Faithful Geyser Data"),

    # Sidebar with a slider input for number of bins
    sidebarLayout(
        sidebarPanel(
            colourpicker::colourInput(inputId = "col", label = "Farbe 1", value = "#266939"),
            sliderInput("bins",
                        "Number of bins:",
                        min = 1,
                        max = 50,
                        value = 30)
        ),

        # Show a plot of the generated distribution
        mainPanel(
           plotOutput("distPlot")
        )
    )
)

# Define server logic required to draw a histogram
shinyAppServer <- function(input, output) {

    output$distPlot <- renderPlot({
        # generate bins based on input$bins from ui.R
        x    <- faithful[, 2]
        bins <- seq(min(x), max(x), length.out = input$bins + 1)

        # draw the histogram with the specified number of bins
        hist(x, breaks = bins, col = input$col, border = 'white')
    })
}

# # Run the application
shinyApp(ui = shinyAppUI, server = shinyAppServer)


```
