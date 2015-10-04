<!-- --- -->
<!-- output: -->
<!--   md_document: -->
<!--     variant: markdown_github -->
<!-- --- -->

<!-- README.md is generated from README.Rmd. Please edit that file -->



# rtmr #

This is meant to be an R wrapper for the "Remember the Milk" API, with the hope of making things operate in a very R-like fashion.

## Create Tasks ##

We'll start with the basics, creating tasks, and note how we can use R to do it in an R way.


```r

tasks <- c("watch lectures ^wed =\"2 hours\"",
           "do reading ^thu =\"2 hours\"",
           "do problem set ^fri =\"4 hours\"",
           "review problem set ^sat =\"1 hour\"")
add_ask(paste(tasks, "*weekly #MyClass"))
```

## Choose Tasks ##

We can pick our tasks randomly! Or perhaps algorithmically.


```r
quick_tasks <- rtm_search("list:Household timeEstimate\"< 30 minutes\"")
(todays_tasks <- sample(quick_tasks, 3))

## add notes to one of them
notes_add(todays_tasks[1,],
          note_title = "get this plunger model",
          note_text = "XT-9000D... it has super suction power!")

## then complete them when done
complete(todays_tasks)
```

## Apply Some Rules to Tasks ##

Move tasks around, postpone them, using R functions.


```r
inbox <- rtm_search("list:Inbox")

rule_fun <- function(task) {
  if(grepl("narf", task[["name"]]))
    postpone(task)
  else if (grepl("zort", task[["name"]]))
    moveTo(task, "ImportantResearch")
  else if (grepl("poit", task[["name"]]))
    setTags(task, "#chainletter #plan")
}

## note: needs to be split by "task.id" b/c "id" and "name"
## might not be unique
plyr::d_ply(inbox, "task.id", rule_fun, .progress = "text")
```

## Visualization ##

ggplot2? DiagrammeR? Shiny?

