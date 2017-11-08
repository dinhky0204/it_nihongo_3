
$(document).ready(function () {
var current_url = window.location.pathname.split("/")   
if(current_url[2]=='create_game')
{
    $("select").material_select()
        if(window.location.pathname == "/admin/create_game") {
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
        
    }

});

