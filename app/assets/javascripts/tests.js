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
  var time_count = 22;
  question_count += 1;
  var timeID = setInterval(function(){
    time_count = time_count - 1;
    time_bar_width = time_count * (4.55);
    $('.bar').css('width', time_bar_width + '%');
    if (time_count == 0) {
      Register_user_score(user_id, psrseInt(score_s), category_id)
    }
  }, 1000);
  $('.answer-box a').click(function(e){
    e.preventDefault;
    clearInterval(timeID);
    score = parseInt(score_s);
    answer = $(this).text();
    user_answer = $(this).attr('id');
    if (now_correct_answer == user_answer) {
      result = true;
    } else {
      result = false;
    }
    query = {};
    query['question_id'] = question_id;
    query['answer'] = answer;
    query['user_id'] = user_id;
    query['result'] = result;
    query['time'] = time_count;
    query["category_of_question_id"] = category_id;
    query["question_count"] = question_count;

    if (question_count > 0) {
      query["rd_user"] = rd_user
      query["rd_array_user"] = rd_array_user;
      query["g_array_user"] = g_array_user;
      query["e_array_user"] = e_array_user;
      query["d_array_user"] = d_array_user;
      query["result_array_user"] = result_array_user;
    }

    $.ajax({
      type: 'POST',
      url: '/apis/judge_answer',
      data: query,
      success: function(data) {
        if (question_count == 0) {
          if (result == true) {
            $("#" + now_correct_answer).addClass('right-answer');
          } else {
            $("#" + now_correct_answer).addClass('right-answer');
            $("#" + user_answer).addClass('no-right-answer');
          }
          var return_score = data['score'];
          $("#" + now_correct_answer).addClass('right-answer');
          $('.progress').css({display: 'none'});
          $('.bar').css({display: 'none'});
          $('.result-box').css({display: 'block'});
          $('.questioner-box').css({display: 'block'});
          $('.question_result').val(result);
          $('.question_count').val(question_count);
          $('.question_point').text(return_score);
          $('.test_sum_score').text(return_score);
          $('.user_id').val(user_id);

        } else if (question_count < question_total_count || question_count < 20) {
          if (result == true) {
            $("#" + now_correct_answer).addClass('right-answer');
          } else {
            $("#" + now_correct_answer).addClass('right-answer');
            $("#" + user_answer).addClass('no-right-answer');
          }
          var return_score = parseInt(data['score']);
          $("#" + now_correct_answer).addClass('right-answer');
          $('.progress').css({display: 'none'});
          $('.bar').css({display: 'none'});
          $('.result-box').css({display: 'block'});
          $('.questioner-box').css({display: 'block'});
          $('.question_result').val(result);
          $('.question_count').val(question_count);
          $('.question_point').text(return_score - score);
          $('.sum_count').val(return_score);
          $('.test_sum_score').text(return_score);
          $('.count').val(question_count);
          $('.rd_user').val(data["rd_user"]);
          $('.rd_array_user').val(data["rd_array_user"]);
          $('.g_array_user').val(data["g_array_user"]);
          $('.e_array_user').val(data["e_array_user"]);
          $('.d_array_user').val(data["d_array_user"]);
          $('.user_id').val(user_id);
          $(".result_array_user").val(data["result_array_user"])

        } else {
          if (result == true) {
            $("#" + now_correct_answer).addClass('right-answer');
          } else {
            $("#" + now_correct_answer).addClass('right-answer');
            $("#" + user_answer).addClass('no-right-answer');
          }
          var return_score = parseInt(data['score']);
          $("#" + now_correct_answer).css({background: '#9ACD32'});
          $('.progress').css({display: 'none'});
          $('.bar').css({display: 'none'});
          $('.result-box').css({display: 'block'});
          $('.questioner-box').css({display: 'block'});
          $('.question_result').val(result);
          $('.question_count').val(question_count);
          $('.question_point').text(return_score - score);
          $('.sum_count').val(return_score);
          $('.test_sum_score').text(return_score);
          $('.count').val(question_count);
          $('.rd_user').val(data["rd_user"]);
          $('.rd_array_user').val(data["rd_array_user"]);
          $('.g_array_user').val(data["g_array_user"]);
          $('.e_array_user').val(data["e_array_user"]);
          $('.d_array_user').val(data["d_array_user"]);
          $('.user_id').val(user_id);
          $(".result_array_user").val(data["result_array_user"])
          Register_user_score(user_id, score, category_id)
        }
      }
    });
  });
});

function Register_user_score(user_id, score, category_id ){
  query = {};
  query['category_id'] = category_id;
  query['user_id'] = user_id;
  query['sum_score'] = score;
  $.ajax({
    type: 'POST',
    url: '/apis/regist_user_score',
    data: query,
    success: function(data){
      $('.hide-box').css({display: 'block'});
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
