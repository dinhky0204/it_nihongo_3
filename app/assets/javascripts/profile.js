/**
 * Created by manhnd on 05/10/2017.
 */
$(document).ready(function() {
    var $btnSets = $('#responsive'),
        $btnLinks = $btnSets.find('a');
    $btnLinks.click(function(e) {
        e.preventDefault();
        $(this).siblings('a.active').removeClass("active");
        $(this).addClass("active");
        var index = $(this).index();
        $("div.user-menu>div.user-menu-content").removeClass("active");
        $("div.user-menu>div.user-menu-content").eq(index).addClass("active");
    });
});

$( document ).ready(function() {
    $("[rel='tooltip']").tooltip();

    $('.view').hover(
        function(){
            $(this).find('.caption').slideDown(250); //.fadeIn(250)
        },
        function(){
            $(this).find('.caption').slideUp(250); //.fadeOut(205)
        }
    );

    var previewAvatar = $('.user-image img');
    $('#user_avatar').change(function(e){
        $('.btn-update-profile').css({
            "display": "inline-block",
        });
        var input = $(e.currentTarget);
        var file = input[0].files[0];
        var reader = new FileReader();
        reader.onload = function(event){
            //image_base64 = event.target.result;
            image_base64 = reader.result;
            previewAvatar.attr("src", image_base64);
        };
        if(file) reader.readAsDataURL(file);
    });

    $('form.edit-profile').change(function () {
        $('.btn-update-profile').css({
            "display": "inline-block",
        });
    });
    $('form.edit-profile .btn-update-profile').click(function () {
       $inputs =  $('form.edit-profile input[type!="hidden"]');
       $('form#form-edit-avatar .other-info').append($inputs);
        $('form#form-edit-avatar').submit();
    });
});