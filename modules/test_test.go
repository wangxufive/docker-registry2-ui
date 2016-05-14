package modules_test

import (
  "testing"

  "github.com/wangxufire/docker-registry2-ui/modules"
)

func TestBasicAuthFails(t *testing.T) {
  t.Log(modules.Test())
}
