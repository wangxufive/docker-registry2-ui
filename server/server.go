// Golang HTML5 Docker Registry V2 UI Server
//
// author wangxufire

package main

import (
  "html/template"
  "log"
  "net/http"
)

func main() {
  // When get a request at "/", call `MainPageHandler`
  http.Handle("/", http.HandlerFunc(MainPageHandler))

  // Start the server and listen forever on port 8000.
  http.ListenAndServe(":8000", nil)
}

// Handler for the main page, which we wire up to the
// route at "/" below in `main`.
//
func MainPageHandler(w http.ResponseWriter, r *http.Request) {
  // insist the path is just "/".
  if r.URL.Path != "/" {
    w.WriteHeader(http.StatusNotFound)
    return
  }

  t, err := template.ParseFiles("view/index.html")
  if err != nil {
    log.Fatal("error parsing your template.")
  }

  // Render the template, writing to `w`.
  t.Execute(w, "wangxufire")

  // Done.
  log.Println("Finished HTTP request at ", r.URL.Path)
}
