package middleware

// RequestId middleware
//
// author wangxufire

import (
  uuid "github.com/satori/go.uuid"
  "github.com/gin-gonic/gin"
)

// Request-Id for response header
func RequestId(context *gin.Context) {
  requestId := context.Request.Header.Get("Set-Request-Id")
  if requestId == "" {
    requestId = uuid.NewV4().String()
  }
  context.Writer.Header().Set("Request-Id", requestId)
  context.Next()
}
