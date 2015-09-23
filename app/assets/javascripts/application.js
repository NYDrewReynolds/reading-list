// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require twitter/bootstrap
//= require_tree .

jQuery(document).ready(function ($) {

    var addLink = function (link) {
        $('#links').append(
            "<li data-id='" + link.link_id + "'> <a href=" + link.url + " target = '_blank'>" + link.url_title + "</a></li>"
        );
    };

    $('.new-link-btn').on('click', function (event) {
        event.preventDefault();
        var $formUrl = $('#url');
        var linkParams = {
            url: $formUrl.val(),
            user_id: $formUrl.data('id')
        };
        $.ajax({
            type: 'POST',
            url: '/links.json',
            data: linkParams,
            success: function (newLink) {
                console.log(newLink);
                addLink(newLink);
                $('#url').val("");
            },
            error: function (xhr) {
                console.log("Not working");
                console.log(xhr.status);
                console.log(xhr.responseText);
            }
        });
    });
});
