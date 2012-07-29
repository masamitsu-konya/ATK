$(function(){
  $('#search_words').change(function(){
    query={};
    query['search_word']=($('#search_words').val());
    $.ajax({
      type: 'POST'
      url: '/search/search_test'
      data: query,
      success: function(data){

      }
  });
});
