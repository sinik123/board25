<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	header {
		width: 600px;
		margin-left: auto;
		margin-right: auto;
	}
	
	main {
		width: 600px;
		margin-left: auto;
		margin-right: auto;
	}
	
	footer {
		width: 600px;
		margin-left: auto;
		margin-right: auto;
	}

	#policeBoard {
		border: 1px solid black;
		width: 600px;
		margin-top: 10px;
	}
	
	#policeBoard tr, #policeBoard td, #policeBoard th{
		border: 1px solid black;
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
	
	.pnum, .pwriter, .pregdate, .phit {
		text-align: center;
	}
	
	#searchForm {
		display: inline;
	}
	
	#searchFormWrap {
		text-align: center;
		margin-bottom: 10px;
	}
	
	#writeButtonWrap {
		text-align: right;
	}
	
	#pageButtonWrap {
		text-align: center;
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
	
</style>
<script>
	function searchReset() {
		location.href = "policeBoard";
	}
</script>
</head>
<body>
	<header>
		<h3>policeBoard.jsp</h3>
		
		<c:set value="${searchVO.displayRowCount }" var="count"/>
		<div id="searchFormWrap">
			<form action="policeBoard" id="searchForm">
				<input type="hidden" name="count" value="${count }" />
				<select name="searchType">
					<option value="none" ${searchType == 'none' || searchType == '' ? 'selected' : '' }>-- 검색선택 --</option>
					<option value="ptitle" ${searchType == 'ptitle' ? 'selected' : '' }>제목</option>
					<option value="pcontent" ${searchType == 'pcontent' ? 'selected' : '' }>내용</option>
					<option value="ptitlepcontent" ${searchType == 'ptitlepcontent' ? 'selected' : '' }>제목 + 내용</option>
					<option value="pwriter" ${searchType == 'pwriter' ? 'selected' : '' }>등록자명</option>
				</select>
			
				<input type="text" name="keyword" value="${keyword }"/>
				<input type="submit" value="검색" />
			</form>
			
			<button onclick="searchReset()">초기화</button>
		</div>
		
		
		<div id="headerLeft">
			<span>총 게시물: ${searchVO.totRow }</span>
			<span>현재 페이지: ${searchVO.page }</span>
		</div>
		
		<div id="headerRight">
			
			<form action="policeBoard">
				<input type="hidden" name="searchType" value="${searchType }" />
				<input type="hidden" name="keyword" value="${keyword }" />
				<span>페이지 목록</span>
				<select name="count">
					<option value="10" ${count == '10' ? 'selected' : '' }>10개</option>
					<option value="15" ${count == '15' ? 'selected' : '' }>15개</option>
					<option value="20" ${count == '20' ? 'selected' : '' }>20개</option>
					<option value="25" ${count == '25' ? 'selected' : '' }>25개</option>
					<option value="30" ${count == '30' ? 'selected' : '' }>30개</option>
				</select>
				<input type="submit" value="변경" />
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
						<span>${dto.phit }<span>
					</td>
				</tr>
			</c:forEach>
		</table>
		
		<hr />
	</main>
	
	<footer>
		<div id="writeButtonWrap">
			<button id="write">글쓰기</button>
		</div>
		
		<div id="pageButtonWrap">
			<c:forEach begin="${searchVO.pageStart }" end="${searchVO.pageEnd }" var="pageNum">
				<a href="policeBoard?page=${pageNum }">${pageNum }</a>
			</c:forEach>
		</div>
	</footer>
	
</body>
</html>