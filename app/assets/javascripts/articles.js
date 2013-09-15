function more_articles(ids)
{
  $.ajax({
    type: 'PUT',
    url:  '/hn',
    data: {
      attr: 'read',
      ids: ids
    },
    success: function(data, desc, xhr) {
      location.reload(true);
    },
    error: function (xhr, desc, err) {
      alert("Error: " + desc + ": " + err);
    }
  });
}
