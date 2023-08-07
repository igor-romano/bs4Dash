# Esse código gera a ui de um bs4Dash
library(shiny)
library(bs4Dash)


ui <- bs4DashPage(
  bs4DashNavbar(),
  bs4DashSidebar(
    bs4SidebarMenu(
      bs4SidebarMenuItem("Página 1", tabName = "pagina1"),
      bs4SidebarMenuItem("Página 2", tabName = "pagina2")
    )
  ),
  bs4DashBody(
    tabItems(
      tabItem(tabName = "pagina1",
              
              textInput("email", "Informe seu e-mail"),
              actionButton("enviar", "Enviar dados")      
              
      ),
      tabItem(tabName = "pagina2")
    )
  )
)
server <- function(input, output, session) {
  observeEvent(input$enviar,{
    updateTextInput(session, "email", value = "")
  })
  
}

shinyApp(ui, server)