<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>글작성</title>
</head>
<style>
table.chart{
	background-color : white;
	margin:0 auto;
	margin-top: 100px; 
	padding:0px;
	line-height:21px;
	border-top:1px solid #cccccc;
	border-left:1px solid #cccccc;
	border-collapse:collapse;
}
table.chart th,table.chart td{
	margin:0px;
	padding:3px;
	width:160px;
	text-align:center;
	border-right:1px solid #cccccc;
	border-bottom:1px solid #cccccc;
}
table.chart caption{
	margin:0;padding:0;
	text-align:right;
}
table.chart thead th{
	background-color:#e9e9e9;
	border-bottom:1px solid #999999;
}
.button{
	height: 50px;									/*  width,height 크기 설정 */
	width: 90px;
	font-size: 13px;								/* 버튼 내의 fontsize는 18px이 되도록 함 */
	float:right;
	margin-bottom: 10px;							/* 10px 밑에 다른 style이 오도록 함 */
	font-weight: bold;								/* 글씨는 두껍게 나오도록 함 */	 
	text-align: center;								/* 버튼 내 글씨 가운데로 지정 */
	background-color: white;						/* 버튼 색상 지정 */
	border: none;									/* 버튼 테두리 없도록 */
	border-radius: 5px;								/* 버튼 테두리의 둥근정도를 조정 */
	color: #ED4C00;									/* 버튼 내 글씨 색상 지정 */
}
</style>
<body>
<div class = "container">
		<table class="chart" style="text-align: center; border: 1px solid #dddddd">
			<thead>
				<tr>
					<th colspan = "2" style="background-color: #eeeee; text-align: center; "> 게시판 글쓰기 </th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td><input type="text" placeholder="글 제목" name = "bbsTitle" maxlength = "50" ></td>
					<td><textarea type="text" placeholder="글 내용" name = "bbsContent" maxlength = "2048" style = "height:350px" ></textarea></td>
				</tr>
			</tbody>
			<input type="submit" name ="submit" value = "작성하기" class = "button"></a> 
		</table>
	</div>
	
</body>
</html>