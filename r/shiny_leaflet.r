# Dynamic Leaflet maps in Shiny applications. https://riptutorial.com/r/example/16144/dynamic-leaflet-maps-in-shiny-applications
# Shiny articles - reactivity. https://shiny.rstudio.com/articles/#reactivity

#Simplest shiny app. File must be called app.R (can't be app.r)
library(shiny)
ui <- fluidPage(
  "Hello, world!"
)
server <- function(input, output, session) {
}
shinyApp(ui, server)

# Javascript function directly in ui declaration
ui <- fluidPage(
  tags$script('
    $(document).on("shiny:inputchanged", function(event) {
      if (event.name === "doySlider") {
        alert("inputchanged event: Change");
      }
    });
  ')
)

# To load external js script, store script under www/myscript.js
ui <- fluidPage(
  tags$script(src="script.js"))

#www/script.js
$(document).on("shiny:inputchanged", function(event) {
  if (event.name === "doySlider") {
    alert('moved');
  }
});

#---- Javascript Events ----#
