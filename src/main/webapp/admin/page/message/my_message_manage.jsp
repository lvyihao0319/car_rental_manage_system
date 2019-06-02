<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>  
<%@page isELIgnored="false"  %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+request.getContextPath()+"/";%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base href="<%=basePath %>">

<script type="text/javascript" src="/static/jquery.min.js"></script>
<link href="/static/favicon.ico" rel="shortcut icon" />
<link rel="stylesheet" href="/static/layui/css/layui.css">
<script src="/static/layui/layui.js"></script>
<!-- 引入manage 的基础css -->
<script	src="/static/common/manage/manage_base.js"></script>
<link href="/static/common/manage/manage_base.css" rel="stylesheet"/>
<!-- 引入manage 的基础css -->

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript">
	function a(){}
</script>
<title>Insert title here</title>
</head>
<style>

/*修改table表格  左右内边框 为0*/
.layui-table-cell {
	padding-left: 0px;
	padding-right: 0px;
	text-align: center;
}
/*修改table表格 左右内边框 为0*/

</style>
<body>
<script>
var global_ids;
var global_ids_len;

var w ;//窗口的宽
var h ;//窗口的高

function add(){
	w = 700;
	h = 300;
	checkWindow();
	layer.open({
	  type: 2,
	  title: '添加',
	  shadeClose: true,
	  shade: 0.8,
	  area: [w+'px', h+'px'],
	  content: 'houtai/message/add'  //iframe的url
	});
}




//子窗口调用 的  关闭窗口方法 
function closeDlg(msg){
	 layer.closeAll();
	 layer.msg(msg);
	 reload_data();
}

//相当前刷新  重新加载
function reload_data(){
	table.reload('table', {
		 where: {},page:{curr: 1}
    });
}
</script>

<div class="layui-form" style="min-width:1000px;">

<div class="layui-table-toolbar" style="margin-bottom: 3px; ">
	<div class="layui-btn-group">
		<button class="layui-btn layui-btn-sm" onclick="add()"><i class="layui-icon">&#x1002;</i>我要留言</button>
	    <button class="layui-btn layui-btn-sm" onclick="reload_data()"><i class="layui-icon">&#x1002;</i>刷新</button>
 	 </div>
</div>




<table class="layui-hide"   id="table" lay-filter="table"></table> 

<script type="text/html" id="format_user_name">
  {{#  if(d.userId!= null){ }}
	 {{d.user.trueName}} 
  {{#  } else { }}
  {{#  } }}
</script>


<script type="text/html" id="format_user_num">
  {{#  if(d.userId!= null){ }}
	 {{d.user.num_}} 
  {{#  } else { }}
  {{#  } }}
</script>




<script>
		layui.use([ 'laydate', 'laypage', 'layer', 'table', 'carousel',
				'upload', 'element' ], function() {
			var laydate = layui.laydate //日期
			, laypage = layui.laypage //分页
			layer = layui.layer //弹层
			, table = layui.table //表格
			, carousel = layui.carousel //轮播
			, upload = layui.upload //上传
			, element = layui.element; //元素操作
			  table.render({
			    elem: '#table'
			    ,url: 'admin/message/list',
			    height: 'full-160',
			   cols: [[
					
			       {checkbox: true, width:50, fixed: true}
			       ,{field:'userId', title: '账号', width:80 ,style:'font-size: 12px;',templet: '#format_user_num'}
			      ,{field:'userId', title: '租用人姓名', width:80 ,style:'font-size: 12px;',templet: '#format_user_name'}
			      ,{field:'createDateTime', title: '留言时间', width:150,  style:'font-size: 12px;'}
			      ,{field:'content', title: '留言内容', width:300,style:'font-size: 12px;'}
			      
			      
			    ]]
			    ,id: 'table'
			    ,page: true
			    ,limits:[10,50,100,200,500,1000],
			   limit:10
			  });
			
			//监听工具条 table_bar
				table.on('tool(table)', function(obj) { //注：tool是工具条事件名，test是table原始容器的属性 lay-filter="对应的值"
					
					var data = obj.data //获得当前行数据
					, layEvent = obj.event; //获得 lay-event 对应的值
					if (layEvent === 'add_send_list') {
						//layer.msg('查看操作' + data.id);
						add_send_list(data.id)
					} else if (layEvent === 'see') {
						see(data.id);
					} else if (layEvent === 'edit') {
						//layer.msg('编辑操作' + data.id);
						edit(data.id);
					} else if(layEvent === 'return_'){
						return_(data.id);
					}else if(layEvent ==='see_wxuser_info'){
					}
					
					
				});
			
				//常规用法
				  laydate.render({
				    elem: '#startDateTime'
				  });
				
				//常规用法
				  laydate.render({
				    elem: '#endDateTime'
				  });
		});
</script>
</body>
</html>