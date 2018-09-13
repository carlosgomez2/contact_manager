document.addEventListener("turbolinks:load", function () {
  $("#add-new-group").hide();
  $('body').on('click', '#add-group-btn', function () {
    $("#add-new-group").slideToggle(function () {
      $("#new_group").focus();
    });
    return false;
  });

  $('body').on('click', '#save-group-btn', function (event) {
    event.preventDefault();

    let newGroup = $('#new_group');
    let inputGroup = newGroup.closest('.input-group');

    $.ajax({
      url: "/groups",
      method: "post",
      dataType: "json",
      data: {
        group: { name: $('#new_group').val() }
      },

      success: function (group) {
        if (group.id != null) {
          newGroup.removeClass('is-invalid');
          inputGroup.next('.text-danger').remove();

          var newOption = $('<option />')
            .attr('value', group.id)
            .attr('selected', true)
            .text(group.name);

          $('#contact_group_id').append(newOption);

          newGroup.val("");
        }
      },

      error: function (xhr) {
        var errors = xhr.responseJSON;
        var error = errors.join(", ");
        if (error) {
          inputGroup.next('.text-danger').detach();
          newGroup.addClass('is-invalid');
          inputGroup
            .after('<p class="text-danger">' + error + '</p>');
        }
      }
    });
  });
});