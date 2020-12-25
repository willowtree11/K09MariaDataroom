<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<jsp:include page="../common/boardHead.jsp"/>
<head>
<meta charset="UTF-8">
<title>DataWrite</title>
</head>
<body>
<div class="container">
	<div class="row">		
		<jsp:include page="../common/boardTop.jsp" />
	</div>
	<div class="row">		
		<jsp:include page="../common/boardLeft.jsp" />
		<div class="col-9 pt-3">
			<!-- ### 게시판의 body 부분 start ### -->
			<h3>자료실 - <small>Write(글쓰기)</small></h3>
			<script>
				//폼체크
				function checkValidate(fm){
					if(fm.name.value==""){
						alert("이름을 입력하세요."); 
						fm.name.focus(); 
						return false; 
					}
					if(fm.pass.value==""){
						alert("비밀번호을 입력하세요."); 
						fm.pass.focus(); 
						return false;
					}
					if(fm.title.value==""){
						alert("제목을 입력하세요."); 
						fm.title.focus(); 
						return false; 
					}
					if(fm.content.value==""){
						alert("내용을 입력하세요."); 
						fm.content.focus(); 
						return false;
					}
				}
			</script>
			<div class="row mt-3 mr-1">
				<table class="table table-bordered table-striped">
					<!-- 
						파일 업로드를 위해서는 ★★반드시 enctype을 선언★★해야 한다.
						enctype선언이 없으면 파일명 만 전송이 되고 파일은 전송되지 않게됨.(폼값이 전송되지 않음)
					 -->
					<form name="writeFrm" method="post" action="../DataRoom/DataWrite" 
					onsubmit="return checkValidate(this);" enctype="multipart/form-data">
						<colgroup>
							<col width="20%"/>
							<col width="*"/>
						</colgroup>
						<tbody>
							<tr>
								<th class="text-center align-middle">작성자</th>
								<td>
									<input type="text" class="form-control" name="name"	
										style="width:100px;"/>
								</td>
							</tr>
							<tr>
								<th class="text-center" 
									style="vertical-align:middle;">패스워드</th>
								<td>
									<input type="password" class="form-control" name="pass"
										style="width:200px;"/>
								</td>
							</tr>
							<tr>
								<th class="text-center"
									style="vertical-align:middle;">제목</th>
								<td>
									<input type="text" class="form-control" 
										name="title" />
								</td>
							</tr>
							<tr>
								<th class="text-center"
									style="vertical-align:middle;">내용</th>
								<td>
									<textarea rows="10" 
										class="form-control" name="content"></textarea>
								</td>
							</tr>
							<tr>
								<th class="text-center"
									style="vertical-align:middle;">첨부파일</th>
								<td>
									<input type="file" class="form-control" 
										name="attachedfile" />
								</td>
							</tr>
						</tbody>
					</table>
					</div>
					<div class="row mb-3">
					<div class="col text-right">					
						<button type="submit" class="btn btn-danger">전송하기</button>
						<button type="reset" class="btn btn-dark">Reset</button>
						<button type="button" class="btn btn-warning" onclick="location.href='../DataRoom/DataList?&nowPage=${param.nowPage }&searchColumn=${param.searchColumn }&searchWord=${param.searchWord }';">리스트보기</button>
					</div>
				</form>
			</div>
		<!-- ### 게시판의 body 부분 end ### -->
		</div>
	</div>
	<div class="row border border-dark border-bottom-0 border-right-0 border-left-0"></div>
	<jsp:include page="../common/boardBottom.jsp"/>
</div>
</body>
</html>