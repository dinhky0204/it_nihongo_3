$(document).ready(function () {
    $('select').material_select();
    $('.btn-draft').click(function () {
        $('.status').attr('value', 'false');
        $('form').submit();
    });

    $('.btn-publish').click(function () {
        $('.status').attr('value', 'true');
        $('form').submit();
    });

    $(document).on('click', '.edit-comment', function () {
        var $comment_box = $(this).closest('.panel-default');
        var comment_text = $comment_box.find('.panel-body').text().trim();
        $comment_box.find('input[name="comment"]').val(comment_text);
        $comment_box.find('.panel-body').hide();
        $comment_box.find('.edit-comment-content').show();
    });

    $(document).on('click', '.btn-edit-comment', function () {
        var comment_id = $(this).closest('.panel-default').find('.edit-comment').data('commentid');
        var comment_content = $(this).closest('.edit-comment-content').find('input[name="comment"]').val();
        var self = $(this);
        $.ajaxSetup({
            headers: {
                'X-CSRF-TOKEN': $('meta[name = "csrf-token"]').attr('content')
            }
        });
        // alert(comment_content);
        var data = {
            review_comment: { content: comment_content }
        };

        $.ajax({
            url: '/review_comments/'+comment_id,
            method: 'PUT',
            data: {
                review_comment: { content: comment_content }
            },
            success: function (response) {
                var $comment_box = $(self).closest('.panel-default');
                $comment_box.find('.panel-body').text(comment_content);
                $comment_box.find('.edit-comment-content').hide();
                $comment_box.find('.panel-body').show();
            },
            error: function () {
            }
        });
    });

    //like
    var review_id = $('#icon').data('reviewid');
    var status = $('#icon').data('status');
    var user = $('#icon').data('user');
    var like_id = $('#icon').data('likeid');
    $('#icon').on('click', function () {
        // var $like_button = $(this).closest('.container-like');
        if (!user) {
            alert("You must login!");
            return;
        }
        $.ajaxSetup({
            headers: {
                'X-CSRF-TOKEN': $('meta[name = "csrf-token"]').attr('content')
            }
        });
        if (status=="like"){
            $.ajax({
                url: '/likes',
                method: 'POST',
                data: {
                    like: { review_id: review_id }
                },
                success: function (response) {
                    document.getElementById("like").classList.remove('btn-unlike');
                    document.getElementById("like").classList.add('btn-like');
                    document.getElementById("icon").classList.remove('icon-unlike','text-primary-unlike');
                    document.getElementById("icon").classList.add('icon-like','text-primary-like');
                    $('.like-value').html(String(response.like_count) + " Like");
                    like_id = response.like.id;
                    status = "unlike";
                },
                error: function () {
                }
            });
        }else {
            $.ajax({
                url: '/likes/check_delete',
                method: 'POST',
                data: {like_id:like_id,review_id:review_id},
                success: function (response) {
                    document.getElementById("like").classList.remove('btn-like');
                    document.getElementById("like").classList.add('btn-unlike');
                    document.getElementById("icon").classList.remove('icon-like','text-primary-like');
                    document.getElementById("icon").classList.add('icon-unlike','text-primary-unlike');
                    $('.like-value').html(String(response) + " Like");
                    status = "like";
                    like_id= null;
                },
                error: function () {
                }
            });
        }

    });

    //unlike
    // $(document).on('click', '.icon-like', function () {
    //     var $like_button = $(this).closest('.container-like');
    //     var like_id = $(this).data('likeid');
    //     var user = $(this).data('user')
    //     if (!user) {
    //         alert("You must login!");
    //         return;
    //     }
    //     $.ajaxSetup({
    //         headers: {
    //             'X-CSRF-TOKEN': $('meta[name = "csrf-token"]').attr('content')
    //         }
    //     });
    //
    //     $.ajax({
    //         url: '/likes/'+like_id,
    //         method: 'DELETE',
    //
    //         success: function (response) {
    //             document.getElementById("like").classList.remove('btn-like');
    //             document.getElementById("like").classList.add('btn-unlike');
    //             document.getElementById("icon").classList.remove('icon-like','text-primary-like');
    //             document.getElementById("icon").classList.add('icon-unlike','text-primary-unlike');
    //             $('.like-value').html(String(response) + " Like");
    //         },
    //         error: function () {
    //         }
    //     });
    //
    // });
});