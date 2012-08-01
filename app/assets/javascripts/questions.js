$(function(){
  $('#category_of_question_name').bind("keyup",function(){
    category_name={};
    category_name['name']=$('#category_of_question_name').val();
    $.ajax({
      type: 'GET',
      url: '/apis/get_category',
      data:category_name,
      success:function(data){
        $('#category_name_box').html(data).css({display: 'block'});
        if(data['result']=='false'){
          $('#category_name_box').css({display: 'none'});
        }
      }
    });
  });
  
  $('#category_name_box p').live('click', function(){
    $('#category_name_box').css({display: 'none'});
  });
  $('#input_name').live("click",function(){
    $('#category_of_question_name').val($(this).text());
  });

  $('#create_submit').click(function(e){
    if($('#question').val()==""){
      e.preventDefault();
      return alert('問題を入力してください。');
    }
    if($('#question_correct_answer').val()==""){
      e.preventDefault();
      return alert('正解を入力してください。');
    }
    if($('#question_answer_1').val()==""){
      e.preventDefault();
      return alert('間違いを入力してください。');
    }
    if($('#question_correct_answer').val()==$('#question_answer_1').val()){
      e.preventDefault();
      return alert('正解と間違いが一緒です。');
    }
    if($('#question_correct_answer').val()==$('#question_answer_2').val()){
      e.preventDefault();
      return alert('正解と間違いが一緒です。');
    } 
    if($('#question_correct_answer').val()==$('#question_answer_3').val()){
      e.preventDefault();
      return alert('正解と間違いが一緒です。');
    }
    if($('#question_answer_1').val()==$('#question_answer_2').val()){
      e.preventDefault();
      return alert('同じ間違いがあります。');
    }
    if($('#question_answer_1').val()==$('#question_answer_3').val()){
      e.preventDefault();
      return alert('同じ間違いがあります。');
    }
    if($('#question_answer_2').val()!="" && $('#question_answer_2').val()==$('#question_answer_3').val()){
      e.preventDefault();
      return alert('同じ間違いがあります。');
    }
    e.preventDefault;
    question={};
    question['question']=$('#question').val();
    question['category_of_question']=$('#category_of_question').val();
    question['question_correct_answer']=$('#question_correct_answer').val();
    question['question_answer_1']=$('#question_answer_1').val();
    question['question_answer_2']=$('#question_answer_2').val();
    question['question_answer_3']=$('#question_answer_3').val();
    question['user_id']=$('#user_id').val();
    question['rating']=$('#rating').val();
    question['rd']=$('#rd').val();
    $.ajax({
      type: 'POST',
      url: '/questions/finish_create',
      data:question,
      success: function(data){
        if(data['result']=="ok"){      
          scrollTo(0,0);
          $('#create_question_row').prepend('<div id="notify_save_complete"><h2>問題が作成されました！</h2></div>'); 
          $('#question').val("");
          $('#question_correct_answer').val("");
          $('#question_answer_1').val("");
          $('#question_answer_2').val("");
          $('#question_answer_3').val("");
          setTimeout(function(){
            $("#notify_save_complete").css({display:'none'});
          }, 3000);
        }else{
          alert('エラーが発生しました。')
        }
      }
    });
  });   
});
