<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="user.userDTO,
               user.userDAO,
               java.util.ArrayList"%>
<!DOCTYPE html>
<html>
   <head>
      <meta charset="UTF-8">
      <meta name="viewport" content="width=device-width, initial-scale=1.0">
      <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
      <meta http-equiv="X-UA-Compatible" content="ie=edge">
      <title>관리자 페이지 입니다.</title>
<style type="text/css">
*{margin: 0; padding: 0;}
main {width: 1600px; margin:0 auto;}
.admin_menu{width: 25%; height: 100vh; float: left; background-color: #353535; position: relative;}
.admin_menu h1{width: 100%; height: 120px; font-size: 23px; color: white; background-color: #368AFF; display: flex; align-items: center; justify-content: center;}
.admin_menu .menu_reserve{width: 100%;}
.admin_menu .menu_reserve h2{width: 100%; height: 30px; font-size: 19px; color: white; margin-top: 20px; margin-left: 50px; box-sizing: border-box;}
.admin_menu .menu_reserve .room_btn{width: 100%; height: 100px;}
.admin_menu .menu_reserve .room_btn span{line-height: 30px; color: white; font-size: 16px; padding-left: 65px; margin-top: 9px; box-sizing: border-box; cursor: pointer; list-style: none; display: block;}
.admin_menu .menu_reserve .room_btn span:hover {background-color:white; color:black;}
.admin_menu #move_back{position: absolute; left: 15px; bottom: 20px; width: 100px; height: 40px; font-weight: bold; border-radius: 10px; background-color: #368AFF; color: white; border: 2px solid #368AFF; cursor: pointer; display: inline-block;}
.admin_menu #move_back:hover{background-color: #353535;}
.btn_a {font-weight:bold;}

.admin_content{width: 75%; height: 100vh; float: left; background-color: #EAEAEA; position: relative;}
.admin_content .user_info{width: 100%;}
.admin_content .user_info h1{width: 100%; height: 70px; padding-left: 40px; padding-top: 40px; box-sizing: border-box; font-size: 23px;}
.admin_content .user_info .res_info{width: 100%; height: calc(90vh - 60px); padding: 5% 5%; box-sizing: border-box;}
.admin_content .user_info .res_info ul{width: 100%; height: 40px; display: flex;}
.admin_content .user_info .res_info ul li{list-style: none; width: calc(100% / 6); height: 100%; display: flex; justify-content: center; align-items: center; border: 1px solid black; font-size: 12px;}
.admin_content .user_info .res_info ul li:nth-child(7){width: 8%;}
.admin_content .user_info .res_info #cancel{width: 90px; height: 35px; border:1px solid black; position: absolute; right: 5%; bottom: 15%; border-radius: 10px;}
.admin_content .user_info .res_info #cancel:hover{background-color: black; color: white; cursor: pointer;}

.admin_content #page_count_wrap{width: 100%; height: 10vh; display: flex; justify-content: center; position: absolute; left: 0; bottom: 5%;}
.admin_content #page_num_wrap{display: flex;}
.admin_content #page_num_wrap a{width: 30px; text-decoration: none; color: black; height: 100%; cursor: pointer;}
.admin_content #page_num_wrap a li{list-style: none; width: 100%; height: 100%; display: flex; align-items: center; justify-content: center; font-size: 14px;}
.admin_content #page_num_wrap a li:hover{font-size: 16px;}
</style>
   </head>
   <body>
      <main id="fullpage">
         <div class="admin_menu">
            <h1>관리자 페이지</h1>
            <div class="menu_reserve">
               <h2>예약관리</h2>
               <div class="room_btn">
                  <span class="btn_a">Room A</span>
                  <span class="btn_b">Room B</span>
                  <span class="btn_c">Room C</span>
                  <span class="btn_d">Room D</span>
               </div>
            </div>
            <button type="button" id="move_back">되돌아가기</button>
         </div>
         <div class="admin_content">
            <div class="user_info">
               <h1>A ROOM 예약자 정보</h1>
               <div class="res_info">
                  <ul>
                     <li>No</li>
                     <li>Name</li>
                     <li>Tel</li>
                     <li>Check in</li>
                     <li>Check out</li>
                     <li>Reserved time</li>
                     <li>Cancel</li>
                  </ul>
                  <%        
                     userDAO UserDAO = new userDAO(); 
                     
                  int listCount = UserDAO.listCount();
                     double page_count =  Math.ceil((double)listCount / 10); 
                     int pageNumber;
                     int page_list_num;
                     if(request.getParameter("page") == null){
                        pageNumber = 1;
                     }else{
                        page_list_num = Integer.parseInt(request.getParameter("page"));
                        pageNumber = page_list_num ;
                     }    
                     
                     int result = UserDAO.getNext();            
                     ArrayList<userDTO> list = UserDAO.getList(pageNumber);            
                     %>
                     
					<form action="check_a.jsp" method="post">
			            <%for(int i = 0; i < list.size(); i++) {%>
							<ul>
				            	<li><%= list.get(i).getDTOno()%></li>
				                <li><%= list.get(i).getDTOu_name()%></li>
				                <li><%= list.get(i).getDTOu_number()%></li>
				                <li><%= list.get(i).getDTOdate_check_in()%></li>
				                <li><%= list.get(i).getDTOdate_check_out()%></li>
				                <li><%= list.get(i).getDTOreserved_time()%></li>
				                <li><input type="checkbox" name="check_box" value="<%= list.get(i).getDTOno()%>"></li>
				           	</ul>     
			            <%} %>
			            <input type="submit" value="예약취소" id="cancel">
				     </form>
                  </div>
                  <div id="page_count_wrap">
                        <ul id="page_num_wrap">
                        <%for(int i = 0; i < page_count; i++ ) { 
                          if(i < 999){%>
                           <a><li><%=i+1 %></li></a>
                        <%}else{break;}}%>                  
                        </ul>
                    </div>
                 </div>
         </div>
      </main>
      <script type="text/javascript">
         $(document).ready(function() {
            var page_num = 0;
           
              $("#page_num_wrap a").click(function(){
                 page_num = $(this).index()+1;
                 window.location.replace("adminPage_a.jsp?page="+page_num);
              });
              
              $("#move_back").click(function(){
                  $(location).attr("href", "calendar_a.jsp");
              });
              
              $(".btn_b").click(function(){
                  $(location).attr("href", "adminPage_b.jsp");
              });
              
              $(".btn_c").click(function(){
                  $(location).attr("href", "adminPage_c.jsp");
              });
              
              $(".btn_d").click(function(){
                  $(location).attr("href", "adminPage_d.jsp");
              });
         });
         
      </script>
   </body>
</html>