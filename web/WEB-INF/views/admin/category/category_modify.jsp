<%--
  分类修改
  Author: asuk
  DateTime: 2020/8/20 16:01
  Phone: 18579133013
  Email: 1352348805@qq.com
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String path = request.getContextPath();
%>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <title>分类修改</title>
    <link type="text/css" rel="stylesheet" href="<%=path%>/static/css/admin.css"/>
    <link rel="stylesheet" href="<%=path%>/static/layuiadmin/layui/css/layui.css" media="all"/>
</head>
<body>
<!--头部-->
<%@include file="../../common/admin/head.jsp" %>
<!--时间-->
<%@include file="../../common/admin/time.jsp" %>
<!--主体内容-->
<section class="publicMian ">
    <%@include file="../../common/admin/leftnav.jsp" %>
    <input type="hidden" id="path" name="path" value="${pageContext.request.contextPath }"/>
    <div class="right" style="text-align: center;">
        <div class="layui-inline" >
            <table class="layui-table" style="margin: 20% auto;">
                <tbody>
                <c:set var="size" value="${postClassList.size()}" />
                <tr>
                    <td colspan="2" style="text-align: center;font-size: 20px;font-family: 宋体">
                        修改分类
                    </td>
                </tr>
                <tr>
                    <td width="135" align="right">分类级别</td>
                    <td colspan="3" style="font-family:'宋体';">
                        <select class="jj" name="type" style="background-color:#f6f6f6;" id="type"
                                disabled="disabled">
                            <option value="" selected="selected">请选择...</option>
                            <option value="1" ${size == 1 ? "selected":""}>一级分类
                            </option>
                            <option value="2" ${size == 2 ? "selected":""}>二级分类
                            </option>
                            <option value="3" ${size == 3 ? "selected":""}>三级分类
                            </option>
                        </select>
                    </td>
                </tr>

                <c:if test="${size > 1}">
                    <tr>
                        <td width="135" align="right">一级分类</td>
                        <td colspan="3" style="font-family:'宋体';">
                            <select class="jj" name="categoryLevel1" style="background-color:#f6f6f6;" id="categoryLevel1"
                                    disabled="disabled">
                                <option value="0">请选择...</option>
                                <option value="${postClassList[0].classId}" selected="selected">${postClassList[0].className}</option>
                            </select>
                        </td>
                    </tr>
                </c:if>
                <c:if test="${size > 2}">
                    <tr>
                        <td width="135" align="right">二级分类</td>
                        <td>
                            <select class="jj" name="categoryLevel2" style="background-color:#f6f6f6;" id="categoryLevel2" disabled="disabled">
                                <option value="${postClassList[1].classId}" selected="selected">${postClassList[1].className}</option>
                            </select>
                        </td>
                    </tr>
                </c:if>

                <tr>
                    <td align="right">分类名称</td>
                    <td style="font-family:'宋体';">
                        <input type="text" value="${postClassList[size-1].className}" class="add_ipt" id="name">（必填）
                    </td>
                </tr>
                <tr>
                    <td align="right">
                        分类描述
                    </td>
                    <td>
                        <input type="text" value="${postClassList[size-1].classDescribe}" class="add_ipt" id="classDescribe">
                    </td>
                </tr>
                <tr>
                    <td colspan="2" align="right">
                        <button class="layui-btn layui-btn-sm" onclick="modifyClass(${postClassList[size-1].classId});">
                            <i class="layui-icon">&#xe608;</i> 修改
                        </button>
                    </td>
                </tr>
                </tbody>
            </table>
        </div>
    </div>
</section>
<footer class="footer">
    版权归来贴项目组
</footer>
<input type="hidden" id="path" value="<%=path%>"/>
<script type="text/javascript" src="<%=path%>/static/js/admin/time.js"></script>
<script type="text/javascript" src="<%=path%>/static/js/jquery.js"></script>
<script type="text/javascript" src="<%=path%>/static/layuiadmin/layui/layui.js"></script>
<script type="text/javascript" src="<%=path%>/static/calendar/WdatePicker.js"></script>
<script>
    var path = $("#path").val();
    layui.use('layer', function(){
        var layer = layui.layer;
    });

    function modifyClass(classId) {
        let className = $("#name").val();
        let classDescribe = $("#classDescribe").val();
        if (className.trim() == '') {
            $("#name").val('');
            layer.msg('请填写分类名称');
            return;
        }
        let data = {
            action : 'modifyCategory',
            classId : classId,
            className : className,
            classDescribe : classDescribe,
        }
        $.post(path + '/admin',data,function (result) {
            if (result.code == 200) {
                layer.msg('修改成功!',{
                    time : 1000
                });
                location.href = path + '/admin?action=categoryList';
            } else {
                layer.msg(result.message);
            }
        },'json');
    }
</script>

</body>
</html>
