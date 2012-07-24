$(function(){
 $('.unpublic_question_table').find('a.change_flg').click(function(){
   query={};
   query['id']=$(this).attr('id');
   $.ajax({
     type: 'POST',
     url: '/admin/accept_public',
     data: query,
     success: function(data){
       $('.unpublic_question_table').find("a#"+data['id']).text('');
       $('.unpublic_question_table').find("a#"+data['id']).text('公開済み');
      }
    });
  });
});
