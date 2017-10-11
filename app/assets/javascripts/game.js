$(document).ready(function () {

    if(window.location.pathname == "/games/new") {
        var list_genre = {};
        var list = gon.genres;

        $.each(list, function(index, tmp) {
            var tag = tmp.name;
            list_genre[tag] = null;
        });
    }

    function readURL(input) {

        if (input.files && input.files[0]) {
            var reader = new FileReader();

            reader.onload = function (e) {
                $('#new_photo').attr('src', e.target.result);
            }

            reader.readAsDataURL(input.files[0]);
        }
    }

    $("#game_photo").change(function(){
        readURL(this);
    });
    $('select').material_select();
    $('.chips').material_chip('data');
    var test = {
        'Apple': null,
        'Microsoft': null,
        'Google': null
    };
    $("#create_game").click(function () {
        var chip_data = $('.chips-autocomplete').material_chip('data');
        console.log(chip_data[0].tag);
        $("#test_genre").val(JSON.stringify(chip_data));
    });
    $('.chips-autocomplete').material_chip({
        autocompleteOptions: {
            data: list_genre,
            limit: Infinity
        }
    })
    $("#rate").off("click");;
    $("#rate").on('click', function () {
        var get_url = window.location.pathname.split("/")
        var comment = $("#icon_prefix2").val()
        var respon_value
        Materialize.toast('You Rated', 4000);
        console.log('okok');
        game_id = get_url[2]
        $.ajax({
            url: "/rate",
            type: "POST",
            data: {
                point: $("#rate-point").val(),
                game_id: game_id,
                comment: $("#icon_prefix2").val()
            },
            dataType: "script",
            success: function(response) {
                respon_value = JSON.parse(response)
                if (respon_value[0].status != "2") {
                    $('#bar-five').animate({
                        width: respon_value[0].point5}, 1000);
                    $('#bar-four').animate({
                        width: respon_value[0].point4}, 1000);
                    $('#bar-three').animate({
                        width: respon_value[0].point3}, 1000);
                    $('#bar-two').animate({
                        width: respon_value[0].point2}, 1000);
                    $('#bar-one').animate({
                        width: respon_value[0].point1}, 1000);
                    setTimeout(function() {
                        $('.bar span').fadeIn('slow');
                    }, 1000);
                    $('#point_avg').text(respon_value[0].new_point);
                    $("#total-rating").text(respon_value[0].total + " total");
                    $("#star-1").text(respon_value[0].star1);
                    $("#star-2").text(respon_value[0].star2);
                    $("#star-3").text(respon_value[0].star3);
                    $("#star-4").text(respon_value[0].star4);
                    $("#star-5").text(respon_value[0].star5);
                }
            }
        });
    });
});
$(document).ready(function(){
    $('.slider4').bxSlider({
        slideWidth: 300,
        minSlides: 2,
        maxSlides: 3,
        moveSlides: 1,
        slideMargin: 10,
        controls: true,
        nextText: '<i class="fa fa-angle-right fa-3x" aria-hidden="true" style = "    right: -20%;\n' +
        '          top: 80%;\n' +
        '          transform: scale(1, 3);"></i>',
        prevText: '<i class="fa fa-angle-left fa-3x" aria-hidden="true" style = "    right: -20%;\n' +
        '          top: 80%;\n' +
        '          transform: scale(1, 3);"></i>',
        pager: false,
        wrapperClass: '.ext'
    });
});
$(document).ready(function(){
    // the "href" attribute of the modal trigger must specify the modal ID that wants to be triggered
    $('.modal').modal();
});

$(document).ready(function() {
    var path_name = window.location.pathname.split("/");
    if (path_name[1]=="games") {
        $('.bar span').hide();
        $('#bar-five').animate({
            width: gon.point5}, 1000);
        $('#bar-four').animate({
            width: gon.point4}, 1000);
        $('#bar-three').animate({
            width: gon.point3}, 1000);
        $('#bar-two').animate({
            width: gon.point2}, 1000);
        $('#bar-one').animate({
            width: gon.point1}, 1000);

        setTimeout(function() {
            $('.bar span').fadeIn('slow');
        }, 1000);
    }

});

$(document).ready(function(){

    /* 1. Visualizing things on Hover - See next part for action on click */
    $('#stars li').on('mouseover', function(){
        var onStar = parseInt($(this).data('value'), 10); // The star currently mouse on

        // Now highlight all the stars that's not after the current hovered star
        $(this).parent().children('li.star').each(function(e){
            if (e < onStar) {
                $(this).addClass('hover');
            }
            else {
                $(this).removeClass('hover');
            }
        });

    }).on('mouseout', function(){
        $(this).parent().children('li.star').each(function(e){
            $(this).removeClass('hover');
        });
    });


    /* 2. Action to perform on click */
    $('#stars li').on('click', function(){
        var onStar = parseInt($(this).data('value'), 10); // The star currently selected
        var stars = $(this).parent().children('li.star');

        for (i = 0; i < stars.length; i++) {
            $(stars[i]).removeClass('selected');
        }

        for (i = 0; i < onStar; i++) {
            $(stars[i]).addClass('selected');
        }

        // JUST RESPONSE (Not needed)
        var ratingValue = parseInt($('#stars li.selected').last().data('value'), 10);
        var msg = "";
        if (ratingValue > 1) {
            msg = ratingValue;
        }
        $("#rate-point").val(msg);

    });


});
