// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require activestorage
//= require turbolinks
//= require jquery
//= require bootstrap-sprockets
//= require_tree .
//= require moment

//= require moment/ja.js
//= require tempusdominus-bootstrap-4.js


//= require fullcalendar



// 画像スライダー(マウスオーバーで表示画像を変える)
$(function() {

  $('.a').slick({
      dots: true,
      autoplay: true,
    　autoplaySpeed: 4000,
  });
/*
  $('.slick-dots li').on('mouseover', function() {
    $('.a').slick('goTo', $(this).index());
  });
  */

// ３枚を表示させるスライダー
  $('.d').slick({
    dots: true,
    autoplay: true,
    autoplaySpeed: 4000,
    arrows: true,
    slidesToShow: 3,
    slidesToScroll: 1,
  });
});




//$('.button').on('click',function(){
// var s = getdocumentbyId('#slider_id');
//  alert(s.slick('slickGetOption','autoplay'));
//});

