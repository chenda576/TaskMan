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
    <base href="<%=basePath%>">
    
    <title>正在进行中的任务</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	<title>任务详情</title>
    <!-- Tell the browser to be responsive to screen width -->
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
    <!-- Bootstrap 3.3.5 -->
    <link rel="stylesheet" href="templete/bootstrap/css/bootstrap.min.css">
    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">
    <!-- Ionicons -->
    <link rel="stylesheet" href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
    <!-- Theme style -->
    <link rel="stylesheet" href="templete/dist/css/AdminLTE.min.css">
    <!-- AdminLTE Skins. Choose a skin from the css/skins
         folder instead of downloading all of them to reduce the load. -->
    <link rel="stylesheet" href="templete/dist/css/skins/_all-skins.min.css">
    <style>
      .example-modal .modal {
        position: relative;
        top: auto;
        bottom: auto;
        right: auto;
        left: auto;
        display: block;
        z-index: 1;
      }
      .example-modal .modal {
        background: transparent !important;
      }
    </style>
	
	<%
   		String detail = (String)request.getParameter("content");
		UserInfo user=(UserInfo)session.getAttribute("user");
		if(null == user){
			response.sendRedirect("login.jsp");
    		return;
		}
	%>
	<s:head/>
	<sx:head/>
    
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
            <li class="header">个人操作</li>
            <!-- Optionally, you can add icons to the links -->
            <li class="active"><s:a href="publish.jsp"><i class="fa fa-link"></i> <span>发布任务</span></s:a></li>
            <li><s:a href="searchTask.action?"><i class="fa fa-link"></i> <span>任务列表</span></s:a></li>
            <li class="treeview">
              <a href="#"><i class="fa fa-link"></i> <span>我的任务</span> <i class="fa fa-angle-left pull-right"></i></a>
              <ul class="treeview-menu">
                <li><s:a href="personTask.action?">我发布的任务</s:a></li>
                <li><s:a href="proceed.action?">接到的任务</s:a></li>
              </ul>
            </li>
          </ul><!-- /.sidebar-menu -->
        </section>
        <!-- /.sidebar -->
      </aside>

      <!-- Content Wrapper. Contains page content -->
      <div class="content-wrapper">
          <div class="example-modal">
            <div class="modal modal-success">
              <div class="modal-dialog">
                <div class="modal-content">
                  <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title">任务详情</h4>
                  </div>
                  <div class="modal-body">
                    <p><%=detail %></p>
                  </div>
                  <div class="modal-footer">
                    <input type="button" class="btn btn-outline pull-left" data-dismiss="modal" onclick="javascript:window.history.back(-1);" value="返回上一页"/>
                  </div>
                </div><!-- /.modal-content -->
              </div><!-- /.modal-dialog -->
            </div><!-- /.modal -->
          </div><!-- /.example-modal -->
          </div>
          </div>

    <!-- jQuery 2.1.4 -->
    <script src="templete/plugins/jQuery/jQuery-2.1.4.min.js"></script>
    <!-- Bootstrap 3.3.5 -->
    <script src="templete/bootstrap/js/bootstrap.min.js"></script>
    <!-- FastClick -->
    <script src="templete/plugins/fastclick/fastclick.min.js"></script>
    <!-- AdminLTE App -->
    <script src="templete/dist/js/app.min.js"></script>
    <!-- AdminLTE for demo purposes -->
    <script src="templete/dist/js/demo.js"></script>
  </body>
</html>
