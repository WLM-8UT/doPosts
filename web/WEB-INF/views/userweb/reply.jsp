<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
    <%
        String path = request.getContextPath();
    %>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>${post.postName}</title>
    <meta name="description" content="">
    <meta name="keywords" content="">
    <link rel="stylesheet" href="<%=path%>/static/layuiadmin/layui/css/layui.css" media="all"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath }/static/css/common.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath }/static/css/fontawesome-all.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/static/css/style.login.css" type="text/css"
          media="all"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath }/static/css/default.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/static/css/search-form.css">
    <link rel="stylesheet"
          href="${pageContext.request.contextPath }/static/css/vendor/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/static/css/style.nav.css">
    <link href="https://fonts.googleapis.com/css?family=Rubik:300,400,500" rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/static/css/styles-merged.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/static/css/custom.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/static/font-awesome/css/font-awesome.css">
    <!--[if lt IE 9]>
    <script src="/static/js/vendor/html5shiv.min.js"></script>
    <script src="/static/js/vendor/respond.min.js"></script>
    <![endif]-->
    <script type="text/javascript" src="${pageContext.request.contextPath }/static/layuiadmin/layui/layui.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath }/static/js/jquery-3.3.1.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath }/static/js/jquery-1.11.0.min.js"></script>
    <script src="${pageContext.request.contextPath }/static/js/bootstrap.min.js"
            type="text/javascript" charset="utf-8"></script>
    <script src="${pageContext.request.contextPath }/static/js/bootbox.min.js"></script>
</head>
<body>
<script type="text/javascript">
    var postId =${param.postId};

    function searchToggle(obj, evt) {
        var container = $(obj).closest('.search-wrapper');
        if (!container.hasClass('active')) {
            container.addClass('active');
            evt.preventDefault();
        } else if (container.hasClass('active') && $(obj).closest('.input-holder').length == 0) {
            container.removeClass('active');
            // clear input
            container.find('.search-input').val('');
            // clear and hide result container when we press close
            container.find('.result-container').fadeOut(100, function () {
                $(this).empty();
            });

        } else {
            //执行查询
            var seach = $(".search-input").val().trim();
            if (seach == null || seach == '') {
                $(".result-container").css({"display": "block"});
                return false;
            } else {
                $(".result-container").css({"display": "none"});
            }
            $.post("${pageContext.request.contextPath}/reply/getReplyByContent", {
                name: seach,
                postId: postId
            }, function (date) {
                date = eval(date);
                console.log(date);
                var table = "";
                for (var i = 0; i < date.length; i++) {
                    table += "<div class='col-md-12 col-sm-6 probootstrap-animate fadeInUp probootstrap-animated'>" +
                        "<div class='probootstrap-block-image'><div class='text'>" +
                        "<span class='clearfix like'>" +
                        "<a class='hint info-right'	href='#' title='" + date[i].replyDate + "'><i class='fa fa-clock-o'>" + date[i].replyDate + "</i></a>" +
                        "<a class='hint info-left ' href='#' title='主题作者：" + date[i].accountName + "'><i class='fa fa-user'>" + date[i].accountName + "</i></a>" +
                        "</span>" +
                        "<p class='dark' style='80px'>" + date[i].replyContent + "</p>" +
                        "<p><img src='${pageContext.request.contextPath }/img/img_1.jpg' style='width:50px ;height:50px'></p>" +
                        "<hr><p class='clearfix like'>" +
                        "<a class='pull-right hint unlike' href='" + date[i].replyId + "'><i class='fa fa-thumbs-down'>" + date[i].unlikeSum + "</i></a>" +
                        "<a class='pull-right hint nlike' href='" + date[i].replyId + "'><i class='fa fa-thumbs-up'>" + date[i].likeSum + "</i></a>" +
                        "<a class='pull-right hint' href='#'><i class='fa fa-heart'></i></a>" +
                        "</p></div></div></div>"
                }
                $(".bar").html(table);
            });

        }
    }
</script>
<script type="text/javascript">
    $(function () {
        var postId =${param.postId};
        showPost();

        //点踩
        $(document).on("click", ".unlike", function (event) {
            event.preventDefault();
            var replyId = $(this).attr("href");
            var unlikesum = $(this).children().eq(0);
            var likesum = $(this).next().children().eq(0);
            var accountId = "${sessionScope.account.accountId}";
            if (accountId == null || accountId == '') {
                $("#accountLogin").modal('show');
                return false;
            }
            var param = {
                replyId: replyId,
                accountId: accountId,
                EvaluateState: 2

            }
            $.post("${pageContext.request.contextPath}/replyEvaluate/doupate", param, function (date) {
                date = eval(date);
                if (date.unlikeSum == unlikesum.html()) {
                    alert("你已经点踩过了");
                } else {
                    likesum.html(date.likeSum);
                    unlikesum.html(date.unlikeSum);
                }

            });
        });
        $(document).on("click", ".nlike", function (event) {
            event.preventDefault();
            var replyId = $(this).attr("href");
            var likesum = $(this).children().eq(0);
            var unlikesum = $(this).prev().children().eq(0);
            var accountId = "${sessionScope.account.accountId}";
            if (accountId == null || accountId == '') {
                $("#accountLogin").modal('show');
                return false;
            }
            var param = {
                replyId: replyId,
                accountId: accountId,
                EvaluateState: 1

            }
            $.post("${pageContext.request.contextPath}/replyEvaluate/doupate", param, function (date) {
                date = eval(date);
                if (date.likeSum == likesum.html()) {
                    alert("你已经点赞过了");
                } else {
                    likesum.html(date.likeSum);
                    unlikesum.html(date.unlikeSum);
                }


            });
        });

        //发表
        $("#spend").click(function (event) {
            event.preventDefault();
            var account = "${sessionScope.account.accountId}";
            if (account == null || account == '') {
                $("#accountLogin").modal('show');
                return false;
            }
            var content = $("#replyContent").val();
            if (content == null || content == '') {
                alert("内容不能为空");
                return false;
            }
            $(".postId").val(postId);
            $(".accountId").val("${sessionScope.account.accountId}");
            $(".probootstrap-form").submit();

        });

        //查询帖子所有的回复
        function showPost() {
            $.post("${pageContext.request.contextPath}/reply/getAllReply", {postId: postId}, function (date) {
                date = eval(date);
                console.log(date);
                var table = "";
                for (var i = 0; i < date.length; i++) {
                    table += "<div class='col-md-12 col-sm-6 probootstrap-animate fadeInUp probootstrap-animated'>" +
                        "<div class='probootstrap-block-image'><div class='text'>" +
                        "<span class='clearfix like'>" +
                        "<a class='hint info-right'href='#' title='" + date[i].replyDate + "'><i class='fa fa-clock-o'>" + date[i].replyDate + "</i></a>" +
                        "<a class='hint info-left ' href='#' title='主题作者：" + date[i].accountName + "'><i class='fa fa-user'>" + date[i].accountName + "</i></a>" +
                        "</span>" +
                        "<p class='dark' style='80px'>" + date[i].replyContent + "</p>" +
                        "<p><img src='${pageContext.request.contextPath }/img/img_1.jpg' style='width:50px ;height:50px'></p>" +
                        "<hr><p class='clearfix like'>" +
                        "<a class='pull-right hint unlike' href='" + date[i].replyId + "'><i class='fa fa-thumbs-down'>" + date[i].unlikeSum + "</i></a>" +
                        "<a class='pull-right hint nlike' href='" + date[i].replyId + "'><i class='fa fa-thumbs-up'>" + date[i].likeSum + "</i></a>" +
                        "<a class='pull-right hint' href='#'><i class='fa fa-heart'></i></a>" +
                        "</p></div></div></div>"
                }
                $(".bar").html(table);
            });
        }

        function showBar() {
            $.post("${pageContext.request.contextPath}/bar/skipPost", {barId: barId}, function (date) {
                date = eval(date);
                $(".barDescribe").html(date.barDescribe);
                $(".barName").html(date.barName);
            });
        }


        $(".file").click(function () {
            document.getElementById("photo").click();
        });

    });
</script>
<style>
    /* .probootstrap-block-image {
        margin-bottom: 30px;
          background: linear-gradient(to right,#9b76ff 0,#f54ea2 100%);
    } */
</style>
<div class="leftNav-item">
    <ul>
        <li>
            <i class="fa fa-user-circle"></i>
            <a href="javascript:void(0)" class="rota">个人中心</a>
        </li>
        <li title="回复">
            <i class="fa fa-pencil-square-o"></i>
            <a href="#send" class="rota">回复</a>
        </li>
        <li title="回到顶部" class="for-top">
            <i class="fa fa-arrow-up"></i>
            <a href="javascript:;" class="rota">去顶部</a>
        </li>
    </ul>
</div>
<!-- START: header -->
<header role="banner" class="probootstrap-header">
    <div class="container-fluid">

        <div class="mobile-menu-overlay"></div>

        <nav role="navigation" class="probootstrap-nav hidden-xs">
            <ul class="probootstrap-main-nav">
                <li><a href="${pageContext.request.contextPath }/user?action=toLogin">登录</a></li>
                <li><a href="${pageContext.request.contextPath }/user?action=toRegister">注册</a></li>
            </ul>
            <div class="extra-text visible-xs">
                <ul class="social-buttons">
                    <li><a href="#"><i class="icon-twitter"></i></a></li>
                    <li><a href="#"><i class="icon-facebook"></i></a></li>
                    <li><a href="#"><i class="icon-instagram2"></i></a></li>
                </ul>
            </div>
        </nav>
    </div>
</header>
<!-- END: header -->
<style>
    .hint {
        margin-right: 20px;
    }

    .info-left {
        float: left;
        font-size: 16px;
        color: black ! important;
    }

    .info-right {
        float: right;
        font-size: 16px;
        color: black ! important;
    }
</style>
<!-- START: section -->
<section class="probootstrap-intro"
         style="background-image: url(${pageContext.request.contextPath }/static/images/1234.jpg);height: 400px; background-size: 100% 700px;"
         data-stellar-background-ratio="0.5">
    <div class="container-fluid">
        <div class="row">
            <div class="col-md-7 probootstrap-intro-text">
                <h1 class="probootstrap-animate barName"></h1>
                <div class="probootstrap-subtitle probootstrap-animate">
                    <h2 class="barDescribe">希望您可以在小贴吧里面找到自己的快乐 <a href="#" target="_blank"></a></h2>
                </div>
            </div>
        </div>
    </div>
    <a class="probootstrap-scroll-down js-next" href="#next-section">Scroll down <i class="icon-chevron-down"></i></a>
    <div>
        <div><h1>${requestScope.post.postName}</h1></div>
    </div>
</section>
<!-- END: section -->

<div style="position: relative;width: 100%;height: 80px;">
    <div class="search-wrapper">
        <div class="input-holder">
            <input type="text" class="search-input" placeholder="吧内搜索"/>
            <button class="search-icon" onclick="searchToggle(this, event);"><i class="fa fa-search"></i></button>
        </div>
        <span class="close" onclick="searchToggle(this, event);"></span>
        <div class="result-container">
            搜索内容不能为空
        </div>
    </div>
</div>
<section id="next-section" class="probootstrap-section">
    <div class="container">
        <c:forEach items="${floor}" var="floor">
            <div class="row bar wyggd" id="sx" style="border:rgb(225 226 230) solid 1px ; border-bottom: none;">
                <div class='col-md-12 col-sm-6 probootstrap-animate fadeInUp probootstrap-animated'
                     style="padding: 0px 0px 0px 0px; height: 100%;display: inline-block;width: 100%;height: 100% ">
                    <div class="gd"
                         style=" float: left; display: inline-block; background: rgb(251,251,253);width: 130px; height:198px; padding: 20px">
                        <ul style="width: 130px; height: 170px">
                            <li>
                                <div>
                                    <img src="${pageContext.request.contextPath }/static/images/9527.jpg"
                                         style="width:80px ;height:80px;border: silver solid 1px; ">
                                </div>
                            </li>
                            </br>
                            <li>
                                <a class='hint info-left' href='#' title='发帖人'><i class='fa fa-user'>作者名字</i></a>
                            </li>
                        </ul>
                    </div>
                    <div style="display: inline-block;width: 1035px;height:100%;" class='probootstrap-block-image'>
                        <div class='text' style="padding: 0px 0px 8px 20px;">
                            <div style="padding: 20px 20px 0px 0px ">
                        <span class='clearfix like'>
  				<a class='hint info-right' href='#' title='发帖时间' style="margin: 0px 0px 0px 0px">
                    <i class='fa fa-clock-o'>发帖时间&nbsp;:&nbsp;${floor.sendDate}</i>
                </a>
  				</span>
                                <div style="margin: 20px;padding-bottom: 50px;">${floor.postContent}</div>

                            </div>
                            <div style=" float: right;  width: 240px; height: 20px;margin: 10px">
                                <div class="hf" style="float: right">
                                    <span><a href="javascript:;" onclick="ShowOrHideReply(this)">回复</a>&nbsp;</span>
                                </div>

                                <div style=" float: right; ">
                                 <span><a href="#">
                                     <img src="${pageContext.request.contextPath }/static/images/jb.png " width="35px"
                                          height="15px">
                                 </a></span>
                                    <span class="tail-info">来自
                                     <a href="#">Android客户端</a>
                                 </span>
                                    <span class="tail-info">${floor.postFloor}楼</span>&nbsp;
                                </div>
                            </div>
                            <div style=" display: none;  border: rgb(240 241 242) solid 1px;height:100%; width: 650px; background : rgb(247 248 250); padding: 4px 15px 14px 15px">
                                <ul style="margin: 0px 0px 0px 0px ">
                                    <c:forEach items="${floor.replyList}" var="replys">
                                        <li style=" height: 45px;">
                                            <a href=""
                                               style=" width: 32px; height: 32px;display: inline-block; float: left;margin: 10px 10px 0px 0px">
                                                <img src="${pageContext.request.contextPath }/static/images/hero_bg_2.jpg"
                                                     style="border: silver 1px solid; width: 32px; height: 32px;">
                                            </a>
                                            <div style="display: inline-block; margin-top: 10px;width: 575px ">
                                                <a href="">盖亚:</a>
                                                <span>${replys.replyContent}</span>
                                                <div style=" float: right;padding: 10px 0px 0px 0px ">
                                                    <span>${replys.replyDate}</span>
                                                    <a href="" onclick="">回复</a>
                                                </div>
                                            </div>
                                        </li>
                                    </c:forEach>
                                    <li style="height: 45px">
                                        <div class="wysyg"
                                             style="float: right; padding: 4px 8px 4px 8px; border: 1px solid rgb(240, 241, 242); background:#FFFFFF">
                                            <a href="javascript:;" style="color: #1a1919"
                                               onclick="conceal(this)">我也说一句</a>
                                        </div>
                                    </li>
                                </ul>
                                <div style="display: none; ">
                                    <div style="margin: 10px">
                                        <textarea style="width: 100%; height: 100px"></textarea>
                                    </div>
                                    <biv style="margin: 0px 0px 0px 570px">
                                        <input type="button" name="submit" value="发表">
                                    </biv>
                                </div>

                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </c:forEach>

        <!-- 存放分页的容器 -->
        <div id="page"></div>

        <div class="row mb60" id="send">
            <div class="col-md-12  probootstrap-animate">
                <h4>回复帖子</h4>
                <form action="${pageContext.request.contextPath }/floor?action=insertFloor" method="post"
                      class="probootstrap-form" enctype="multipart/form-data">
                    <%--          	<input type='text' style='display:none' class='postId' name='postId' value=''>--%>
                    <%--          	<input type='text' style='display:none' class='accountId' name='accountId' value=''>--%>
                    <%--            <div class="form-group">--%>
                    <%--              <textarea cols="30" rows="10" class="form-control" id="replyContent" name="replyContent"></textarea>--%>
                    <%--            </div>--%>
                    <%--            <div class="form-group">--%>
                    <%--            		<span style="foalt:left;" class='file'>--%>
                    <%--            			<i class="fa fa-file-image-o hint" aria-hidden="true">--%>
                    <%--            			<input type='file' id="photo" style="display:none;" name='file'></i>--%>
                    <%--	            		<i class="fa fa-file hint" aria-hidden="true"></i>--%>
                    <%--            		</span>--%>
                    <%--            </div>--%>
                    <div id="editor" >

                    </div>
                    <div class="form-group">
                        <input type="button" class="btn btn-primary" id="spend" name="submit" value="发表">
                    </div>
                </form>
            </div>

        </div>


    </div>
</section>

<!-- 登录框  -->
<div class="export">
    <div class="modal fade" id="accountLogin" style="opacity: 1.0 !important;">
        <div class="modal-dialog motai">
            <div class="modal-content" style="border-radius: 30px 30px 50px 50px;background: rgba(10, 10, 10, 0.17);">
                <div class="sub-main-w3">
                    <form id='form' action="${pageContext.request.contextPath }/account/login" method="post"
                          target="target" style="margin: 0px;">
                        <div class="form-style-agile">
                            <label>
                                <i class="fas fa-user"></i>
                                用户名
                            </label>
                            <input class="Name" placeholder="Username" name="Name" type="text" required="">
                        </div>
                        <div class="form-style-agile">
                            <label>
                                <i class="fas fa-unlock-alt"></i>
                                密码
                            </label>
                            <input class="Password" placeholder="Password" name="Password" type="password" required="">
                        </div>
                        <!-- checkbox -->
                        <div class="wthree-text">
                            <ul>
                                <li>
                                    <label class="anim">
                                        <input type="checkbox" class="checkbox" required="">
                                        <span>我已阅读并同意服务条款</span>
                                    </label>
                                </li>
                                <li>
                                    <a href="#">忘记密码</a>|<a href="${pageContext.request.contextPath }/jsp/register.jsp">注册</a>
                                </li>
                            </ul>
                        </div>
                        <!-- //checkbox -->
                        <input type="submit" class="login" value="登录">
                    </form>
                    <iframe name="target" style="display:none"></iframe>
                </div>
            </div>
        </div>
    </div>
</div>


<!-- START: section -->
<section class="probootstrap-section probootstrap-section-colored"><a>
</a>
    <div class="container" style="height: 100px"><a>
        <div class="row text-center">
            <div class="col-lg-8 col-md-offset-2 mb30 section-heading probootstrap-animate fadeInUp probootstrap-animated">
                <h2 id="blink" style="color: rgb(136, 136, 0);">
                    <font style="vertical-align: inherit;">
                        <font style="vertical-align: inherit;">执谁之笔共赴锦上添花为谁迷离空守盛夏光年...</font></font></h2>
                <p class="lead"><font style="vertical-align: inherit;">
                    <font style="vertical-align: inherit;">不要因为也许会改变，就不肯说出那句美丽的誓言，不要因为也许会分离，就不敢求一次倾心的相遇。——席慕容《印记》</font>
                </font>
                </p>
            </div>
        </div>
    </a>
        <div class="row"><a>
        </a>
            <div class="col-md-4 col-md-offset-4 probootstrap-animate fadeInUp probootstrap-animated"><a>
            </a>
                <p class="text-center"><a>
                </a><a href="#" class="btn btn-ghost btn-ghost-white btn-lg btn-block" role="button"><font
                        style="vertical-align: inherit;"><font style="vertical-align: inherit;">联系我们</font></font></a>
                </p>
            </div>
        </div>
    </div>
</section>
<!-- END: section -->

<%-- h2 闪烁字体--%>
<script language="javascript">
    function changeColor() {
        var color = "#f00|bai#0f0|#00f|#880|#808|#088|yellow|green|blue|gray";
        color = color.split("|");
        document.getElementById("blink").style.color = color[parseInt(Math.random() * color.length)];
    }

    setInterval("changeColor()", 200);
</script>


<!-- START: footer -->
<footer role="contentinfo" class="probootstrap-footer">
    <div class="container">

        <div class="row mt40">
            <div class="col-md-12 text-center">
                <p>
                    <small>小贴吧，一个畅谈的梦想的贴吧</small><br>
                    <a href="#" class="js-backtotop">回到顶部</a>
                </p>
            </div>
        </div>
    </div>
</footer>
<!-- END: footer -->
<input type="hidden" id="path" value="<%=path%>"/>
<script src="${pageContext.request.contextPath }/static/js/scripts.min.js"></script>
<script src="${pageContext.request.contextPath }/static/js/main.min.js"></script>
<script src="${pageContext.request.contextPath }/static/js/custom.js"></script>
<script src="${pageContext.request.contextPath }/static/js/js.nav.js"></script>
<script src="${pageContext.request.contextPath }/static/js/canva_moving_effect.js"></script>
<script src="${pageContext.request.contextPath }/static/js/jquery-form.js"></script>
<script type="text/javascript"
        src="${pageContext.request.contextPath }/static/wangEditor-3.1.1/release/wangEditor.js"></script>
<script type="text/javascript">
    var path = $("#path").val();
    var E = window.wangEditor
    var editor = new E('#editor')
    // 或者 var editor = new E( document.getElementById('editor') )
    editor.customConfig.uploadImgServer = path + '/uploadingimg?action=uploadingimgs';
    // editor.customConfig.uploadImgShowBase64 = true;

    editor.customConfig.uploadImgHooks = {
        success: function (xhr, editor, result) {
            // 图片上传并返回结果，图片插入成功之后触发
            // xhr 是 XMLHttpRequst 对象，editor 是编辑器对象，result 是服务器端返回的结果
        },
        error: function (xhr, editor) {
            // 图片上传出错时触发
            // xhr 是 XMLHttpRequst 对象，editor 是编辑器对象
        }
        // ,
        // customInsert: function (insertImg, result, editor) {
        //     // 图片上传并返回结果，自定义插入图片的事件（而不是编辑器自动插入图片！！！）
        //     // insertImg 是插入图片的函数，editor 是编辑器对象，result 是服务器端返回的结果
        //
        //     // 举例：假如上传图片成功后，服务器端返回的是 {url:'....'} 这种格式，即可这样插入图片：
        //     var url = result.url
        //     insertImg(url)
        //
        //     // result 必须是一个 JSON 格式字符串！！！否则报错
        // }
    }
    editor.create();
</script>
<!-- //Jquery -->
<script type="text/javascript">
    layui.use('laypage', function(){
        var laypage = layui.laypage;
        let count;
        $.ajaxSettings.async = false;
        $.post(path + '/post',{action :'getPostCountByCondition'},function (result) {
            count = result.data;
        },'json');
        $.ajaxSettings.async = true;

        //执行一个laypage实例
        laypage.render({
            elem: 'page' //注意，这里的 test1 是 ID，不用加 # 号
            ,limit: 10
            ,theme: '#5994d6'
            ,count: count //数据总数，从服务端得到
            ,
            jump: function(e, first){ //触发分页后的回调
                if(!first){ //一定要加此判断，否则初始时会无限刷新
                    let pageIndex = e.curr; //当前页
                    let pageSize = e.limit;
                    let data = {
                        action:'getPostList',
                        pageIndex : pageIndex,
                        pageSize : pageSize
                    }
                    loadRequestList(data);
                }
            }
        });
    });

    function ShowOrHideReply(obj) {
        $obj = $(obj);
        $reply = $obj.parent().parent().parent().next();
        if ($reply.css('display') == 'none') {
            $reply.css('display', 'block');
        } else {
            $reply.css('display', 'none');
        }
    }

    function conceal(obj) {
        $obj = $(obj);
        $conceal = $obj.parent().parent().parent().next();
        if ($conceal.css('display') == 'none') {
            $conceal.css('display', 'block');
        } else {
            $conceal.css('display', 'none');
        }
    }

    // $(function(){
    //     $('.hf').click(function(){
    //         if($('.xs').is(':hidden')){
    //             $('.xs').show();
    //             $('.hf').val('点击隐藏');
    //         }
    //         else{
    //             $('.xs').hide();
    //             $('.hf').val('点击显示');
    //         }
    //     })
    // })


    $("#spend").click(function () {
        $.ajax({
            url: "<%=path%>/floor",
            method: "post",
            dataType: 'json',
            data: {
                action: "insertFloor",
                postid: 1,
                replyContent: editor.txt.html()
            },
            success: function (jsonStr) {
                if (jsonStr.code === 200) {
                    let data = jsonStr.data;
                    let html = "<div class=\"row bar wyggd\" id=\"sx\" style=\"border:rgb(225 226 230) solid 1px ; border-bottom: none; width: 1168px; height: 100%; margin: 0px; 0px 0px 0px;border-bottom :1px solid rgb(240, 241, 242) \">\n" +
                        "       \t<div class=\"col-md-12 col-sm-6 probootstrap-animate fadeInUp probootstrap-animated\" style=\"padding: 0px 0px 0px 0px; height: 100%;display: inline-block;\">\n" +
                        "            <div class=\"gd\" style=\" float: left; display: inline-block; background: rgb(251,251,253);width: 130px; height:198px; padding: 20px\">\n" +
                        "                <ul style=\"width: 130px; height: 170px\">\n" +
                        "                    <li>\n" +
                        "                        <div>\n" +
                        "                            <img src=\"/doPosts/static/images/9527.jpg\" style=\"width:80px ;height:80px;border: silver solid 1px; \">\n" +
                        "                        </div>\n" +
                        "                    </li>\n" +
                        "                    <br>\n" +
                        "                    <li>\n" +
                        "                        <a class=\"hint info-left\" href=\"#\" title=\"发帖人\"><i class=\"fa fa-user\">" + data.createUserName + "</i></a>\n" +
                        "                    </li>\n" +
                        "                </ul>\n" +
                        "            </div>\n" +
                        "       \t\t<div style=\"display: inline-block;width: 1035px;height:100%;\" class=\"probootstrap-block-image\">\n" +
                        "  \t\t\t\t<div class=\"text\" style=\"padding: 0px 0px 8px 20px;\">\n" +
                        "                    <div style=\"padding: 20px 20px 0px 0px \">\n" +
                        "                        <span class=\"clearfix like\">\n" +
                        "  \t\t\t\t<a class=\"hint info-right\" href=\"#\" title=\"发帖时间\" style=\"margin: 0px 0px 0px 0px\">\n" +
                        "                    <i class=\"fa fa-clock-o\">发帖时间&nbsp;:&nbsp;" + data.sendDate + "</i>\n" +
                        "                </a>\n" +
                        "  \t\t\t\t</span>\n" +
                        "                        <div style=\"margin: 20px;padding-bottom: 50px;\">\n" + data.postContent + "\n" + "</div>\n" +
                        "\n" +
                        "                    </div>\n" +
                        "                    <div style=\" float: right;  width: 240px; height: 20px;margin: 10px\">\n" +
                        "                        <div class=\"hf\" style=\"float: right\">\n" +
                        "                            <span><a href=\"javascript:;\" onclick=\"ShowOrHideReply(this)\">回复</a>&nbsp;</span>\n" +
                        "                        </div>\n" +
                        "\n" +
                        "                        <div style=\" float: right; \">\n" +
                        "                                 <span><a href=\"#\">\n" +
                        "                                     <img src=\"/doPosts/static/images/jb.png \" width=\"35px\" height=\"15px\">\n" +
                        "                                 </a></span>\n" +
                        "                            <span class=\"tail-info\">来自\n" +
                        "                                     <a href=\"#\">Android客户端</a>\n" +
                        "                                 </span>\n" +
                        "                            <span class=\"tail-info\">" + data.postFloor + "楼</span>&nbsp;\n" +
                        "                        </div>\n" +
                        "                    </div>\n" +
                        "                        <div style=\" display: none;  border: rgb(240 241 242) solid 1px;height:100%; width: 650px; background : rgb(247 248 250); padding: 4px 15px 14px 15px\">\n" +
                        "                           <ul style=\"margin: 0px 0px 0px 0px \">\n" +
                        "                               \n" +
                        "                               <li style=\"height: 45px\">\n" +
                        "                                   <div class=\"wysyg\" style=\"float: right; padding: 4px 8px 4px 8px; border: 1px solid rgb(240, 241, 242); background:#FFFFFF\">\n" +
                        "                                       <a href=\"javascript:;\" style=\"color: #1a1919\" onclick=\"conceal(this)\">我也说一句</a>\n" +
                        "                                   </div>\n" +
                        "                               </li>\n" +
                        "                           </ul>\n" +
                        "                            <div style=\"display: none; \">\n" +
                        "                                <div style=\"margin: 10px\">\n" +
                        "                                    <textarea style=\"width: 100%; height: 100px\"></textarea>\n" +
                        "                                </div>\n" +
                        "                                <biv style=\"margin: 0px 0px 0px 570px\">\n" +
                        "                                <input type=\"button\" name=\"submit\" value=\"发表\">\n" +
                        "                                </biv>\n" +
                        "                            </div>\n" +
                        "\n" +
                        "                        </div>\n" +
                        "\t\t\t\t\t</div>\n" +
                        "\t\t\t\t</div>\n" +
                        "\t\t\t</div>\n" +
                        "      </div>";
                    $("#sx>div").last().append(html);
                    editor.txt.clear();
                }
            }
        });
    });

</script>
</body>
<script>

    var hg;
    var em;
    $(".hf").click(function () {
        $(this).parent().parent().parent().prev().css("height", "" + $(this).parent().parent().parent().height() + "px");
        hg = $(this).parent().parent().parent().height();
        em = $(this).parent().parent().parent().prev();
    });


    $(".wysyg").click(function () {
        em.css("height", "" + (hg + 170) + "px");
    });

</script>
</html>