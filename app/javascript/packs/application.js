// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from "@rails/ujs"
// chart.jsでコメントアウト
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"

//追加したが、Ratyでコメントアウト
// import $ from 'jquery';
// import "jquery"

import "popper.js"
import "bootstrap"
import '@fortawesome/fontawesome-free/js/all';

import "../stylesheets/application"
// 追加
import "../stylesheets/about"
import "../stylesheets/pagetop"

Rails.start()
// chart.jsでコメントアウト
Turbolinks.start()
ActiveStorage.start()

window.$ = window.jQuery = require('jquery');

import Raty from "raty.js"
window.raty = function(elem,opt) {
  let raty =  new Raty(elem,opt)
  raty.init();
  return raty;
}
