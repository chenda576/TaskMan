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
    <title>任务列表</title>
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
    <link rel="stylesheet" href="templete/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
    <link rel="stylesheet" href="templete/dist/css/AdminLTE.min.css">
    <link rel="stylesheet" href="templete/dist/css/skins/skin-green.min.css">
	<s:head/>
	<sx:head/>
	<script type="text/javascript">
		var msg="<s:property value="msg"/>";
		if(msg!=""){
			alert(msg);
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
      
      <div class="content-wrapper">
        <!-- Content Header (Page header) -->
        <section class="content-header">
          <h1>任务列表</h1>
        </section>

        <!-- Main content -->
        <section class="content">
		  <div class="row">
            <div class="col-xs-12">
              <div class="box">
                <div class="box-header">
                  <h3 class="box-title">接到的任务</h3>
                </div><!-- /.box-header -->
                <div class="box-body table-responsive no-padding">
                <s:if test="#request.plist!=null">
    			  <s:set name="plist" value="#request.plist" />
	                <table class="table table-hover">
	                  <tr>
	                    <th style="text-align:center">标题</th>
		    			<th style="text-align:center">发布人</th>
		    			<th style="text-align:center">结束时间</th>
		    			<th style="text-align:center">地点</th>
		    			<th style="text-align:center">金额</th>
		    			<th style="text-align:center">任务细节</th>
		    			<th style="text-align:center">状态</th>
		    			<th style="text-align:center">操作</th>
	                  </tr>
	                  <s:iterator value="plist" status="st">
		    		  <tr>
		    		  	<td style="text-align:center"><s:property value="brief" /></td>
		   				<td style="text-align:center"><s:property value="publisher" /></td>
		    			<td style="text-align:center"><s:property value="etime" /></td>
		    			<td style="text-align:center"><s:property value="addr" /></td>
		    			<td style="text-align:center"><s:property value="money" /></td>
		    			<td style="text-align:center"><s:a href="taskDetail.jsp?content=%{detail}">查看详情</s:a></td>
		    			<s:if test="done">
		    			 <td style="text-align:center"><span class="label label-success">已完成</span></td>
		    			</s:if>
		    			<s:elseif test="refund">
		    			 <td style="text-align:center"><span class="label label-danger">对方发起退款申请</span></td>
		    			 <td style="text-align:center">
		    				<s:a href="agreeRefund.action?tid=%{taskId}&gnum=%{money}&uname=%{publisher}">同意</s:a>&nbsp;&nbsp;&nbsp;&nbsp;
		    				<s:a href="disagreeRefund.action?tid=%{taskId}">不同意</s:a>
		    			 </td>
		    			</s:elseif>
		    			<s:else>
		    			 <td style="text-align:center"><span class="label label-warning">进行中</span></td>
		    			 <td style="test-align:center"><s:a href="quitTask.action?tid=%{taskId}&gnum=%{money}">老子不干啦</s:a></td>
		    			</s:else>
					  </tr>
		   			  </s:iterator>
	                </table>
	              </s:if>
                </div><!-- /.box-body -->
              </div><!-- /.box -->
            </div>
          </div>
        </section><!-- /.content -->
      </div><!-- /.content-wrapper -->
      
      <script src="templete/plugins/jQuery/jQuery-2.1.4.min.js"></script>
      <script src="templete/bootstrap/js/bootstrap.min.js"></script>
      <script src="templete/dist/js/app.min.js"></script>
  </body>
</html>
