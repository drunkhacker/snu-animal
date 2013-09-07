// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require twitter/bootstrap/affix
//= require twitter/bootstrap/alert
//= require twitter/bootstrap/button
//= require twitter/bootstrap/carousel
//= require twitter/bootstrap/collapse
//= require twitter/bootstrap/dropdown
//= require twitter/bootstrap/modal
//= require twitter/bootstrap/tooltip
//= require twitter/bootstrap/popover
//= require twitter/bootstrap/scrollspy
//= require twitter/bootstrap/tab
//= require twitter/bootstrap/transition
//= require moment.min
//= require_self

$(document).ready(function() {
  $('.animal-badge-detail').popover({placement: "auto", trigger: "hover", container: "body"});
  $('.animal-badge-closed').popover({placement: "auto", trigger: "hover", container: "body", content: "내가 누구게?"});
})
