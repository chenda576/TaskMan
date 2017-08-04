<%@ page language="java" import="java.util.*,org.model.UserInfo" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<%@ taglib uri="/struts-dojo-tags" prefix="sx" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>发布任务</title>
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
    <link rel="stylesheet" href="templete/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
    <link rel="stylesheet" href="templete/dist/css/AdminLTE.min.css">
    <link rel="stylesheet" href="templete/dist/css/skins/skin-green.min.css">
	<s:head/>
	<sx:head/>
	<script src="templete/plugins/datepicker/bootstrap-datepicker.js"></script>
	
	<script type="text/javascript">
		var msg="<s:property value="msg"/>";
		if(msg!=""){
			alert(msg);
		}
	</script>
	
	<script type="text/javascript">  
	function Numbers(e)   
	{   
	var keynum   
	var keychar   
	var numcheck   
	  
	if(window.event) // IE   
	{   
	keynum = e.keyCode   
	}   
	else if(e.which) // Netscape/Firefox/Opera   
	{   
	keynum = e.which   
	}   
	keychar = String.fromCharCode(keynum)   
	numcheck = /\d/   
	return numcheck.test(keychar)   
	}   
	</script>  
	<%
		UserInfo user=(UserInfo)session.getAttribute("user");
		if(null == user){
			response.sendRedirect("login.jsp");
    		return;
		}
	%>
  </head>
  
  <body class="hold-transition skin-green sidebar-mini">
    <div class="wrapper">
      <header class="main-header">
        <a class="logo">
          <span class="logo-lg">TASKMAN</span>
        </a>
        <nav class="navbar navbar-static-top" role="navigation">
          <div class="navbar-custom-menu">
            <ul class="nav navbar-nav">
              <li class="dropdown messages-menu">
              <li class="dropdown notifications-menu">
                <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                  <i class="fa fa-bell-o"></i>
                  <span class="label label-warning">10</span>
                </a>
                <ul class="dropdown-menu">
                  <li class="header">You have 10 notifications</li>
                  <li>
                    <ul class="menu">
                      <li>
                        <a href="#">
                          <i class="fa fa-users text-aqua"></i> 5 new members joined today
                        </a>
                      </li>
                    </ul>
                  </li>
                  <li class="footer"><a href="#">View all</a></li>
                </ul>
              </li>
              <li class="dropdown user user-menu">
                <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                  <img src="image/icon_head/default_pic.jpg" class="user-image" alt="User Image">
                  <span class="hidden-xs"><%=user.getNickName() %></span>
                </a>
                <ul class="dropdown-menu">
                  <li class="user-header">
                    <img src="image/icon_head/default_pic.jpg" class="img-circle" alt="User Image">
                    <p>
						信誉值：<%=user.getCredit() %><br>
						拥有金币：<%=user.getGold() %>
                    </p>
                  </li>
                  <li class="user-body">
                    <div class="col-xs-4 text-center" style="width:60px">
                      <a href="#">关注</a>
                    </div>
                    <div class="col-xs-4 text-center" style="width:120px">
                      <a href="#">关注我的</a>
                    </div>
                    <div class="col-xs-4 text-center" style="width:60px">
                      <a href="#">朋友</a>
                    </div>
                  </li>
                  <li class="user-footer">
                    <div class="pull-left">
                      <a href="#" class="btn btn-default btn-flat">Profile</a>
                    </div>
                    <div class="pull-right">
                      <a href="login.jsp" class="btn btn-default btn-flat">Sign out</a>
                    </div>
                  </li>
                </ul>
              </li>
            </ul>
          </div>
        </nav>
      </header>
      
       <aside class="main-sidebar">
        <section class="sidebar">
          <div class="user-panel">
            <div class="pull-left image">
              <img src="image/icon_head/default_pic.jpg" class="img-circle" alt="User Image">
            </div>
            <div class="pull-left info">
              <p><%=user.getNickName() %></p>
              <s:a href="#">完善你的个人信息</s:a>
            </div>
          </div>
          <ul class="sidebar-menu">
            <li class="header">套用模板</li>
            <li class="treeview">
              <a href="#"><i class="fa fa-link"></i> <span>套用模板</span> <i class="fa fa-angle-left pull-right"></i></a>
              <ul class="treeview-menu">
                <li><s:a href="#">拿快递</s:a></li>
                <li><s:a href="#">拿外卖</s:a></li>
                <li><s:a href="#">食堂打饭</s:a></li>
                <li><s:a href="#">上课代签到</s:a></li>
                <li><s:a href="#">代考</s:a></li>
                <li><s:a href="#">交易二手货</s:a></li>
                <li><s:a href="#">找个女朋友</s:a></li>
                <li><s:a href="#">代做课程设计</s:a></li>
              </ul>
            </li>
          </ul><!-- /.sidebar-menu -->
        </section>
        <!-- /.sidebar -->
      </aside>
      
      <div class="content-wrapper">
        <!-- Content Header (Page header) -->
        <section class="content-header">
          <h1>发布任务</h1>
        </section>

        <!-- Main content -->
        <section class="content">
          <div class="box-body">
           <s:form action="publish" method="post">
            <div class="form-group">
             <label>标题</label>
             <s:textfield name="task.brief" placeholder="简要描述任务" cssClass="form-control" ></s:textfield>
            </div>
			<div class="form-group">
             <label>选择完成任务的地点</label>
             <select class="form-control" name="task.addr" id="select_addr">
               <option value="新世纪">新世纪</option>
               <option value="南区">南区</option>
               <option value="东区">东区</option>
               <option value="校内">校内</option>
               <option value="其他">其他</option>
             </select>
             <s:textfield id="addr" name="addr_detail" placeholder="详细地点" cssClass="form-control"></s:textfield>
            <!-- textarea -->
            <div class="form-group">
             <label>任务细节</label>
             <s:textarea name="task.detail" cssClass="form-control" rows="3" placeholder="我们不会对所有用户公开你的细节，只有接单的用户才可以看到你的任务细节描述" ></s:textarea>
            </div>
            <div class="form-group">
             <label>悬赏金额</label>
             <s:textfield name="task.money" placeholder="只能输入数字" cssClass="form-control" onkeypress="return Numbers(event)"></s:textfield>
            </div>
            <div class="form-group">
             <label>交付时间</label><br>
             <sx:datetimepicker name="task.etime" displayFormat="yyyy-MM-dd" cssStyle="width:40%"></sx:datetimepicker>
            </div>
            <s:submit cssClass="btn btn-primary" value="发布"></s:submit>
		   </div>
		   </s:form>
         </div><!-- /.box-body -->
        </section><!-- /.content -->
      </div><!-- /.content-wrapper -->
      <script src="templete/plugins/jQuery/jQuery-2.1.4.min.js"></script>
      <script src="templete/bootstrap/js/bootstrap.min.js"></script>
      <script src="templete/dist/js/app.min.js"></script>
  </body>
</html>
