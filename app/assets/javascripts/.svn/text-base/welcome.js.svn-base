$(function(){
  $('#topTests .right').click(function(){
    var offset = $('.offset').attr('id');
    query ={}
    query['offset']=offset
    $.ajax({
      type: 'GET',
      url: 'apis/top_recommend_category',
      data: query,
      success: function(data){
        $("#topTests .carousel-inner").html(data);
      }
    });
  });

  $('#topTests .left').click(function(){
    if($('.offset').attr('id')>4){
    var offset = $('.offset').attr('id');
    query ={}
    query['offset']=offset
    $.ajax({
      type: 'GET',
      url: 'apis/top_pre_recommend_category',
      data: query,
      success: function(data){
        $("#topTests .carousel-inner").html(data);
      }
    });
   }
 });
});
 
