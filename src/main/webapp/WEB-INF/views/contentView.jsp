<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
	function editPost(pnum) {
		location.href="editView?pnum=" + pnum;
	}
	
	function deletePost(pnum) {
		location.href="deletePost?pnum=" + pnum;
	}
	
	function toBoard() {
		location.href="policeBoard";
	}
	
</script>
<style>
	button {
		margin-top: 5px;
	}
	
	#contentView {
		border: 1px solid black;
		width: 600px;
	}
	
	#contentView tr, #contentView td, #contentView th{
		border: 1px solid black;
	}
	
	.left {
		width: 15%;
		text-align: center;
	}
	
	#ptitle {
		width: 70%;
	}
	
	.small {
		width: 15%;
		text-align: center;
	}
	
	#reg {
		text-align: center;
	}
</style>
</head>
<body>
	<h3>contentView.jsp</h3>
	
	<table id="contentView">
		<tr>
			<td id="ptitle" colspan="4">${dto.ptitle }</td>
			<td class="left">순번</td>
			<td class="small">${dto.pnum }</td>
		</tr>
		<tr>
			<td class="left">등록자명</td>
			<td class="small">${dto.pwriter }</td>
			<td class="left">등록일</td>
			<td id="reg"><fmt:formatDate value="${dto.pregdate }" pattern="yyyy-MM-dd HH:mm"/></td>
			<td class="left">조회수</td>
			<td class="small">${dto.phit }</td>
		</tr>
		<tr>
			<td class="left">첨부파일</td>
			<td colspan="5">${dto.pfilesrc }</td>
		</tr>
		<tr>
			<td colspan="6">${dto.pcontent }</td>
		</tr>
	</table>
	<button onclick="editPost(${dto.pnum })">수정하기</button>
	<button onclick="deletePost(${dto.pnum })">삭제하기</button>
	<button onclick="toBoard()">돌아가기</button>

</body>
</html>