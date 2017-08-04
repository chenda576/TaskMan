<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<%@ taglib uri="/struts-dojo-tags" prefix="sx" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'publish.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<s:head/>
	<sx:head/>
	<script type="text/javascript">
		var msg="<s:property value="msg"/>";
		if(msg!=""){
			alert(msg);
		}
		</script>
		<script type="text/javascript">
		function changeText(str){
			for(var i=1;i<=3;i++){
				if(i==str){
					document.getElementById("text"+i).style.display = "block";
				}
				else{
					document.getElementById("text"+i).style.display = "none";
				}
			}
		}
		
	</script>
  </head>
  
  <body>
    <s:textfield id="text1" value="text1" cssStyle="display:none"/>
	<s:textfield id="text2" value="text2" cssStyle="display:none"/>
	<s:textfield id="text3" value="text3" cssStyle="display:none"/>

	<select onchange="changeText(this.value)">
         <option value="1">显示text1</option>
         <option value="2">显示text2</option>
         <option value="3">显示text3</option>
	</select>
  </body>
</html>
