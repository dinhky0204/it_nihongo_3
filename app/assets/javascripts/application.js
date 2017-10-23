// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.//= require components
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
//= require jquery
//= require jquery-ui
//= require rails-ujs
//= require turbolinks
//= require bootstrap
//= require bootstrap-tokenfield
//= require ckeditor/init
//= require materialize-sprockets
//= require materialize
//= require materialize/extras/nouislider
//= require bxslider
//= require game
//= require react
//= require react_ujs
//= require components
// app/assets/javascripts/cable.js
//= require action_cable
//= require_self
//= require_tree ./channels

(function() {
    this.App || (this.App = {});

    App.cable = ActionCable.createConsumer();
}).call(this);

document.addEventListener('DOMContentLoaded', function () {
    if (!Notification) {
        alert('Desktop notifications not available in your browser. Try Chromium.');
        return;
    }

    if (Notification.permission !== "granted")
        Notification.requestPermission();
});

$(document).ready(function(){
    var key_input = ""
    $('a.notifications-icon').click(function(event){
        event.preventDefault();
        $('.notifications .counter').html('').css({'display': 'none'});
        if($('.notifications .box').css('display') == 'block') {
            $('.notifications .box').css({'display': 'none'});
        } else {
            $('.notifications .box').css({'display': 'block'})
        }

        $('body').click(function(e){
            if(!$(e.target).closest('a.notifications-icon').length) {
                $('.notifications .box').css({'display': 'none'});
            }
        });
    });
    // $("#search-container").focusout(function () {
    //     $(".search-result").hide()
    // })
    $("#search-input").keyup(function (e) {
        $(".search-result").show();
        var respon_value
        // console.log($(this).val())
        $.ajax({
            url: "/search",
            type: "POST",
            data: {
                text_search: $(this).val()
            },
            dataType: "script",
            success: function(response) {
                respon_value = JSON.parse(response)
                console.log(respon_value[0].list_game)
                $("#list-item-result").html('')

                for (var i = 0; i<respon_value[0].list_game.length; i++ ) {
                    $("#list-item-result").append('<li class="row"><a href="/games/' + respon_value[0].list_game[i].id + '">' + respon_value[0].list_game[i].name + '</a></li>')
                }

            }
        });
    });

})
