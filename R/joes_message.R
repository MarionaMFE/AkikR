joes_message <- function(){
  x <- readline("Hi Akika. Do you really want to leave DCM? :( --(Y/N)    ")
  while(!x %in% c("Y", "N")) {
    x <- readline("Akika, please enter Y or N. :D    ")
  }
  if (x == "Y") {
    y <- readline("Hmmm. Not quite the response I was expecting. :D Are you sure? (Y/N)    ")
    while(!y %in% c("Y", "N")) {
      y <- readline("Akika, please enter Y or N. :D    ")
    }
    if (y == "Y") {
      print("Okay. I'm really sad to see you go as you are my first buddy here at MfE when we started almost at the same time!")
      print("But I'm also very happy about your new appointment.")
      print("I'm sure your new team will benefit from your skills and that you will continue to grow wide and deep in your career.")
      print("I'll see you around!")
      print("--Joe")
    }
    else {
      print("Yay! You made a great decision! JK!")
    }
  }
  else {
    print("Yay! You made a great decision! JK")
  }
}
joes_message()
