// This file is auto-generated by ./bin/rails stimulus:manifest:update
// Run that command whenever you add a new controller or create them with
// ./bin/rails generate stimulus controllerName

import { application } from "./application"

import HelloController from "./hello_controller.js"
application.register("hello", HelloController)

import DragController from "./drag_controller.js"
application.register("drag", DragController)

import NavbarController from "./navbar_controller.js"
application.register("navbar", NavbarController)

// import SearchProjectsController from "./search_projects_controller.js"
// application.register("search-projects", SearchProjectsController)

import TasksOfStepsController from "./tasks_of_steps_controller.js"
application.register("tasks-of-steps", TasksOfStepsController)
