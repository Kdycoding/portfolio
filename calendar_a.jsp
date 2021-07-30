<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="user.userDTO,
            	user.userDAO,
            	java.util.ArrayList,
            	java.util.Date,
            	user.masking"%>
<!DOCTYPE html>
<html>
   <head>
      <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <link href='fullcalendar-5.8.0/lib/main.css' rel='stylesheet'>
       <script src='fullcalendar-5.8.0/lib/main.js'></script>      
      <title>객실 A 예약 페이지</title>
<style type="text/css">
    *{margin:0; padding:0;}
    main {width: 1600px; margin:0 auto;}
    .side_menu{width: 20%; height: 100vh; float: left; background-color: #353535; position: relative;}
    .side_menu h1{width: 100%; height: 120px; font-size: 23px; color: white; background-color: #368AFF; display: flex; align-items: center; justify-content: center;}
	.side_menu .menu_reserve{width: 100%;}
	.side_menu .menu_reserve h2{width: 100%; height: 30px; font-size: 19px; color: white; margin-top: 20px; margin-left: 50px; box-sizing: border-box;}
	.side_menu .menu_reserve .room_btn{width: 100%; height: 100px;}
	.side_menu .menu_reserve .room_btn span{line-height: 30px; color: white; font-size: 16px; padding-left: 65px; margin-top: 9px; box-sizing: border-box; cursor: pointer; list-style: none; display: block;}
	.side_menu .menu_reserve .room_btn span:hover {background-color:white; color:black;}
	.side_menu #move_back{position: absolute; left: 15px; bottom: 20px; width: 100px; height: 40px; font-weight: bold; border-radius: 10px; background-color: #368AFF; color: white; border: 2px solid #368AFF; cursor: pointer; display: inline-block;}
	.side_menu #move_back:hover{background-color: #353535;}
	.btn_a {font-weight:bold;}
    #calendar{
       width: 80%; height: 100vh;
       font-size: 14px;
       float: left; position: relative;
       padding: 30px 30px; box-sizing: border-box;
    }
    .popup {
    	display:none;
    	position: fixed;
    	left:0; top:0; right:0; bottom:0;
    	z-index: 100;
    	background-color: black;
    	opacity: 0.5;
    }
    .pop_bt {
   		display:none;
    	position: fixed;
    	left:28%; top:30%; right: 28%; bottom:30%;
    	z-index: 105;
    	background: white;
    	border-radius: 15px;
    }
    .pop_bt .reserve_date {
    	position: absolute;
    	display:inline-block;
    	font-size: 20px; font-weight:bold;
    	top:45%; left:50%; transform: translateX(-50%);
    }
    .pop_bt .text {
    	display:inline-block;
    	position: absolute;
    	font-size: 20px; font-weight:bold;
    	top:25%; left:50%; transform: translateX(-50%);
    }
    .pop_bt2 {
    	width:50%;
    	height: 30%;
    	position: absolute;
    	bottom:5%; left:50%; transform:translateX(-50%);
    	display: flex; align-items: center; justify-content: center;
    }
    .pop_bt2 .btn {
    	width: 30%; height: 50%;
    	display: inline-block;
    	border-radius: 15px;
    	background-color:white;
    	font-weight: bold; font-size:20px;
    	border: 1px solid black;
    }
    .pop_bt2 .btn:hover {
    	background-color: black;
    	color:white;
    	cursor: pointer;
    }
    .pop_bt2 .btn1 {
    	margin-right:7%; 
    }
    .pop_bt2 .btn2 {
    	margin-left:7%;
    }
    .user_info {
    	display:none; 
        width: 50%;
    	border-radius: 15px;
        text-align: center;
        border: none;
        position:absolute;
        top:50%; left:50%; transform:translate(-50%, -50%);
        z-index: 106;
        background-color: white;
    }
    .user_info h2 {
        padding-top: 7%;
    }
    .user_info .form_box {
        padding: 2%;
        display: flex;
        align-items: center;
        justify-content: center;
    }
    .user_info .form_box h3 {
        padding: 3%;
        width: 10%;
    	font-size: 13px;
    }
    .user_info .form_box input {
        text-align: center;
        width: 70%; 
        height: 40px;
        border-radius: 8px;
        border: 1px solid black;
        margin: 3%;
    }
    .user_info #save_bt {
        border-radius: 8px;
        width: 90%;
        height: 40px;
        margin-top: 3%;
        margin-bottom: 8%;
        border: 1px solid black;
        background-color: white;
    }
    .user_info #save_bt:hover {
    	background-color: black;
    	color:white;
    	cursor: pointer;
    }
    .user_info .check_box input {
    	border : none;
    }
    .user_info .check_box input:focus {
    	border : none;
    }
    .login_bg{
    	display: none;
    	width: 100%; 
    	height: 100%;
    	z-index: 106;
    	background-color: black;
    	position: absolute;
    	left: 50%; top: 0;
    	transform: translateX(-50%);
    }
    .admin_login {
    	display: none; 
        width: 50%;
    	border-radius: 15px;
        text-align: center;
        border: none;
        position:absolute;
        top:50%; left:50%; transform:translate(-50%, -50%);
        z-index: 107;
        background-color: white;
    }
    .admin_login h1 {
        padding-top: 7%;
    }
    .admin_login .form_box {
        padding: 2%;
        display: flex;
        align-items: center;
        justify-content: center;
    }
    .admin_login .form_box h3 {
        padding: 3%;
        width: 10%;
    	font-size: 13px;
    }
    .admin_login .form_box input {
        text-align: center;
        width: 70%; 
        height: 40px;
        border-radius: 8px;
        border: 1px solid black;
        margin: 3%;
    }
    .admin_login #login_bt {
        border-radius: 8px;
        width: 90%;
        height: 40px;
        margin-top: 3%;
        margin-bottom: 8%;
        border: 1px solid black;
        background-color: white;
    }
    .admin_login #login_bt:hover {
    	background-color: black;
    	color:white;
    	cursor: pointer;
    }
    .admin_login .x_bt{
    	width: 50px; height: 50px;
    	position: absolute;
    	right: 3%; top: 3%;
    }
    .admin_login .x_bt span{
    	width: 100%; height: 10px;
    	background-color: black;
    	display: inline-block;
    	position: absolute;
    	left: 0; top: 50%; 
    	transform: translateY(-50%);
    	cursor: pointer;
    }
    .admin_login .x_bt span:nth-child(1){
    	transform: rotate(45deg);
    }
    .admin_login .x_bt span:nth-child(2){
    	transform: rotate(-45deg);
    }

</style>
</head>
<body>
	<main id="fullpage">
		<div class="side_menu">
			<h1>실시간 예약</h1>
            <div class="menu_reserve">
               <h2>객실 선택</h2>
               <div class="room_btn">
                  <span class="btn_a">Room A</span>
                  <span class="btn_b">Room B</span>
                  <span class="btn_c">Room C</span>
                  <span class="btn_d">Room D</span>
               </div>
            </div>
            <button type="button" id="move_back">되돌아가기</button>
		</div>
		<div id="calendar">
			
		</div>
		<div class="popup"></div>
		<div class="pop_bt">
			<span class="text">'Room A' 예약 하시겠습니까?</span>
			<span class="reserve_date"></span>
		
			<div class="pop_bt2">
				<button class="btn btn1">예</button>
				<button class="btn btn2">아니오</button>
			</div>
		</div>
		
		<div class="user_info">
		   <h2>예약자 상세정보</h2>
		   <form action="reservation_a.jsp" method="post">
		       <div class="form_box">
		           <h3>이름</h3>
		           <input type="text" name="u_name" id="u_name" value="" placeholder="이름">
		       </div>
		        
		       <div class="form_box">
		           <h3>휴대폰 번호</h3>
		           <input type="text" pattern="[0-9]+" id="u_number" name="u_number" value="" placeholder="휴대폰 번호 '-'제외">            
		       </div>
		        
		       <div class="form_box check_box">
		           <h3>Room</h3>
		           <input type="text" name="room_a" id="room_a" value="Room A" readonly>            
		       </div>
		        
		       <div class="form_box check_box">
		           <h3>Check in</h3>
		           <input type="text" name="date_check_in" id="date_check_in" value="" readonly>            
		       </div>
		       
		       <div class="form_box check_box">
		           <h3>Check out</h3>
		           <input type="text" name="date_check_out" id="date_check_out" value="" readonly>            
		       </div>
		
		       <input type="submit" value="예약하기" id="save_bt">        
		   </form>
		</div>
		
		<div class="login_bg"></div>
		<div class="admin_login">
			<h1>Admin</h1>
			<form action="adminLogin.jsp" method="post">
				<div class="form_box">
					<h3>ID</h3>
					<input type="text" name="admin_id" id="admin_id" value="" placeholder="아이디">
				</div>
				
				<div class="form_box">
					<h3>PW</h3>
					<input type="password" name="admin_pw" id="admin_pw" value="" placeholder="비밀번호">
				</div>
				
				<input type="submit" value="로그인" id="login_bt"> 
			</form>
			<div class="x_bt">
				<span></span>
				<span></span>
			</div>
		</div>
	</main>
<script>
$(document).ready(function() {
		
	var calendarEl = document.getElementById('calendar');
	var calendar = new FullCalendar.Calendar(calendarEl, {
		initialView: 'dayGridMonth',
		locale: 'ko',
		customButtons: {
			adminBtn: {
				text: '관리자 전용',
				click: function() {
					$(".admin_login").css({'display':'block'});
					$(".login_bg").css({'display':'block','opacity':'0.5'});
				}
			},
			back: {
				text:'되돌아가기',
				click: function() {
					$(location).attr("href", "reservation.html");
				}
			}	
			
		},
		headerToolbar: {
			right: 'back adminBtn today prev,next'
		},
		selectable: true,
		select: function(info) {
			$(".popup").css({'display':'block'});
			$(".pop_bt").css({'display':'block'});
			$(".reserve_date").html(info.startStr + " 14시 ~ " + info.endStr + " 10시");
			document.getElementById("date_check_in").value = info.startStr;
			document.getElementById("date_check_out").value = info.endStr;
		},
		selectOverlap: false,
		validRange: function(nowDate) {
		    return {
		        start: nowDate
		    };
		},
		events: [
			<%        
		        userDAO UserDAO = new userDAO();               
		        ArrayList<userDTO> listdata = UserDAO.getListData();
		        masking mask = new masking();
		    %>      
		    <%for(int i = 0; i < listdata.size(); i++) {%>
		    	{
		    		
		    		title: '<%=mask.getMaskedName(listdata.get(i).getDTOu_name())%>' + " // " + '<%=mask.getMaskedPhoneNum(listdata.get(i).getDTOu_number())%>', 
			    	start: '<%= listdata.get(i).getDTOdate_check_in()%>',
			    	end: '<%= listdata.get(i).getDTOdate_check_out()%>'
		    	},
		    <%} %>
		],
		eventColor:'black'
		
	});
	
    var replaceChar = /[~!@\#$%^&*\()\-=+_'\;<>0-9\/.\`:\"\\,\[\]?|{}]/gi;
    var replaceNotFullKorean = /[ㄱ-ㅎㅏ-ㅣ]/gi;
    
    $("#u_name").on("focusout", function() {
        var x = $(this).val();
        if (x.length > 0) {
            if (x.match(replaceChar) || x.match(replaceNotFullKorean)) {
                x = x.replace(replaceChar, "").replace(replaceNotFullKorean, "");
            }
            $(this).val(x);
        }
        }).on("keyup", function() {
            $(this).val($(this).val().replace(replaceChar, ""));
    });
		
	$(".btn1").click(function(){
		$(".pop_bt").css({'display':'none'});
		$(".user_info").css({'display':'block'});
		name.addEventListener('keypress', onlyKorean);
	});
		
	$(".btn2").click(function(){
		$(".popup").css({'display':'none'});
		$(".pop_bt").css({'display':'none'});
	});
		
	$(".popup").click(function(){
		$(".user_info").css({'display':'none'});
		$(".popup").css({'display':'none'});
		$(".pop_bt").css({'display':'none'});
	});
		
	$("#save_bt").click(function(){
					
		u_name = $("#u_name").val();
		u_number = $("#u_number").val();
		a_room = $("#room_a").val();
		date_check_in = $("#date_check_in").val();
		date_check_out = $("#date_check_out").val();
	        
	    if(!u_name.trim() || !u_number.trim() || !a_room.trim() || !date_check_in.trim() || !date_check_out.trim()){
	    	alert("모든 정보를 입력하세요");
	        event.returnValue = false;
	    }
	});
		
	$(".x_bt span").click( function() {
        $(".admin_login").css({display:'none'});
        $(".login_bg").css({display:'none'});
    });
		
	$(".login_bg").click( function() {
        $(".admin_login").css({display:'none'});
        $(".login_bg").css({display:'none'});
    });
	
	calendar.render();
	
	$("#move_back").click(function(){
        $(location).attr("href", "reservation.html");
    });
	
	$(".btn_b").click(function(){
        $(location).attr("href", "calendar_b.jsp");
    });
    
    $(".btn_c").click(function(){
        $(location).attr("href", "calendar_c.jsp");
    });
    
    $(".btn_d").click(function(){
        $(location).attr("href", "calendar_d.jsp");
    });
});
</script>
</body>
</html>