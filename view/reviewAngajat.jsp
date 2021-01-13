<%--
  Created by IntelliJ IDEA.
  User: POPE
  Date: 29.12.2020
  Time: 14:55
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html style="font-size: 16px;">
<head>
    <header>
        <jsp:include page="header.jsp"></jsp:include>
    </header>
    <div class="foter">
        <jsp:include page="footerjsp.jsp"></jsp:include>
    </div>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta charset="utf-8">
    <meta name="keywords" content="">
    <meta name="description" content="">
    <meta name="page_type" content="np-template-header-footer-from-plugin">
    <title>Page 1</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/rA1" media="screen">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/rA2" media="screen">
    <meta name="generator" content="Nicepage 3.3.1, nicepage.com">
    <link id="u-theme-google-font" rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto:100,100i,300,300i,400,400i,500,500i,700,700i,900,900i|Open+Sans:300,300i,400,400i,600,600i,700,700i,800,800i">

    <meta property="og:title" content="Page 1">
    <meta property="og:type" content="website">
    <meta name="theme-color" content="#478ac9">
    <link rel="canonical" href="index.html">
    <meta property="og:url" content="index.html">
    <style type="text/css">
        .foter footer {
            top:1500px;
            height: 300px;
        }
        .email h1{
            font-family: 'Times New Roman', serif;
            font-size: 30px;
        }
        .email li{
            text-decoration: none;
            text-decoration-color: #0f0f0f;
            margin-top-top: -40px;
        }

        .email{
            float:right;
            margin-right:300px;
        }
        .welcome-text a{
            padding: 10px 25px;
            text-decoration:none;
            font-size: 20px;
            margin-top:15px;
            display: inline-block;
            font-family: Copperplate, Papyrus, fantasy;
            color:#ffffff;
        }
        .u-image-1{
            height: 215px;
            width: auto;
        }
        .containerAng{
            padding-top: -10%;
        }
        .u-white{
            top: -100%;
        }

    </style>
</head>
<body data-home-page="Page-1.html" data-home-page-title="Page 1" class="u-body">

   <section class="u-clearfix u-grey-10 u-section-1" id="sec-a39a">
    <div class="containerAng">

    <div class="u-clearfix u-sheet u-valign-middle u-sheet-1">
        <div class="u-list u-repeater u-list-1">
            <c:forEach items="${reviewA}" var="rev">
            <div class="u-container-style u-list-item u-repeater-item u-video-cover u-white">
                <div class="u-container-layout u-similar-container u-container-layout-1">
                    <h3 class="u-text u-text-1">${rev.nume_angajat}</h3>
                    <div class="u-border-4 u-border-palette-3-base u-expanded-width u-line u-line-horizontal u-line-1"></div>
                    <img alt="" class="u-expanded-width-lg u-expanded-width-md u-expanded-width-sm u-expanded-width-xs u-image u-image-default u-image-1" data-image-width="300" data-image-height="300" src="807212911-0.jpeg">
                    <p class="u-text u-text-2">${rev.review}</p>
                </div>
            </div>
            </c:forEach>
        </div>
     </div>
    </div>
   </section>
 </body>
</html>
