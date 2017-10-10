$(document).ready(function () {
    // var list = [{ value: "blue", label: "Blau" }, { value: "red", label: "Rot" }];
    var list_genre = {};
    var list = gon.genres;
    $.each(list, function(index, tmp) {
        var tag = tmp.name;
        list_genre[tag] = null;
    });
    console.log(test_genre);
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
    });
});
