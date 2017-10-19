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
});