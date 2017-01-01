// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require tether
//= require bootstrap-sprockets
//= require bootstrap-toggle
//= require jquery-ui.min
//= require jplayer
//= require keymaster
//= require_tree .


window.onload = function() {

  // initialise auto-hiding navbar

  var prev = 0;
  var $window = $(window);
  var nav = $('.navbar-fixed-bottom');

  $window.on('scroll', function(){
    var scrollTop = $window.scrollTop();
    nav.toggleClass('navbar-slideout', scrollTop > prev);
    prev = scrollTop;
  });


  // autofocus inputs on modals

  $('#new-collection').on('shown.bs.modal', function () {
    $('#collection_title').focus();
  });

  $('#new-tape').on('shown.bs.modal', function () {
    $('#spotify_query').focus();
  });

  $('#edit-collection').on('shown.bs.modal', function () {
    $('#edit_collection_title').focus();
  });

  // bind shortcut keys

  key.unbind('r, c, space');

  key('r', function() {
    $('#menu-item-random').trigger('click');
  });

  key('c', function() {
    $('#menu-item-create').trigger('click');
  });

  key('space', function() {
    $('#stop_button').trigger('click');
    return false;
  });

  key(']', function() {
    $('#next_button').trigger('click');
  });

  key('[', function() {
    $('#previous_button').trigger('click');
  });

};