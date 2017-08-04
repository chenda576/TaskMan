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
                  <h3 class="box-title">别人发布的任务</h3>
                  <div class="box-tools">
                    <s:form action="searchTask" method="post">
                      <div class="input-group" style="width: 150px;">
                        <s:textfield name="str" cssClass="form-control input-sm pull-right" placeholder="输入关键词" cssStyle="height:34px"></s:textfield>
                        <div class="input-group-btn">
                          <s:submit cssClass="btn btn-info btn-flat" value="搜索"></s:submit>
                        </div>
                      </div>
                    </s:form>
                  </div>
                </div><!-- /.box-header -->
                <div class="box-body table-responsive no-padding">
                <s:if test="#request.tlist!=null">
    			  <s:set name="tlist" value="#request.tlist" />
    			  <s:set name="wlist" value="#request.wlist" />
	                <table class="table table-hover">
	                  <tr>
	                    <th>标题</th>
	                    <th>发布人</th>
	                    <th>结束时间</th>
	                    <th>地点</th>
	                    <th>金额</th>
	                    <th>操作</th>
	                  </tr>
	                  <s:iterator value="tlist" status="st">
		    		  <tr>
		    			<td><s:property value="brief" /></td>
		   				<td><s:property value="publisher" /></td>
		    			<td><s:property value="etime" /></td>
		    			<td><s:property value="addr" /></td>
		    			<td><s:property value="money" /></td>
			    		<td>
				    	  <s:if test="#wlist[#st.index]">
				    		<s:a href="unwilling.action?tid=%{taskId}">取消愿意</s:a>
				    	  </s:if>
				   		  <s:else>
				   			<s:a href="willing.action?tid=%{taskId}">愿意</s:a>
				   		  </s:else>
			    	 	</td>
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
