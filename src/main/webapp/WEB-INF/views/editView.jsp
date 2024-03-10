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
	}
	
	#reg {
		text-align: center;
	}
</style>
</head>
<body>
	<h3>contentView.jsp</h3>
	
	<form action="editPost">
		<input type="hidden" name="pnum" value="${dto.pnum }" />
		<table id="contentView">
			<tr>
				<td>제목</td>
				<td id="ptitle" ><input type="text" name="ptitle" value="${dto.ptitle }" /></td>
			</tr>
			<tr>
				<td class="left">등록자명</td>
				<td class="small"><input type="text" name="pwriter" value="${dto.pwriter }" /></td>
			</tr>
			<tr>
				<td class="left">첨부파일</td>
				<td><input type="text" name="pfilesrc" value="${dto.pfilesrc }" /></td>
			</tr>
			<tr>
				<td colspan="2"><textarea name="pcontent" id="" cols="30" rows="10">${dto.pcontent }</textarea></td>
			</tr>
		</table>
		<input type="submit" value="등록하기"/>
		<input type="submit" value="돌아가기" formaction="policeBoard" />
	</form>
</body>
</html>