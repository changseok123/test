<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<div class="main_jumpo">
		<div class="search_result">
			<p>" ȫ�� " �� �˻����
			</p>
		</div>


		<div class="jumpo_name">
			<div class="state">

				<p>HOT 3</p>
			</div>
			<div class="row">
				<div class="sebu">
					<!-- ����/��/��ȸ�� �����ֱ� -->
					<table class="table">
						<tr class="table_title1">

							<th width=40% class="text-center">����</th>
							<th width=20% class="text-center">�ۼ���</th>
							<th width=20% class="text-center">�ۼ���</th>
							<th width=20% class="text-center table_count">��ȸ��</th>

						</tr>
						<!-- for(FreeBoardVO vo:list) �Ʒ��� ���� -->
						<c:forEach var="item" begin="1" end="5" step="1">

							<tr class="table_content">

								<td width=40% class="text-left"><a href="#">&nbsp;&nbsp;����</a>
									&nbsp; <%-- <c:if test="${vo.count!=0 }">
								(${vo.count })
							</c:if> --%></td>
								<td width=20% class="text-center">�̸�</td>
								<td width=20% class="text-center">�ۼ���</td>
								<td width=20% class="text-center table_count">��ȸ��</td>
							</tr>
						</c:forEach>
					</table>
					<table class="table">
						<tr>
							<td class="text-right"><a href="#" class="btn">����</a>&nbsp;
								pages<a href="#" class="btn">����</a>&nbsp;&nbsp;</td>
						</tr>
					</table>

				</div>

			</div>

		</div>
	</div>

</body>
</html>