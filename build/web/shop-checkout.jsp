<%-- 
    Document   : shop-checkout
    Created on : Feb 2, 2023, 4:27:43 AM
    Author     : nhuth
--%>

<%@page import="entity.Cart"%>
<%@page import="control.AddCartControl"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html lang="en">
    <!--<![endif]-->

    <!-- Head BEGIN -->
    <head>
        <meta charset="utf-8">
        <title>Checkout | Metronic Shop UI</title>

        <meta content="width=device-width, initial-scale=1.0" name="viewport">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">

        <meta content="Metronic Shop UI description" name="description">
        <meta content="Metronic Shop UI keywords" name="keywords">
        <meta content="keenthemes" name="author">

        <meta property="og:site_name" content="-CUSTOMER VALUE-">
        <meta property="og:title" content="-CUSTOMER VALUE-">
        <meta property="og:description" content="-CUSTOMER VALUE-">
        <meta property="og:type" content="website">
        <meta property="og:image" content="-CUSTOMER VALUE-"><!-- link to image for socio -->
        <meta property="og:url" content="-CUSTOMER VALUE-">

        <link rel="shortcut icon" href="favicon.ico">

        <!-- Fonts START -->
        <link href="http://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700|PT+Sans+Narrow|Source+Sans+Pro:200,300,400,600,700,900&amp;subset=all" rel="stylesheet" type="text/css"> 
        <!-- Fonts END -->

        <!-- Global styles START -->          
        <link href="assets/plugins/font-awesome/css/font-awesome.min.css" rel="stylesheet">
        <link href="assets/plugins/bootstrap/css/bootstrap.min.css" rel="stylesheet">
        <!-- Global styles END --> 

        <!-- Page level plugin styles START -->
        <link href="assets/plugins/fancybox/source/jquery.fancybox.css" rel="stylesheet">
        <link href="assets/plugins/owl.carousel/assets/owl.carousel.css" rel="stylesheet">
        <link href="assets/plugins/uniform/css/uniform.default.css" rel="stylesheet" type="text/css">
        <!-- Page level plugin styles END -->

        <!-- Theme styles START -->
        <link href="assets/pages/css/components.css" rel="stylesheet">
        <link href="assets/corporate/css/style.css" rel="stylesheet">
        <link href="assets/pages/css/style-shop.css" rel="stylesheet" type="text/css">
        <link href="assets/corporate/css/style-responsive.css" rel="stylesheet">
        <link href="assets/corporate/css/themes/red.css" rel="stylesheet" id="style-color">
        <link href="assets/corporate/css/custom.css" rel="stylesheet">
        <!-- Theme styles END -->
    </head>
    <!-- Head END -->

    <!-- Body BEGIN -->
    <body class="ecommerce">
        <jsp:include page="shop-header.jsp"></jsp:include>

            <div class="main">
                <div class="container">
                    <!-- add Modal HTML -->
                    <form action="purchase" method="post">
                        <div class="modal-header" style="background: #e94d1c; color: #FFF">						
                            <h4 class="modal-title">Check out</h4>
                        </div>
                        <div class="modal-body">
                            <div class="form-group">
                                <label>ID</label>
                                <input value="${sessionScope.acc.id}" name="acc" type="text" class="form-control" readonly required>
                        </div>
                        <div class="form-group">
                            <label>Account</label>
                            <input value="${sessionScope.acc.user}" name="user" type="text" class="form-control" readonly required>
                        </div>
                        <div class="form-group">
                            <label>Phone 1</label>
                            <input value="${sessionScope.acc.phone}" name="phone1" type="text" class="form-control" readonly required>

                        </div>
                        <div class="form-group">
                            <label>Phone 2</label>
                            <input name="phone2" type="text" class="form-control" placeholder="Enter your phone delivery" required>
                        </div>
                        <div class="form-group">
                            <select id="city" name="city">
                                <option value="" selected>Chọn tỉnh thành</option>           
                            </select>

                            <select id="district" name="district">
                                <option value="" selected>Chọn quận huyện</option>
                            </select>

                            <select id="ward" name="ward">
                                <option value="" selected>Chọn phường xã</option>
                            </select>
                        </div>  
                        <div class="form-group">
                            <label>Description delivery</label>
                            <textarea name="desbill" rows="3" class="form-control" placeholder="Enter your delivery address"></textarea>
                        </div>
                        <div class="modal-body">
                            <table class="col-md-12 col-sm-12">
                                <h3>Bill</h3>
                                <tr>
                                    <th class="goods-page-name" colspan="2">NAME</th>
                                    <th class="goods-page-quantity" colspan="1">QUANTITY</th>
                                    <th class="goods-page-price" colspan="1">PRICE</th>
                                </tr>
                                <%
                                    if (AddCartControl.listcart != null) {
                                        int ship = 30;
                                        double total = 0;
                                %>
                                <%
                                    for (int i = 0; i < AddCartControl.listcart.size(); i++) {
                                        Cart cart = AddCartControl.listcart.get(i);

                                        total = total + (cart.getQuantity() * cart.getCid().getPrice());
                                %>
                                <tr>
                                    <td class="goods-page-name" colspan="2" ><%=cart.getCid().getName()%></td>
                                    <td class="goods-page-quantity" colspan="1"><%=cart.getQuantity()%></td>
                                    <td class="goods-page-price" colspan="1"><%=cart.getCid().getPrice()%></td>
                                </tr>
                                <%
                                    }
                                %>
                            </table>

                            <table class="col-md-12 col-sm-12">
                                <tr>
                                    <th class="goods-page-name" colspan="2">TOTAL</th>
                                    <th class="goods-page-quantity" colspan="1"></th>
                                    <th class="goods-page-price" colspan="1"><%= total%></th>
                                </tr>
                                <tr>
                                    <th class="goods-page-name" colspan="2">SHIP</th>
                                    <th class="goods-page-quantity" colspan="1"></th>
                                    <th class="goods-page-price" colspan="1"><%= ship%></th>
                                </tr>
                                <tr>
                                    <th class="goods-page-name" colspan="2">TOTAL</th>
                                    <th class="goods-page-quantity" colspan="1"></th>
                                    <th class="goods-page-price" colspan="1"><%= total + ship%></th>
                                </tr>

                            </table>

                            <%
                                }
                            %>
                        </div>

                        <div class="modal-footer">
                            <input type="button" class="btn btn-close" data-dismiss="modal" value="Cancel">
                            <input type="submit" class="btn btn-primary" value="Checkout">
                        </div>
                    </div>


                </form>
            </div>

        </div>


        <jsp:include page="shop-footer.jsp"></jsp:include>

        <!-- Load javascripts at bottom, this will reduce page load time -->
        <!-- BEGIN CORE PLUGINS(REQUIRED FOR ALL PAGES) -->
        <!--[if lt IE 9]>
        <script src="assets/plugins/respond.min.js"></script>  
        <![endif]-->
        <script src="assets/plugins/jquery.min.js" type="text/javascript"></script>
        <script src="assets/plugins/jquery-migrate.min.js" type="text/javascript"></script>
        <script src="assets/plugins/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>      
        <script src="assets/corporate/scripts/back-to-top.js" type="text/javascript"></script>
        <script src="assets/plugins/jquery-slimscroll/jquery.slimscroll.min.js" type="text/javascript"></script>
        <!-- END CORE PLUGINS -->

        <!-- BEGIN PAGE LEVEL JAVASCRIPTS (REQUIRED ONLY FOR CURRENT PAGE) -->
        <script src="assets/plugins/fancybox/source/jquery.fancybox.pack.js" type="text/javascript"></script><!-- pop up -->
        <script src="assets/plugins/owl.carousel/owl.carousel.min.js" type="text/javascript"></script><!-- slider for products -->
        <script src='assets/plugins/zoom/jquery.zoom.min.js' type="text/javascript"></script><!-- product zoom -->
        <script src="assets/plugins/bootstrap-touchspin/bootstrap.touchspin.js" type="text/javascript"></script><!-- Quantity -->
        <script src="assets/plugins/uniform/jquery.uniform.min.js" type="text/javascript"></script>

        <script src="assets/corporate/scripts/layout.js" type="text/javascript"></script>
        <script src="assets/pages/scripts/checkout.js" type="text/javascript"></script>
        <script type="text/javascript">
            jQuery(document).ready(function () {
                Layout.init();
                Layout.initOWL();
                Layout.initTwitter();
                Layout.initImageZoom();
                Layout.initTouchspin();
                Layout.initUniform();
                Checkout.init();
            });
        </script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/axios/0.21.1/axios.min.js"></script>
        <script>
                    var citis = document.getElementById("city");
                    var districts = document.getElementById("district");
                    var wards = document.getElementById("ward");
                    var Parameter = {
                        url: "https://raw.githubusercontent.com/kenzouno1/DiaGioiHanhChinhVN/master/data.json",
                        method: "GET",
                        responseType: "application/json",
                    };
                    var promise = axios(Parameter);
                    promise.then(function (result) {
                        renderCity(result.data);
                    });

                    function renderCity(data) {
                        for (const x of data) {
                            var opt = document.createElement('option');
                            opt.value = x.Name;
                            opt.text = x.Name;
                            opt.setAttribute('data-id', x.Id);
                            citis.options.add(opt);
                        }
                        citis.onchange = function () {
                            district.length = 1;
                            ward.length = 1;
                            if (this.options[this.selectedIndex].dataset.id != "") {
                                const result = data.filter(n => n.Id === this.options[this.selectedIndex].dataset.id);

                                for (const k of result[0].Districts) {
                                    var opt = document.createElement('option');
                                    opt.value = k.Name;
                                    opt.text = k.Name;
                                    opt.setAttribute('data-id', k.Id);
                                    district.options.add(opt);
                                }
                            }
                        };
                        district.onchange = function () {
                            ward.length = 1;
                            const dataCity = data.filter((n) => n.Id === citis.options[citis.selectedIndex].dataset.id);
                            if (this.options[this.selectedIndex].dataset.id != "") {
                                const dataWards = dataCity[0].Districts.filter(n => n.Id === this.options[this.selectedIndex].dataset.id)[0].Wards;

                                for (const w of dataWards) {
                                    var opt = document.createElement('option');
                                    opt.value = w.Name;
                                    opt.text = w.Name;
                                    opt.setAttribute('data-id', w.Id);
                                    wards.options.add(opt);
                                }
                            }
                        };
                    }
        </script>
        <!-- END PAGE LEVEL JAVASCRIPTS -->
    </body>
    <!-- END BODY -->
</html>
