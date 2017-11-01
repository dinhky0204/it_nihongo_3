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
});