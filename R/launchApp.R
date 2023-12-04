#' @title Run Shiny app
#' @description 
#' Starts Shiny app that allows user to query ctrialsgov database and see
#' relevant histograms and tables
#' @importFrom utils head
#' @importFrom dplyr filter tbl collect
#' @importFrom shiny shinyApp fluidPage titlePanel sidebarLayout sidebarPanel reactive
#' textInput selectInput mainPanel tabsetPanel tabPanel plotOutput renderPlot h3
#' @importFrom DT dataTableOutput renderDataTable
#' @export
launchApp <- function() {
  
  shinyApp(
    # Define UI
    ui <- fluidPage(
      
      # Application title
      titlePanel("Clinical Trials Query"),
      
      # Sidebar with search and dropdown menu of agency class; default shows all studies
      sidebarLayout(
        sidebarPanel(
          textInput("brief_title_kw", "Brief title keywords"),
          selectInput("source_class",
                      label = h3("Sponsor Type"),
                      choices = list("All" = "",
                                     "Ambiguous" = "NA",
                                     "Federal" = "FED",
                                     "Individual" = "INDIV",
                                     "Industry" = "INDUSTRY",
                                     "Network" = "NETWORK",
                                     "NIH" = "NIH",
                                     "Other" = "OTHER",
                                     "Other gov" = "OTHER_GOV",
                                     "Unknown" = "UNKNOWN"),
                      selected = "")
        ),
        
        mainPanel(
          tabsetPanel(
            type = "tabs",
            tabPanel("Phases Plot", plotOutput("distPlot")),
            tabPanel("Endpoint Met", plotOutput("endpointPlot")),
            tabPanel("Conditions Examined", plotOutput("conditionsPlot")),
            tabPanel("Study Types", plotOutput("studyTypesPlot")),
            tabPanel("Countries Involved", dataTableOutput("countries_table")),
          ),
          dataTableOutput("trial_table")
        )
      )
    ),
    
    # Define server logic
    server <- function(input, output) {
      
      get_studies = reactive({
        if (input$brief_title_kw != "") {
          si = input$brief_title_kw |>
            strsplit(",") |>
            unlist() |>
            trimws()
          ret = query_kwds(studies, si, "brief_title", match_all = T)
        } else {
          ret = studies
        }
        if (input$source_class == "NA") {
          ret <- ret |>
            filter(is.na(source_class))
        } 
        else if (input$source_class != "") {  # filter by agency class if one is selected
          ret <- ret |>
            filter(source_class == !!input$source_class)
        }
        ret |> head(1000)
      }
      )
      
      output$distPlot <- renderPlot({
        get_studies() |>
          collect() |>
          create_phase_histogram(studies)
      })
      
      output$endpointPlot <- renderPlot({
        get_studies() |>
          collect() |>
          create_endpoint_histogram(endpoints)
      })
      
      output$conditionsPlot <- renderPlot({
        get_studies() |>
          collect() |>
          create_conditions_histogram(conditions)
      })
      
      output$studyTypesPlot <- renderPlot({
        get_studies() |>
          collect() |>
          create_study_type_histogram()
      })
      
      output$countries_table <- renderDataTable({
        get_studies() |>
          collect() |>
          create_topcountries_table(countries)
      })
      
      output$trial_table = renderDataTable({
        get_studies() |>
          select(nct_id, brief_title, start_date, completion_date) |>
          rename(`NCT ID` = nct_id, `Brief Title` = brief_title,
                 `Start Date` = start_date, `Completion Date` = completion_date)
      })

    }
  
  )
  
}

