// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
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
//= require bootstrap-sprockets
//= require rails-ujs
//= require turbolinks
//= require social-share-button
//= require_tree .

function remove_fields(link) {
  $(link).prev("input[type=hidden]").val("1");
  $(link).closest(".fields").hide();
}

function add_fields(link, association, content, callback) {
  var new_id = new Date().getTime();
  var regexp = new RegExp("new_" + association, "g");
  $(link).parent().before(content.replace(regexp, new_id));
  if (callback) {
    keywords = $(link).closest(".fields").find(".keyword_fields select");
    select_link = $(link).closest(".fields").find(".subcategory_select")[0]
    select_cat(select_link)
    $(link).hide();
  }
}

function select_cat(link) {
  keywords = $(link).closest(".fields").find(".keyword_fields select");

  $.ajax({
    method: "GET",
    url: "/keywords",
    data: { id: $(link).val() }
  })
  .done(function( msg ) {
    for(i = 0; i < keywords.length; i++) {
      $(keywords[i]).html( msg );
     }
  });
}

function add_keyword(form_id, url) {
  $.ajax({
    method: "POST",
    url: url,
    beforeSend: function(xhr) {xhr.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').attr('content'))},
    data: $(form_id).serialize(),
  })
  .done(function( msg ) {
    $("#subcategories").html(msg);
  });
}

var ready = function() {
}

$(document).on('turbolinks:load', ready);
