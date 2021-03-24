<%@page import="java.util.List"%>
<%@page import="vo.LectureVO"%>
<%@page import="vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link href="https://fonts.googleapis.com/css?family=Lato" rel="stylesheet" type="text/css">
<link href="https://fonts.googleapis.com/css?family=Montserrat" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="../css/List_com.css">
<link rel="stylesheet" href="../css/mypage.css">
<link rel="stylesheet" href="../css/out.css">
<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery-3.5.1.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script type="text/javascript">
$(function() {
	$(".delete-course").on('click',function(){
		$(".delete-confirm").open();
	})
})
</script>
<title>Learning Mark : 마이페이지</title>
</head>
<body id="myPage" data-spy="scroll" data-target=".navbar" data-offset="50">
<%
	MemberVO memberVo = (MemberVO)session.getAttribute("mVo");
	List<LectureVO> list = (List<LectureVO>)request.getAttribute("profitList");	
	int cnt = (Integer)request.getAttribute("classcnt");
%>
	
	<nav class="navbar navbar-default navbar-fixed-top">
		<div class="container-fluid">
			<div class="navbar-header">
				<a class="navbar-brand" href="<%=request.getContextPath() %>/main.do"><strong>Learning Market💻</strong></a>
			</div>
			<div class="collapse navbar-collapse" id="myNavbar"></div>
			<ul class="nav navbar-nav navbar-center">
				<li><a href="<%=request.getContextPath() %>/main.do">홈</a></li> <!-- 메인으로 올라가는 버튼 -->
				<li><a href="<%=request.getContextPath() %>/lecture/lectureList.do">강의실</a></li>
				<li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="<%=request.getContextPath() %>/board/QnABoard.do">커뮤니티<span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a href="<%=request.getContextPath() %>/board/QnABoard.do?board_no=2">묻고 답하기</a></li>
						<li><a href="<%=request.getContextPath() %>/board/NoticeBoard.do?board_no=1">공지사항</a></li>
					</ul>
				</li>
				<%
					if(memberVo == null) {
				%>
				<li><a href="<%=request.getContextPath() %>/member/loginForm.do">마이페이지</a></li>
				<% 
					} else if(memberVo.getAut() == 1){       //강사로 로그인 할 때 -> 강사 마이페이지 이동
				%>
				<li><a href="<%=request.getContextPath() %>/teacherInfo/teacherForm.do">마이페이지</a></li>	
				<% 
					} else {
				%>
				<li><a href="<%=request.getContextPath() %>/memberInfo/mypageForm.do">마이페이지</a></li>
				<%		
					}
				%>
				<li><a href="<%=request.getContextPath() %>/main/List_don.do">재능기부</a></li>
				<%
					if(memberVo == null) {
				%>
				<li><a href="<%=request.getContextPath()%>/member/loginForm.do">로그인</a></li>
				<li><a href="<%=request.getContextPath()%>/member/joinForm.do">회원가입</a></li>
				<%
					} else {
				%>
				<li><a href="<%=request.getContextPath()%>/member/logoutForm.do">로그아웃</a></li>
				<li class="dropdown">
					<a class="dropdown-toggle" data-toggle="dropdown" href="<%=request.getContextPath()%>/basket/BasketList.do?mem_no=<%=memberVo.getMem_no() %>">
						<img src = "../images/바구니.png" width = "30px;" height="25px;"/><span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a href="<%=request.getContextPath()%>/basket/BasketList.do?mem_no=<%=memberVo.getMem_no() %>&state=1">수강바구니</a></li>
						<li><a href="<%=request.getContextPath() %>/basket/BasketList.do?mem_no=<%=memberVo.getMem_no() %>&state=2">위시리스트</a></li>
					</ul>
				</li>
				<%		
					}
				%>
				<li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#">MORE <span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a href="<%=request.getContextPath() %>/board/NoticeBoard.do?board_no=1">공지사항</a></li>
						<li><a href="<%=request.getContextPath()%>/main/main_intro.do">소개</a></li>
						<li><a href="<%=request.getContextPath() %>/main/List_don.do">재능기부신청</a></li>
						<li><a href="#">멤버십신청</a></li>
					</ul>
				</li>
			</ul>
		</div>
	</nav>


<!-- Container (The Band Section) 강사 마이페이지 -->
<div id="band">
		<div class="mySlides" style="height: 80px;">
			<br> <span class="dona">마이페이지</span>
		</div>

		<aside id="left">
  <div class="menu_container">
  
    <p class="menu-label">프로필관리</p>
    <ul class="menu-list">
      <li>
        <a href="<%=request.getContextPath() %>/teacherInfo/teacherform.do" class="btn_wrap ">
          <span>프로필설정</span>
        </a>
      </li>
    </ul>
    
     <p class="menu-label">강의 정보</p>
    <ul class="menu-list">
      <li>
        <a href="<%=request.getContextPath() %>/teacherInfo/techerclass.do?mem_no=<%=memberVo.getMem_no() %>" class="btn_wrap ">
          <span>내 강의</span>
        </a>
      </li>
      <li>
        <a href="<%=request.getContextPath() %>/teacherInfo/profitcheck.do?mem_no=<%=memberVo.getMem_no() %>" class="btn_wrap ">
          <strong><span>실적 확인</span></strong>         
        </a>
      </li>
    </ul>
     
  </div>
 </aside>


<div id="center"><br>
	<div class="tabs">
      <ul>
         <li class="is-active"><a href="">내 실적</a></li>
      </ul>
    </div>

<div class="main_container">         
                 
<%	
	for(LectureVO lectureVo : list) {
%>         
   <div class="courses" style="margin-bottom: 30px;">
            
  <div class="t-course">
    <div class="handle">
      <i class="fa fa-bars"></i>
    </div>
    <div class="t-course-container">
    
      <div class="content-top ">
	
	<a><%= memberVo.getMem_nm() %></a>
        <div class="content-header-wrapper">
          <div class="content-header">
              <div class="course-title">
              <a>총급여 : <%= lectureVo.getSum_price() %></a>
              <a>수강생 : <%= cnt %></a>
              </div>
          </div>          

        </div>     
      </div>
      <div class="content-bottom">

     
      </div>
    </div>
	     
   </div>
 </div>       <!-- <div class="courses"> 태그 마지막 -->
 <%		
		}
%> 
</div>


	<div id="right">
		<!-- <img  class="list" src="../images/커뮤니티.png" > -->
	</div>

</div>
</div>    <!-- <div id="band"> 태그 끝!! -->

<!-- Footer -->
	<footer class="footer">
		<div class="ul">
			<ul>
				<li>러닝마켓</li>
				<li>LM소개</li>

			</ul>
		</div>
		<div class="ul">
			<ul>
				<li><a>고객센터</a></li>
				<li>이용약관</li>
				<li>개인정보취급방침</li>
			</ul>
		</div>

		<div class="ul">
			<ul>
				<li><a>공지사항</a></li>
				<li>묻고답하기</li>
			</ul>
			<hr style="color: white">
		</div>
		<br> <br> <br> <br>
		<p class="made">
			Learning Made By <a href="https://www.w3schools.com"
				data-toggle="tooltip" title="Visit w3schools">대덕인재개발원</a>
			(주)Learning Market 사업자 정보<br> (주)Learning Market | 대표자 : 유동기
			|사업자번호 : 000-0000-0000 사업자 정보 확인 | 개인정보보호책임자 : 유동기 | 통신판매업
			:2020-중구대흥동 A-0001<br> 주소 : 대전광역시 중구 대흥동 500 영민빌딩 4층 402호 | 이메일
			: Learning Market@korea.com<br>
		</p>
	</footer>

</body>
</html>