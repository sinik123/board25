<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link  rel="stylesheet"
  href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css"/>
<style>
	html {
		font-family: "Malgun Gothic";
	}
	header {
		width: 700px;
		margin-left: auto;
		margin-right: auto;
	}
	
	main {
		width: 700px;
		margin-left: auto;
		margin-right: auto;
	}
	
	footer {
		width: 700px;
		margin-left: auto;
		margin-right: auto;
	}

	#policeBoard {
		border-top: 1px solid #333333;
		border-left: 0;
		border-right: 0;
		width: 100%;
		margin-top: 10px;
		border-collapse: collapse;
	}
	
	#policeBoard th {
		border-bottom: 1px solid #cccccc;
		background-color: #f9f9f9;
		padding: 5px;
		font-weight: 600;
	}
	
	#policeBoard td {
		border-bottom: 1px solid #e2e2e2;
		padding: 5px;
	}
	
/* 	#policeBoard tr, #policeBoard td, #policeBoard th{
		border: 1px solid black;
	} */
	
	#hptitle {
		text-align: left;
	}
	
	#hpwriter, #hpregdate, #hphit {
		width: 17%;
	}
	
	#hpnum {
		width: 10%;
	}
	
	.pnum, .pwriter, .pregdate, .phit {
		text-align: center;
	}
	
	#searchFormWrap {
		text-align: center;
		margin-bottom: 10px;
		background-color: #f4f4f4;
		padding-top: 10px;
		padding-bottom: 10px;
	}
	
	#writeButtonWrap {
		text-align: right;
		margin-top: 10px;
	}
	
	#pageButtonWrap {
		margin-top: 10px;
	}
	
	#headerLeft {
		float: left;
		width: 50%;
	}
	
	#headerRight {
		float: right;
		width: 50%;
		text-align: right;
	}
	
	#pad {
		height: 1px;
	}
	
	.clear {
		clear: both;
	}
	
	.selectDefault {
		padding: 5px;
		border-radius: 0px;
		border-style: solid;
		border-width: 1px;
		font-size: 13px;
		margin: 0;
		vertical-align: top;
		box-sizing: content-box;
		height: 20px;
	}
	
	#keywordInput {
		padding: 5px;
		border-radius: 0;
		border-style: solid;
		border-width: 1px;
		font-size: 13px;
		margin: 0;
		vertical-align: top;
		box-sizing: content-box;
		height: 20px;
	}
	
	.defaultButton {
		padding: 5px 10px 5px 10px;
		border: 0;
		font-size: 13px;
		margin: 0;
		vertical-align: top;
		box-sizing: content-box;
		height: 22px;
		font-weight: bold;
		color: white;
		background-color: #004fa8;
	}
	
	.defaultButton:hover {
		cursor: pointer;
		background-color: #0c73e7;
	}
	
	.infoText {
		display: inline-block;
		padding: 5px;
	}
	
	#changeButton {
		padding: 5px 10px 5px 10px;
		border: 0;
		font-size: 13px;
		margin: 0;
		vertical-align: top;
		box-sizing: content-box;
		height: 22px;
		font-weight: bold;
		color: white;
		background-color: #454545;
	}
	
	#changeButton:hover {
		cursor: pointer;
		background-color: #737373;
	}
	
	#pageButtonTable {
		margin-left: auto;
		margin-right: auto;
		border: 1px solid #c2c2c2;
		border-collapse: collapse;
	}
	
	#pageButtonTable td {
		border: 1px solid #c2c2c2;
		width: 25px;
		height: 25px;
		text-align: center;
		font-weight: bold;
		color: #222222;
	}
	
	#pageButtonTable td:hover {
		color: white;
		background-color: #ad0000;
		cursor: pointer;
	}
	
</style>
<script>
	function searchReset() {
		location.href = "policeBoard";
	}
	
	function clearSearchNotice() {
		if (document.getElementById('keywordInput').value == "검색어를 입력하세요.") {
			document.getElementById('keywordInput').value = "";
		}
	}
	
	function checkempty() {
		if (document.getElementById('keywordInput').value == "") {
			document.getElementById('keywordInput').value = "검색어를 입력하세요.";
		}
	}
</script>
</head>
<body>
	<header>
		<h3>policeBoard.jsp</h3>
				
		<div id="searchFormWrap">
			<form action="policeBoard" id="searchForm">
				<input type="hidden" name="count" value="${count }" />
				<select class="selectDefault" name="searchType">
					<option value="none" ${searchType == 'none' || searchType == '' ? 'selected' : '' }>-- 검색선택 --</option>
					<option value="ptitle" ${searchType == 'ptitle' ? 'selected' : '' }>제목</option>
					<option value="pcontent" ${searchType == 'pcontent' ? 'selected' : '' }>내용</option>
					<option value="ptitlepcontent" ${searchType == 'ptitlepcontent' ? 'selected' : '' }>제목 + 내용</option>
					<option value="pwriter" ${searchType == 'pwriter' ? 'selected' : '' }>등록자명</option>
				</select>
			
				<input type="text" id="keywordInput" name="keyword" value="${keyword }"
				onmousedown="clearSearchNotice()" onfocusout="checkempty()" />
				
				<button type="submit" class="defaultButton" onclick="" >
					<i class="fa-solid fa-magnifying-glass"></i>
					검색
				</button>
				<button type="reset" onclick="searchReset()" class="defaultButton" >초기화</button>
			</form>
		</div>
		
		
		<div id="headerLeft">
			<span class="infoText">총 게시물: ${searchVO.totRow }</span>
			<span class="infoText">현재 페이지: ${searchVO.page }</span>
		</div>
		
		<div id="headerRight">
			
			<form action="policeBoard">
				<input type="hidden" name="searchType" value="${searchType }" />
				<input type="hidden" name="keyword" value="${keyword }" />
				<span class="infoText">페이지당 목록</span>
				<select class="selectDefault" name="displayRowCount">
					<option value="10" ${searchVO.displayRowCount == '10' ? 'selected' : '' }>10개</option>
					<option value="15" ${searchVO.displayRowCount == '15' ? 'selected' : '' }>15개</option>
					<option value="20" ${searchVO.displayRowCount == '20' ? 'selected' : '' }>20개</option>
					<option value="25" ${searchVO.displayRowCount == '25' ? 'selected' : '' }>25개</option>
					<option value="30" ${searchVO.displayRowCount == '30' ? 'selected' : '' }>30개</option>
				</select>
				<input type="submit" value="변경" id="changeButton" />
			</form>
		</div>
		
		<div class="clear"></div>
		
		<div id="pad"></div>
		
		
	</header>
	
	<main>
		<table id="policeBoard">
			<tr>
				<th id="hpnum">순번</th>
				<th id="hptitle">제목</th>
				<th id="hpwriter">등록자명</th>
				<th id="hpregdate">등록일</th>
				<th id="hphit">조회수</th>
			</tr>
			<c:forEach items="${list }" var="dto">
				<tr>
					<td class="pnum">
						<span>${dto.pnum }</span>
					</td>
					<td class="ptitle">
						<span><a href="contentView?pnum=${dto.pnum }">${dto.ptitle }</a></span>
					</td>
					<td class="pwriter">
						<span>${dto.pwriter }</span>
					</td>
					<td class="pregdate">
						<fmt:formatDate value="${dto.pregdate }" pattern="yyyy-MM-dd"/>
					</td>
					<td class="phit">
						<span>${dto.phit }</span>
					</td>
				</tr>
			</c:forEach>
		</table>
	</main>
	
	<footer>
		<div id="writeButtonWrap">
			<button id="write" class="defaultButton">글쓰기</button>
		</div>
		
		<div id="pageButtonWrap">
			<table id="pageButtonTable">
				<tr>
					<c:forEach begin="${searchVO.pageStart }" end="${searchVO.pageEnd }" var="pageNum">
						<td>${pageNum }<a href="policeBoard?page=${pageNum }"></a></td>
					</c:forEach>
				</tr>
			</table>
		</div>
	</footer>
	
</body>
</html>