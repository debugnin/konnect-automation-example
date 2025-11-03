

# Quick Summary Dashboard based on provided JSON - Corrected Format
resource "konnect_dashboard" "quick_summary_dashboard" {
  provider = konnect-beta
  name     = "Quick Summary Dashboard"
  
  definition = {
    tiles = [
      {
        chart = {
          definition = {
            chart = {
              timeseries_line = {
                chart_title = "Total traffic over time"
                type        = "timeseries_line"
              }
            }
            query = {
              api_usage = {
                datasource = "api_usage"
                dimensions = ["time"]
                metrics    = ["request_count"]
              }
            }
          }
          layout = {
            position = {
              col = 0
              row = 0
            }
            size = {
              cols = 6
              rows = 2
            }
          }
          type = "chart"
        }
      },
      {
        chart = {
          definition = {
            chart = {
              horizontal_bar = {
                chart_title = "Top gateway services by requests"
                stacked     = true
                type        = "horizontal_bar"
              }
            }
            query = {
              api_usage = {
                datasource = "api_usage"
                dimensions = ["gateway_service"]
                filters = [
                  {
                    field    = "gateway_service"
                    operator = "not_empty"
                  }
                ]
                metrics = ["request_count"]
              }
            }
          }
          layout = {
            position = {
              col = 0
              row = 2
            }
            size = {
              cols = 2
              rows = 2
            }
          }
          type = "chart"
        }
      },
      {
        chart = {
          definition = {
            chart = {
              horizontal_bar = {
                chart_title = "Top routes by requests"
                stacked     = true
                type        = "horizontal_bar"
              }
            }
            query = {
              api_usage = {
                datasource = "api_usage"
                dimensions = ["route"]
                filters = [
                  {
                    field    = "route"
                    operator = "not_empty"
                  }
                ]
                metrics = ["request_count"]
              }
            }
          }
          layout = {
            position = {
              col = 2
              row = 2
            }
            size = {
              cols = 2
              rows = 2
            }
          }
          type = "chart"
        }
      },
      {
        chart = {
          definition = {
            chart = {
              horizontal_bar = {
                chart_title = "Top consumers by requests"
                stacked     = true
                type        = "horizontal_bar"
              }
            }
            query = {
              api_usage = {
                datasource = "api_usage"
                dimensions = ["consumer"]
                filters = [
                  {
                    field    = "consumer"
                    operator = "not_empty"
                  }
                ]
                metrics = ["request_count"]
              }
            }
          }
          layout = {
            position = {
              col = 4
              row = 2
            }
            size = {
              cols = 2
              rows = 2
            }
          }
          type = "chart"
        }
      },
      {
        chart = {
          definition = {
            chart = {
              timeseries_line = {
                chart_title = "Latency breakdown over time"
                type        = "timeseries_line"
              }
            }
            query = {
              api_usage = {
                datasource = "api_usage"
                dimensions = ["time"]
                metrics = [
                  "response_latency_p99",
                  "response_latency_p95",
                  "response_latency_p50"
                ]
              }
            }
          }
          layout = {
            position = {
              col = 0
              row = 4
            }
            size = {
              cols = 3
              rows = 2
            }
          }
          type = "chart"
        }
      }
    ]
  }
  
  labels = {
    template    = "quick_summary"
    created_by  = "terraform"
    environment = "production"
  }
}
