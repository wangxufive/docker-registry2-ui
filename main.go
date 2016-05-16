package main

// Golang HTML5 Docker Registry V2 Web UI Server
//
// author wangxufire

import (
  "net/http"

  "github.com/gin-gonic/gin"
  "github.com/wangxufire/docker-registry2-ui/middleware"
  "github.com/wangxufire/docker-registry2-ui/support"
)

func main() {
  // Creates a router without any middleware by default
  router := gin.New()

  // Global middleware
  router.Use(gin.Logger())
  router.Use(gin.Recovery())
  router.Use(middleware.CORS)
  router.Use(middleware.RequestId)

  router.Static("/resources", "./resources")

  // Set html render options
  htmlRender := GinHtmlRender.New()
  htmlRender.Debug = gin.IsDebugging()
  htmlRender.TemplatesDir = "resources/"

  // Tell gin to use our html render
  router.HTMLRender = htmlRender.Create()

  router.GET("/registry", func(context *gin.Context) {
    context.HTML(http.StatusOK, "index", nil)
  })

  1
  router.Run(":8000")
}
