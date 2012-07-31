$(function(){
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
