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
<!--添加  vue.js 支持加载-->
<script src="/static/vue/vue.min.js"></script>
<!--添加  vue.js 支持加载-->

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript">
	function a(){}
</script>
<title>Insert title here</title>
<script>
var save_url = '${save_url}';
function save(){
	var index = layer.load(1, {
		  shade: [0.1,'#fff'] //0.1透明度的白色背景
	});
	
	$.post(save_url,{
		password:app.password
		},function(result){
		if(result.success){
			//调用 父窗口的  关闭所有窗口 并且刷新 页面
			window.parent.closeDlg(result.msg);
		}else{
			layer.closeAll();//关闭loading
			layer.msg(result.msg);
		}
	},'json');
}

</script>
<style>
html, body {
}
.layui-form-item {
    margin-bottom: 3px;
}
</style>
</head>
<body id="app">

<div style="padding: 10px;">
	<form class="layui-form layui-form-pane">
	  
	  <div class="layui-form-item">
	    <label class="layui-form-label">新密码</label>
	    <div class="layui-input-block">
		      <input type="text" id="trueName" autocomplete="off" value="" v-model="password" placeholder="请输入新密码" class="layui-input">
	    </div>
	  </div>
	  </form>
		<div class="site-demo-button" style="margin-top: 20px;">
		  <button id="save" onclick="save()" class="layui-btn site-demo-layedit" data-type="content">确定提交</button>
		</div>
</div>

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
});
</script>
<script>
var app = new Vue({
	el : '#app',
	data : {
	}
});
 
</script>


</body>
</html>