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
import "../stylesheets/application"
import '@fortawesome/fontawesome-free/js/all'
import 'packs/homes.css'
import 'packs/games.css'
import 'tag.js'


// 星レビューに必要

var jQuery = require('jquery')
global.$ = global.jQuery = jQuery;
window.$ = window.jQuery = jQuery;
// packsの配下にratyがあるため
require('packs/raty')


Rails.start()
Turbolinks.start()
ActiveStorage.start()

// いいね機能の非同期化
//= require jquery
//= require rails-ujs