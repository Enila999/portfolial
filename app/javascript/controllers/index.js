// Import and register all your controllers from the importmap under controllers/*

import { application } from "controllers/application"

// Eager load all controllers defined in the import map under controllers/**/*_controller
import { eagerLoadControllersFrom } from "@hotwired/stimulus-loading"
eagerLoadControllersFrom("controllers", application)

// Lazy load controllers as they appear in the DOM (remember not to preload controllers in import map!)
// import { lazyLoadControllersFrom } from "@hotwired/stimulus-loading"
// lazyLoadControllersFrom("controllers", application)

import NavbarController from "./navbar_controller"
application.register("navbar", NavbarController)

import AnimateTextController from "./animate_text_controller"
application.register("animate-text", AnimateTextController)

import HoverTextController from "./hover_text_home_controller"
application.register("hover-text", HoverTextController)

import LightboxController from "./lightbox_controller"
application.register("lightbox", LightboxController)
