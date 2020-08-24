<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<html>
<head>
	<%
		String path = request.getContextPath();
	%>
	<meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
	<title>Home</title>
	<link href="<%=path%>/static/css/forumpark/bootstrap.css" rel="stylesheet" type="text/css" media="all" />
	<!--theme-style-->
	<link href="<%=path%>/static/css/forumpark/style.css" rel="stylesheet" type="text/css" media="all" />
	<!--//theme-style-->
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
	<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
	<!--fonts-->
	<link href='https://fonts.googleapis.com/css?family=Open+Sans:400,300,600,700,800' rel='stylesheet' type='text/css'>
	<!--//fonts-->
	<script src="<%=path%>/static/js/forumpark/jquery.min.js"></script>
	<script src="<%=path%>/static/js/forumpark/jquery.easydropdown.js"></script>
	<!--script-->
</head>
<body>
<!--header-->
<div class="header">
	<div class="top-header">
		<div class="container">
			<div class="top-header-left">
				<ul class="support">
					<li><a href="#"><label> </label></a></li>
					<li><a href="#">24x7 live<span class="live"> support</span></a></li>
				</ul>
				<ul class="support">
					<li class="van"><a href="#"><label> </label></a></li>
					<li><a href="#">Free shipping <span class="live">on order over 500</span></a></li>
				</ul>
				<div class="clearfix"> </div>
			</div>
			<div class="top-header-right">
				<div class="down-top">

					<select tabindex="4" class="dropdown">
						<option value="" class="label" value="">English</option>
						<option value="1">Japanese</option>
						<option value="2">French</option>
						<option value="3">German</option>
					</select>
				</div>
				<div class="down-top top-down">

					<select tabindex="4" class="dropdown ">
						<option value="" class="label" value="">Currency :USD</option>
						<option value="1">Dollar</option>
						<option value="2">Euro</option>
					</select>
				</div>

				<!---->
				<div class="clearfix"> </div>
			</div>
			<div class="clearfix"> </div>
		</div>
	</div>
	<div class="bottom-header">
		<div class="container">
			<div class="header-bottom-left">
				<div class="logo">
					<a href="index.html"><img src="<%=path%>/static/images/forumpark/logo.png" alt=" " /></a>
				</div>
				<div class="search">
					<input type="text" value="" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = '';}" >
					<input type="submit"  value="SEARCH">

				</div>
				<div class="clearfix"> </div>
			</div>
<%--			<div class="header-bottom-right">--%>
<%--				<ul class="men-grid">--%>
<%--					<li><a href="login.html"><span> </span>YOUR ACCOUNT</a></li>--%>
<%--					<li class="login"><a href="login.html"><span> </span>LOGIN</a>|</li>--%>
<%--					<li class="cart"><a href="#"><span> </span>CART</a></li>--%>
<%--				</ul>--%>
<%--				<div class="sign-up-right">--%>
<%--					<a href="register.html">SIGNUP</a>--%>
<%--				</div>--%>
<%--			</div>--%>
			<div class="clearfix"> </div>
		</div>
	</div>
</div>
<!---->
<div class="tlinks">Collect from <a href="http://www.baisheng999.com/" >网页模板</a></div>
<div class="container">
	<div class="banner-menu">

		<div class="shoes-grid">
			<div class="wmuSlider example1 slide-grid">
				<div class="wmuSliderWrapper">
					<article style="position: absolute; width: 100%; opacity: 0;">
						<div class="banner-matter">
							<img class="img-responsive banner-bag" src="<%=path%>/static/images/forumpark/bag.jpg" alt=" " />
							<div class="banner-off">
								<h2>FLAT 50% 0FF</h2>
								<span>FOR ALL PURCHASE <b>VALUE</b></span>
								<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et </p>
								<a class="now-get" href="#">GET NOW</a>
							</div>
							<div class="clearfix"> </div>
						</div>
					</article>
					<article style="position: absolute; width: 100%; opacity: 0;">
						<div class="banner-matter">
							<img class="img-responsive banner-bag" src="<%=path%>/static/images/forumpark/bag1.jpg" alt=" " />
							<div class="banner-off">
								<h2>FLAT 50% 0FF</h2>
								<span>FOR ALL PURCHASE <b>VALUE</b></span>
								<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et </p>
								<a class="now-get" href="#">GET NOW</a>
							</div>
							<div class="clearfix"> </div>
						</div>
					</article>
					<article style="position: absolute; width: 100%; opacity: 0;">
						<div class="banner-matter">
							<img class="img-responsive banner-bag" src="<%=path%>/static/images/forumpark/bag.jpg" alt=" " />
							<div class="banner-off">
								<h2>FLAT 50% 0FF</h2>
								<span>FOR ALL PURCHASE <b>VALUE</b></span>
								<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et </p>
								<a class="now-get" href="#">GET NOW</a>
							</div>
							<div class="clearfix"> </div>
						</div>
					</article>
				</div>
				<ul class="wmuSliderPagination">
					<li><a href="#" class="">0</a></li>
					<li><a href="#" class="">1</a></li>
					<li><a href="#" class="">2</a></li>
				</ul>
			</div>

			<script src="<%=path%>/static/js/forumpark/jquery.wmuSlider.js"></script>
			<script>
				$('.example1').wmuSlider();
			</script>
			<!---->
			<div class="shoes-grid-left">
				<div class=" con-sed-grid">
					<div class="elit-grid">
						<h4>consectetur  elit</h4>
						<span>FOR ALL PURCHASE VALUE</span>
						<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, </p>
						<a class="now-get" href="#">GET NOW</a>
					</div>
					<a href="single.html"><img class="img-responsive shoe-left" src="<%=path%>/static/images/forumpark/sh.jpg" alt=" " /></a>
					<div class="clearfix"> </div>
				</div>
				<div class="con-sed-grid sed-left-top">
					<div class="elit-grid">
						<h4>consectetur  elit</h4>
						<span>FOR ALL PURCHASE VALUE</span>
						<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, </p>
						<a class="now-get" href="#">GET NOW</a>
					</div>
					<a href="single.html"><img class="img-responsive shoe-left" src="<%=path%>/static/images/forumpark/wa.jpg" alt=" " /></a>
					<div class="clearfix"> </div>
				</div>
			</div>
			<div class="products">
				<h5 class="latest-product">LATEST PRODUCTS</h5>
				<a class="view-all" href="product.html">VIEW ALL<span> </span></a>
			</div>
			<div class="product-left">
				<div class=" chain-grid">
					<a href="single.html"><img class="img-responsive chain" src="<%=path%>/static/images/forumpark/ch.jpg" alt=" " /></a>
					<span class="star"> </span>
					<div class="grid-chain-bottom">
						<h6>Lorem ipsum dolor</h6>
						<div class="star-price">
							<div class="dolor-grid">
								<span class="actual">300$</span>
								<span class="reducedfrom">400$</span>
								<span class="rating">
									        <input type="radio" class="rating-input" id="rating-input-1-5" name="rating-input-1">
									        <label for="rating-input-1-5" class="rating-star1"> </label>
									        <input type="radio" class="rating-input" id="rating-input-1-4" name="rating-input-1">
									        <label for="rating-input-1-4" class="rating-star1"> </label>
									        <input type="radio" class="rating-input" id="rating-input-1-3" name="rating-input-1">
									        <label for="rating-input-1-3" class="rating-star"> </label>
									        <input type="radio" class="rating-input" id="rating-input-1-2" name="rating-input-1">
									        <label for="rating-input-1-2" class="rating-star"> </label>
									        <input type="radio" class="rating-input" id="rating-input-1-1" name="rating-input-1">
									        <label for="rating-input-1-1" class="rating-star"> </label>
							    	   </span>
							</div>
							<a class="now-get get-cart" href="#">ADD TO CART</a>
							<div class="clearfix"> </div>
						</div>
					</div>
				</div>
				<div class=" chain-grid">
					<a href="single.html"><img class="img-responsive chain" src="<%=path%>/static/images/forumpark/ba.jpg" alt=" " /></a>
					<span class="star"> </span>
					<div class="grid-chain-bottom">
						<h6>Lorem ipsum dolor</h6>
						<div class="star-price">
							<div class="dolor-grid">
								<span class="actual">300$</span>
								<span class="reducedfrom">400$</span>
								<span class="rating">
									        <input type="radio" class="rating-input" id="rating-input-1-5" name="rating-input-1">
									        <label for="rating-input-1-5" class="rating-star1"> </label>
									        <input type="radio" class="rating-input" id="rating-input-1-4" name="rating-input-1">
									        <label for="rating-input-1-4" class="rating-star1"> </label>
									        <input type="radio" class="rating-input" id="rating-input-1-3" name="rating-input-1">
									        <label for="rating-input-1-3" class="rating-star"> </label>
									        <input type="radio" class="rating-input" id="rating-input-1-2" name="rating-input-1">
									        <label for="rating-input-1-2" class="rating-star"> </label>
									        <input type="radio" class="rating-input" id="rating-input-1-1" name="rating-input-1">
									        <label for="rating-input-1-1" class="rating-star"> </label>
							    	   </span>
							</div>
							<a class="now-get get-cart" href="#">ADD TO CART</a>
							<div class="clearfix"> </div>
						</div>
					</div>
				</div>
				<div class=" chain-grid grid-top-chain">
					<a href="single.html"><img class="img-responsive chain" src="<%=path%>/static/images/forumpark/bo.jpg" alt=" " /></a>
					<span class="star"> </span>
					<div class="grid-chain-bottom">
						<h6>Lorem ipsum dolor</h6>
						<div class="star-price">
							<div class="dolor-grid">
								<span class="actual">300$</span>
								<span class="reducedfrom">400$</span>
								<span class="rating">
									        <input type="radio" class="rating-input" id="rating-input-1-5" name="rating-input-1">
									        <label for="rating-input-1-5" class="rating-star1"> </label>
									        <input type="radio" class="rating-input" id="rating-input-1-4" name="rating-input-1">
									        <label for="rating-input-1-4" class="rating-star1"> </label>
									        <input type="radio" class="rating-input" id="rating-input-1-3" name="rating-input-1">
									        <label for="rating-input-1-3" class="rating-star"> </label>
									        <input type="radio" class="rating-input" id="rating-input-1-2" name="rating-input-1">
									        <label for="rating-input-1-2" class="rating-star"> </label>
									        <input type="radio" class="rating-input" id="rating-input-1-1" name="rating-input-1">
									        <label for="rating-input-1-1" class="rating-star"> </label>
							    	   </span>
							</div>
							<a class="now-get get-cart" href="#">ADD TO CART</a>
							<div class="clearfix"> </div>
						</div>
					</div>
				</div>
				<div class="clearfix"> </div>
			</div>
			<div class="products">
				<h5 class="latest-product">LATEST PRODUCTS</h5>
				<a class="view-all" href="product.html">VIEW ALL<span> </span></a>
			</div>
			<div class="product-left">
				<div class=" chain-grid">
					<a href="single.html"><img class="img-responsive chain" src="<%=path%>/static/images/forumpark/bott.jpg" alt=" " /></a>
					<span class="star"> </span>
					<div class="grid-chain-bottom">
						<h6>Lorem ipsum dolor</h6>
						<div class="star-price">
							<div class="dolor-grid">
								<span class="actual">300$</span>
								<span class="reducedfrom">400$</span>
								<span class="rating">
									        <input type="radio" class="rating-input" id="rating-input-1-5" name="rating-input-1">
									        <label for="rating-input-1-5" class="rating-star1"> </label>
									        <input type="radio" class="rating-input" id="rating-input-1-4" name="rating-input-1">
									        <label for="rating-input-1-4" class="rating-star1"> </label>
									        <input type="radio" class="rating-input" id="rating-input-1-3" name="rating-input-1">
									        <label for="rating-input-1-3" class="rating-star"> </label>
									        <input type="radio" class="rating-input" id="rating-input-1-2" name="rating-input-1">
									        <label for="rating-input-1-2" class="rating-star"> </label>
									        <input type="radio" class="rating-input" id="rating-input-1-1" name="rating-input-1">
									        <label for="rating-input-1-1" class="rating-star"> </label>
							    	   </span>
							</div>
							<a class="now-get get-cart" href="#">ADD TO CART</a>
							<div class="clearfix"> </div>
						</div>
					</div>
				</div>
				<div class=" chain-grid">
					<a href="single.html"><img class="img-responsive chain" src="<%=path%>/static/images/forumpark/bottle.jpg" alt=" " /></a>
					<span class="star"> </span>
					<div class="grid-chain-bottom">
						<h6>Lorem ipsum dolor</h6>
						<div class="star-price">
							<div class="dolor-grid">
								<span class="actual">300$</span>
								<span class="reducedfrom">400$</span>
								<span class="rating">
									        <input type="radio" class="rating-input" id="rating-input-1-5" name="rating-input-1">
									        <label for="rating-input-1-5" class="rating-star1"> </label>
									        <input type="radio" class="rating-input" id="rating-input-1-4" name="rating-input-1">
									        <label for="rating-input-1-4" class="rating-star1"> </label>
									        <input type="radio" class="rating-input" id="rating-input-1-3" name="rating-input-1">
									        <label for="rating-input-1-3" class="rating-star"> </label>
									        <input type="radio" class="rating-input" id="rating-input-1-2" name="rating-input-1">
									        <label for="rating-input-1-2" class="rating-star"> </label>
									        <input type="radio" class="rating-input" id="rating-input-1-1" name="rating-input-1">
									        <label for="rating-input-1-1" class="rating-star"> </label>
							    	   </span>
							</div>
							<a class="now-get get-cart" href="#">ADD TO CART</a>
							<div class="clearfix"> </div>
						</div>
					</div>
				</div>
				<div class=" chain-grid grid-top-chain">
					<a href="single.html"><img class="img-responsive chain" src="<%=path%>/static/images/forumpark/baa.jpg" alt=" " /></a>
					<span class="star"> </span>
					<div class="grid-chain-bottom">
						<h6>Lorem ipsum dolor</h6>
						<div class="star-price">
							<div class="dolor-grid">
								<span class="actual">300$</span>
								<span class="reducedfrom">400$</span>
								<span class="rating">
									        <input type="radio" class="rating-input" id="rating-input-1-5" name="rating-input-1">
									        <label for="rating-input-1-5" class="rating-star1"> </label>
									        <input type="radio" class="rating-input" id="rating-input-1-4" name="rating-input-1">
									        <label for="rating-input-1-4" class="rating-star1"> </label>
									        <input type="radio" class="rating-input" id="rating-input-1-3" name="rating-input-1">
									        <label for="rating-input-1-3" class="rating-star"> </label>
									        <input type="radio" class="rating-input" id="rating-input-1-2" name="rating-input-1">
									        <label for="rating-input-1-2" class="rating-star"> </label>
									        <input type="radio" class="rating-input" id="rating-input-1-1" name="rating-input-1">
									        <label for="rating-input-1-1" class="rating-star"> </label>
							    	   </span>
							</div>
							<a class="now-get get-cart" href="#">ADD TO CART</a>
							<div class="clearfix"> </div>
						</div>
					</div>
				</div>
				<div class="clearfix"> </div>
			</div>
			<div class="clearfix"> </div>
		</div>
		<div class="sub-cate">
			<div class=" top-nav rsidebar span_1_of_left">
				<h3 class="cate">全部贴吧分类</h3>
				<ul class="menu">
					<ul class="kid-menu ">
						<li><a href="product.html">Commodo sit</a></li>
						<li ><a href="product.html">Urna ac tortor sc</a></li>
						<li><a href="product.html">Ornared id aliquet</a></li>
						<li><a href="product.html">Urna ac tortor sc</a></li>
						<li ><a href="product.html">Eget nisi laoreet</a></li>
						<li><a href="product.html">Faciisis ornare</a></li>
						<li class="menu-kid-left"><a href="contact.html">Contact us</a></li>
					</ul>
				</ul>
			</div>
			<!--initiate accordion-->
			<script type="text/javascript">
				$(function() {
					var menu_ul = $('.menu > li > ul'),
							menu_a  = $('.menu > li > a');
					menu_ul.hide();
					menu_a.click(function(e) {
						e.preventDefault();
						if(!$(this).hasClass('active')) {
							menu_a.removeClass('active');
							menu_ul.filter(':visible').slideUp('normal');
							$(this).addClass('active').next().stop(true,true).slideDown('normal');
						} else {
							$(this).removeClass('active');
							$(this).next().stop(true,true).slideUp('normal');
						}
					});

				});
			</script>
			<div class=" chain-grid menu-chain">
				<a href="single.html"><img class="img-responsive chain" src="<%=path%>/static/images/forumpark/wat.jpg" alt=" " /></a>
				<div class="grid-chain-bottom chain-watch">
					<span class="actual dolor-left-grid">300$</span>
					<span class="reducedfrom">500$</span>
					<h6>Lorem ipsum dolor</h6>
				</div>
			</div>
			<a class="view-all all-product" href="product.html">VIEW ALL PRODUCTS<span> </span></a>
		</div>
		<div class="clearfix"> </div>
	</div>
</div>
<!---->
<div class="footer">
	<div class="footer-top">
		<div class="container">
			<div class="latter">
				<h6>NEWS-LATTER</h6>
				<div class="sub-left-right">
					<form>
						<input type="text" value="Enter email here"onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'Enter email here';}" />
						<input type="submit" value="SUBSCRIBE" />
					</form>
				</div>
				<div class="clearfix"> </div>
			</div>
			<div class="latter-right">
				<p>FOLLOW US</p>
				<ul class="face-in-to">
					<li><a href="#"><span> </span></a></li>
					<li><a href="#"><span class="facebook-in"> </span></a></li>
					<div class="clearfix"> </div>
				</ul>
				<div class="clearfix"> </div>
			</div>
			<div class="clearfix"> </div>
		</div>
	</div>
	<div class="footer-bottom">
		<div class="container">
			<div class="footer-bottom-cate">
				<h6>CATEGORIES</h6>
				<ul>
					<li><a href="#">Curabitur sapien</a></li>
					<li><a href="#">Dignissim purus</a></li>
					<li><a href="#">Tempus pretium</a></li>
					<li ><a href="#">Dignissim neque</a></li>
					<li ><a href="#">Ornared id aliquet</a></li>
					<li><a href="#">Ultrices id du</a></li>
					<li><a href="#">Commodo sit</a></li>
					<li ><a href="#">Urna ac tortor sc</a></li>
					<li><a href="#">Ornared id aliquet</a></li>
					<li><a href="#">Urna ac tortor sc</a></li>
					<li ><a href="#">Eget nisi laoreet</a></li>
					<li ><a href="#">Faciisis ornare</a></li>
				</ul>
			</div>
			<div class="footer-bottom-cate bottom-grid-cat">
				<h6>FEATURE PROJECTS</h6>
				<ul>
					<li><a href="#">Curabitur sapien</a></li>
					<li><a href="#">Dignissim purus</a></li>
					<li><a href="#">Tempus pretium</a></li>
					<li ><a href="#">Dignissim neque</a></li>
					<li ><a href="#">Ornared id aliquet</a></li>
					<li><a href="#">Ultrices id du</a></li>
					<li><a href="#">Commodo sit</a></li>
				</ul>
			</div>
			<div class="footer-bottom-cate">
				<h6>TOP BRANDS</h6>
				<ul>
					<li><a href="#">Curabitur sapien</a></li>
					<li><a href="#">Dignissim purus</a></li>
					<li><a href="#">Tempus pretium</a></li>
					<li ><a href="#">Dignissim neque</a></li>
					<li ><a href="#">Ornared id aliquet</a></li>
					<li><a href="#">Ultrices id du</a></li>
					<li><a href="#">Commodo sit</a></li>
					<li ><a href="#">Urna ac tortor sc</a></li>
					<li><a href="#">Ornared id aliquet</a></li>
					<li><a href="#">Urna ac tortor sc</a></li>
					<li ><a href="#">Eget nisi laoreet</a></li>
					<li ><a href="#">Faciisis ornare</a></li>
				</ul>
			</div>
			<div class="footer-bottom-cate cate-bottom">
				<h6>OUR ADDERSS</h6>
				<ul>
					<li>Aliquam metus  dui. </li>
					<li>orci, ornareidquet</li>
					<li> ut,DUI.</li>
					<li >nisi, dignissim</li>
					<li >gravida at.</li>
					<li class="phone">PH : 6985792466</li>
					<li class="temp"> <p class="footer-class">Copyright &copy; 2015.Company name All rights reserved.More Templates <a href="http://www.baisheng999.com/" target="_blank" title="网站模板库">网站模板库</a> - Collect from <a href="http://www.baisheng999.com/" title="网页模板" target="_blank">网页模板</a></p></li>
				</ul>
			</div>
			<div class="clearfix"> </div>
		</div>
	</div>
</div>

</body>
</html>