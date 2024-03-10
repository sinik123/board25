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
		padding: 5px;
	}
	
	#policeBoard tr:hover {
		background-color: #f5f5f5;
	}
		
	#hptitle {
		text-align: left;
	}
	
	#hpwriter, #hpregdate, #hphit {
		width: 17%;
	}
	
	#hpnum {
		width: 10%;
	}
	
	.pnum, .ptitle, .pwriter, .pregdate, .phit {
		border-bottom: 1px solid #e2e2e2;
	}
	
	#titleLink {
		text-decoration: none;
	}
	
	.pnum, .pwriter, .pregdate, .phit {
		text-align: center;
	}
	
	.lpnum, .lpwriter, .lpregdate, .lphit {
		text-align: center;
	}
	
	.lpnum, .lptitle, .lpwriter, .lpregdate, .lphit {
		border-bottom: 1px solid #cccccc;
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
		text-align: center;
	}
	
	#headerLeft {
		float: left;
		width: 60%;
	}
	
	#headerRight {
		float: right;
		width: 40%;
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
	
	.infoTextRed {
		display: inline-block;
		padding: 5px;
		color: #ad0000;
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
	
	.pageButtonTable {
		display: inline-table;
		border: 1px solid #c2c2c2;
		border-collapse: collapse;
	}
	
	.pageButtonTable td {
		border: 1px solid #c2c2c2;
		width: 25px;
		height: 25px;
		text-align: center;
		font-weight: bold;
		color: #222222;
	}
	
	.pageButtonTable td:hover {
		color: white;
		background-color: #ad0000;
		cursor: pointer;
	}
	
	.pageArrowsTable {
		display: inline-table;
		border: 1px solid #c2c2c2;
		border-collapse: collapse;
	}
	
	.pageArrowsTable td {
		border: 1px solid #c2c2c2;
		width: 25px;
		height: 25px;
		text-align: center;
		font-weight: bold;
		color: #969696;
	}
	
	.pageArrowsTable td:hover {
		color: white;
		background-color: #ad0000;
		cursor: pointer;
	}
</style>
<script>
	function searchReset() {
		location.href = "policeBoard";
	}
	
	function changePage(page) {
		
		var params = "";
		params += "page=" + page;
		params += "&searchType=" + document.getElementById("searchType").value;
		params += "&keyword=" + document.getElementById("keywordInput").value;
		params += "&displayRowCount=" + document.getElementById("displayRowCount").value;
		
		location.href = "policeBoard?" + params;
	}
	
	function writeView() {
		location.href = "writeView";
	}
</script>
</head>
<body>
	<header>
		<h3>policeBoard.jsp</h3>
				
		<div id="searchFormWrap">
			<form action="policeBoard" id="searchForm">
				<input type="hidden" name="count" value="${count }" />
				<input type="hidden" name="displayRowCount" value="${searchVO.displayRowCount }" />
				<select class="selectDefault" name="searchType" id="searchType">
					<option value="none" ${searchType == 'none' || searchType == '' ? 'selected' : '' }>-- 검색선택 --</option>
					<option value="ptitle" ${searchType == 'ptitle' ? 'selected' : '' }>제목</option>
					<option value="pcontent" ${searchType == 'pcontent' ? 'selected' : '' }>내용</option>
					<option value="ptitlepcontent" ${searchType == 'ptitlepcontent' ? 'selected' : '' }>제목 + 내용</option>
					<option value="pwriter" ${searchType == 'pwriter' ? 'selected' : '' }>등록자명</option>
				</select>
			
				<input type="text" id="keywordInput" name="keyword" value="${keyword }" placeholder="검색어를 입력하세요." />
				
				<button type="submit" class="defaultButton">
					<i class="fa-solid fa-magnifying-glass"></i>
					검색
				</button>
				<button type="reset" onclick="searchReset()" class="defaultButton" >초기화</button>
			</form>
		</div>
		
		
		<div id="headerLeft">
			<span class="infoText">총 게시물: </span><span class="infoTextRed">${searchVO.totRow }</span><span class="infoText">건</span>
			<span class="infoText">현재 페이지: </span><span class="infoTextRed">${searchVO.page }/${searchVO.totPage }</span>
		</div>
		
		<div id="headerRight">
			
			<form action="policeBoard">
				<input type="hidden" name="searchType" value="${searchType }" />
				<input type="hidden" name="keyword" value="${keyword }" />
				<span class="infoText">페이지당 목록</span>
				<select class="selectDefault" name="displayRowCount" id="displayRowCount">
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
			<c:forEach items="${list }" var="dto" varStatus="s">
				<tr>
					<td ${s.last ? 'class="lpnum"' : 'class="pnum"' }>
						<span>${dto.pnum }</span>
					</td>
					<td ${s.last ? 'class="lptitle"' : 'class="ptitle"' }>
						<span><a id="titleLink" href="contentView?pnum=${dto.pnum }">${dto.ptitle }</a></span>
					</td>
					<td ${s.last ? 'class="lpwriter"' : 'class="pwriter"' }>
						<span>${dto.pwriter }</span>
					</td>
					<td ${s.last ? 'class="lpregdate"' : 'class="pregdate"' }>
						<fmt:formatDate value="${dto.pregdate }" pattern="yyyy-MM-dd"/>
					</td>
					<td ${s.last ? 'class="lphit"' : 'class="phit"' }>
						<span>${dto.phit }</span>
					</td>
				</tr>
			</c:forEach>
		</table>
	</main>
	
	<footer>
		<div id="writeButtonWrap">
			<button id="write" class="defaultButton" onclick="writeView()">글쓰기</button>
		</div>
		

		
		
		<div id="pageButtonWrap">
			<c:set value="${searchVO.pageStart }" var="start"/>
			<c:set value="${searchVO.pageEnd }" var="end"/>
			<c:set value="${searchVO.page }" var="cur"/>
		
			<c:if test="${searchVO.grpPageCnt < end }">
				<table class="pageArrowsTable">
					<tr>
						<td onclick="changePage(1)"><i class="fa-solid fa-angles-left"></i></td>
						<td onclick="changePage(${start - 1})"><i class="fa-solid fa-angle-left"></i></td>
					</tr>
				</table>
			</c:if>

			
			<table class="pageButtonTable">
				<tr>
					<c:forEach begin="${start }" end="${end }" var="pageNum">
						<td onclick="changePage(${pageNum })">${pageNum }</td>
					</c:forEach>
				</tr>
			</table>
			
			<c:if test="${searchVO.totPage > end }">
				<table class="pageArrowsTable" >
					<tr>
						<td onclick="changePage(${end + 1})"><i class="fa-solid fa-angle-right"></i></td>
						<td onclick="changePage(${searchVO.totPage})"><i class="fa-solid fa-angles-right"></i></td>
					</tr>
				</table>
			</c:if>
		</div>
		

	</footer>
	
</body>
</html>