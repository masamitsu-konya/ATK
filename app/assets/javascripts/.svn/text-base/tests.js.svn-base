$(function(){
  var offset = 0;
  PastTestCategory(offset);
  Recommendcategory(offset);

  $('#recommendTests .right').click(function(){
    var offset = $('.offset').attr('id');
    Recommendcategory(offset);
  });

  $('#recommendTests .left').click(function(){ 
    var offset = $('.offset').attr('id');
    if(offset-16>=0){
    PreRecommendcategory(offset);
    }
  });

  $('#pastTests .right').click(function(){
    var offset = $('.past_offset').attr('id');
     PastTestCategory(offset);
  });

  $('#pastTests .left').click(function(){
    var offset = $('.past_offset').attr('id');
    if(offset>=8){
      PrePastTestCategory(offset);
    }
  });
 
  for(i=0;i<4;i++){
    n1 = Math.floor(Math.random() * 4);
    n2 = Math.floor(Math.random() * 4);
    n = answer[n1];
    answer[n1] = answer[n2];
    answer[n2] = n;
  }

  　$("p.question").text(question);
    $("#answer1").text(answer[0]);
    $("#answer2").text(answer[1]);
    $("#answer3").text(answer[2]);
    $("#answer4").text(answer[3]);

  if($("#answer1").text() == correct_answer){
    now_correct_answer = $("#answer1").attr('id');
  }else if($("#answer2").text() == correct_answer){
    now_correct_answer = $("#answer2").attr('id');
  }else if($("#answer3").text() == correct_answer){
    now_correct_answer = $("#answer3").attr('id');
  }else if($("#answer4").text() == correct_answer){
    now_correct_answer = $("#answer4").attr('id');
  }
});



$(function(){
  var count = 22;
  var question_total_count= question_count+1;
  var timeID = setInterval(function(){
    count = count-1;
    width = count*(4.55);
    $('.bar').css('width',width+'%');
    if(count==0){
      Register_user_score(user_id, score, category_id)
    }
  },1000);
  $('.answer-box a').click(function(e){
    e.preventDefault;
    clearInterval(timeID);
    score = parseInt(score_s);
    answer = $(this).text();
    user_answer = $(this).attr('id');
    if(now_correct_answer==user_answer){
      result = true;
    }else{
      result = false;
    } 
    query={};
    query['question_id']=question_id;
    query['answer']=answer;
    query['user_id']=user_id;
    query['result']=result;
    query['time']=count;
    $.ajax({
      type: 'POST',
      url: '/tests/judge_answer',
      data:query,
      success: function(data){
        if(question_count!=5 ){ 
          if(result==true){
            $("#"+now_correct_answer).addClass('right-answer');
          }else{
            $("#"+now_correct_answer).addClass('right-answer');
            $("#"+user_answer).addClass('no-right-answer');
          }
          var return_score = parseInt(data['score']);
          $("#"+now_correct_answer).addClass('right-answer');
          $('.progress').css({display: 'none'});
          $('.bar').css({display: 'none'});
          $('.result-box').css({display: 'block'});
          $('.questioner-box').css({display: 'block'});
          $('.question_result').val(result);
          $('.question_count').val(question_count);
          $('.question_point').text(data['score']);
          $('.sum_count').val(score+return_score);
          $('.test_sum_score').text(score+return_score);
          $('.question_result').val(result);
          $('.count').val(question_total_count);
        }else{
          $("#"+now_correct_answer).css({background: '#9ACD32'});
          $('.progress').css({display: 'none'});
          $('.bar').css({display: 'none'});
          $('.result-box').css({display: 'block'});
          $('.question_point').text(data['score']);
          $('.sum_count').val(score+data['score']);
          $('.test_sum_score').text(score+data['score']);
          $('.hide-box').css({display: 'block'});
        }
      }
    });
  });
});

function Register_user_score(user_id, score, category_id ){
  query={};
  query['category_id']=category_id;
  query['user_id']=user_id;
  query['sum_score']=score;
  $.ajax({
    type: 'POST',
    url: '/tests/regist_user_score',
    data:query,
    success: function(data){
      $('.progress').css({display: 'none'});
      $('.bar').css({display: 'none'});
      $('.result-box').css({display: 'block'});
      $('.category_of_question_id').val(category_id);
      $('.question_point').text(data['score']);
      $('.sum_count').val(score+data['score']);
      $('.hide-box').css({display: 'block'});
      $('.test_sum_score').text(score+data['score']);
      $('.next_question').val('終了');
      }
    });
} 


function Recommendcategory(offset){
  query={};
  query['offset']=offset;
  $.ajax({
    type: 'GET',
    url : '/apis/recommend_categoy/',
    data: query,
    success: function(data){
      $("#recommendTests .carousel-inner").html(data);
    }
  });
}

function PreRecommendcategory(offset){
  query={};
  query['offset']=offset;
  $.ajax({
    type: 'GET',
    url : '/apis/pre_recommend_categoy/',
    data: query,
    success: function(data){
      $("#recommendTests .carousel-inner").html(data);
    }
  });
}

function PastTestCategory(offset){
  query={};
  query['offset']=offset;
  $.ajax({
    type: 'GET',
    url : '/apis/past_test_category/',
    data: query,
    success: function(data){
      $("#pastTests .carousel-inner").html(data);
    }
  });
}

function PrePastTestCategory(offset){
  query={};
  query['offset']=offset;
  $.ajax({
    type: 'GET',
    url : '/apis/past_pre_test_category/',
    data: query,
    success: function(data){
      $("#pastTests .carousel-inner").html(data);
    }
  });
}
