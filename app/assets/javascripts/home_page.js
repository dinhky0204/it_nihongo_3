$(document).on("change", "#genre-select", function () {
            var genre = $(this).val();
            $.ajax({
                url: "/home_page/genre_top",
                method: "GET",
                dataType: "json",
                data: {genre: genre},
                error: function (xhr, status, error) {
                    console.error('AJAX Error: ' + status + error);
                },
                success: function (response) {
                    console.log(response);
                    var genre_review_tops = response["genre_review_tops"];
                    $('#games-genre-top').html("");
                    if(genre_review_tops.length > 0){
                        for (var i = 0; i < genre_review_tops.length; i++) {
                            var new_html = '<div class="col-xs-6 col-sm-6 col-md-6 col-lg-6">' +
                                  '<div class="panel panel-default">';
                                  console.log(genre_review_tops[i]["photo"].indexOf("http"))
                                  if(genre_review_tops[i]["photo"].indexOf("http") > -1) {
                                    new_html = new_html + '<img class="display-center" src=' + genre_review_tops[i]["photo"] +'></img>'
                                  }
                                  else {
                                      new_html = new_html
                                  }
                                  new_html = new_html + '</div>' + 
                                            '</div>' +
                                            '<div class="col-md-6 genre-top-name text-bold"> <a href="https://it-nihongo-3-maipl.c9users.io/reviews/'
                                                + genre_review_tops[i]["id"] + '">' + genre_review_tops[i]["title"] + '</a></div>' +
                                            '<div class="media-content-detail-small"><span>' + genre_review_tops[i]["content"].substr(0,100) + '</span></div>' +
                                            '<div class="top-hr"><hr/></div>';
                                            console.log(new_html);
                                $("#games-genre-top").append(new_html);
                        }    
                    }
                }
            });
        });