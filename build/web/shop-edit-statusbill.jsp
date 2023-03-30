<%-- 
    Document   : shop-edit-statusbill
    Created on : Mar 26, 2023, 9:52:37 PM
    Author     : nhuth
--%>


<%@page import="dao.DAO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="entity.Bill"%>
<!DOCTYPE html>
<html lang="en">
    <!--<![endif]-->

    <!-- Head BEGIN -->
    <head>
        <meta charset="utf-8">
        <title>Manager Product | NF-Shop</title>

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
        <link href="http://code.jquery.com/ui/1.10.3/themes/smoothness/jquery-ui.css" rel="stylesheet" type="text/css"><!-- for slider-range -->
        <link href="assets/plugins/rateit/src/rateit.css" rel="stylesheet" type="text/css">
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
                    <!-- Edit Modal HTML -->
                    <form action="editstatusbill" method="post" >
                        <div class="modal-header" style="background: #e94d1c; color: #FFF">						
                            <h4 class="modal-title">Edit Category</h4>
                        </div>
                    <%
                        int billid = Integer.parseInt(request.getParameter("bill"));
                        DAO dao = new DAO();
                        Bill bill = dao.getBillByID(billid);

                    %>
                    <div class="modal-body">					
                        <div class="form-group">
                            <label>Bill_id</label>
                            <input value="<%= bill.getBill_id() %>" name="billid" type="text" class="form-control" readonly required>
                        </div>
                        <div class="form-group">
                            <label>Account_id</label>
                            <input value="<%= bill.getAcc_id() %>" name="accid" type="text" class="form-control" readonly required>
                        </div>
                        <div class="form-group">
                            <label>Fullname</label>
                            <input value="<%= bill.getFullname() %>" name="namebill" type="text" class="form-control" readonly required>
                        </div>
                        <div class="form-group">
                            <label>Status Bill</label>
                            <select name="statusbill" class="form-select" aria-label="Default select example">
                                <option value="<%= bill.getStatus()%>">Default</option>
                                <option value="0">Cancel Order</option>
                                <option value="1">Processing</option>
                                <option value="2">Delivery</option>
                                <option value="3">Successful Delivery</option>
                            </select>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <input type="submit" class="btn btn-primary" value="Update">
                    </div>   
                </form>
            </div>           
        </div>

        <jsp:include page="shop-footer.jsp"></jsp:include>

        <!-- Load javascripts at bottom, this will reduce page load time -->
        <!-- BEGIN CORE PLUGINS (REQUIRED FOR ALL PAGES) -->
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
        <script src="assets/plugins/rateit/src/jquery.rateit.js" type="text/javascript"></script>
        <script src="http://code.jquery.com/ui/1.10.3/jquery-ui.js" type="text/javascript"></script><!-- for slider-range -->

        <script src="assets/corporate/scripts/layout.js" type="text/javascript"></script>
        <script type="text/javascript">
            jQuery(document).ready(function () {
                Layout.init();
                Layout.initOWL();
                Layout.initTwitter();
                Layout.initImageZoom();
                Layout.initTouchspin();
                Layout.initUniform();
                Layout.initSliderRange();
            });
        </script>
        <!-- END PAGE LEVEL JAVASCRIPTS -->
    </body>
    <!-- END BODY -->
</html>
