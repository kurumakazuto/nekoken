// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"

import "jquery";
import "popper.js";
import "bootstrap";
import "../stylesheets/application";
import "../stylesheets/simple_calendar";
import "../stylesheets/about_style";
//= require jquery
//= require rails-ujs

Rails.start()
Turbolinks.start()
ActiveStorage.start()

$(function(){
  $('.name a').mouseover(function(){
    $('.name a').css({'color': 'purple'});
  });
  $('.name a').mouseout(function(){
    $('.name a').css({'color': 'black'});
  });
});

