package middleware

// CORS middleware
//
// author wangxufire

import "github.com/gin-gonic/gin"

// enable cors
func CORS(context *gin.Context) {
  context.Writer.Header().Set("Access-Control-Allow-Origin", "*")
  context.Writer.Header().Set("Access-Control-Max-Age", "86400")
  context.Writer.Header().Set("Access-Control-Allow-Methods", "POST, GET, OPTIONS, PUT, DELETE, UPDATE")
  context.Writer.Header().Set("Access-Control-Allow-Headers", "Origin, Content-Type, Content-Length, Accept-Encoding, X-CSRF-Token, Authorization")
  context.Writer.Header().Set("Access-Control-Expose-Headers", "Content-Length")
  context.Writer.Header().Set("Access-Control-Allow-Credentials", "true")

  if context.Request.Method == "OPTIONS" {
    context.AbortWithStatus(200)
  } else {
    context.Next()
  }
}
