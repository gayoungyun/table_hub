<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="path" value="<%= request.getContextPath() %>" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${path}/resources/css/default/footer.css"/>
<style type="text/css">
	.footer-hub {
		display: inline-flex;
		align-items:center;
		justify-content:center;
		width:30px;
		height:30px;
	}
	.content-wrapper {
		display: inline-flex;
		align-items:center;
		justify-content:center;
		width:30px;
		height:30px;
	}
	.copyright text-center my-auto {
		display: inline-flex;
		align-items:center;
		justify-content:center;
		width:30px;
		height:30px;
	}
</style>
</head>
<body id="footer-hub">
	<div id="wrapper">
		 <div id="content-wrapper" class="d-flex flex-column">
	 <!-- Footer -->
            <footer class="sticky-footer bg-white">
                <div class="container my-auto">
                    <div class="copyright text-center my-auto">
                        <span>Copyright &copy; Your Website 2020</span>
                    </div>
                </div>
            </footer>
            <!-- End of Footer -->

        </div>
        <!-- End of Content Wrapper -->

    </div>
    <!-- End of Page Wrapper -->
</body>
</html>