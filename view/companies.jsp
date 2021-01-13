<%--
  Created by IntelliJ IDEA.
  User: POPE
  Date: 03.01.2021
  Time: 13:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html style="font-size: 16px;">
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta charset="utf-8">
    <meta name="keywords" content="Responsive Table">
    <meta name="description" content="">
    <meta name="page_type" content="np-template-header-footer-from-plugin">
    <title>Page 1</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/comp1" media="screen">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/comp2" media="screen">
    <script class="u-script" type="text/javascript" src="jquery.js" defer=""></script>
    <script class="u-script" type="text/javascript" src="nicepage.js" defer=""></script>
    <meta name="generator" content="Nicepage 3.3.1, nicepage.com">
    <link id="u-theme-google-font" rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto:100,100i,300,300i,400,400i,500,500i,700,700i,900,900i|Open+Sans:300,300i,400,400i,600,600i,700,700i,800,800i">
    <link id="u-page-google-font" rel="stylesheet" href="https://fonts.googleapis.com/css?family=Playfair+Display:400,400i,700,700i,900,900i">


    <meta property="og:title" content="Page 1">
    <meta property="og:type" content="website">
    <meta name="theme-color" content="#478ac9">
    <link rel="canonical" href="index.html">
    <meta property="og:url" content="index.html">

    <style type="text/css">
        .contreview{
            margin-top: -20%;
        }
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
        .u-section-1 .u-text-4{align-content: center;}
        .u-section-1 .u-container-layout-4{margin-left: 6px;
            margin-top: -10px;}
        .u-section-1 .u-container-layout-6{
            margin-left: 20px;
            margin-top: -20px;
        }

        header{
            margin-top: 0%;
        }
        .move{
            padding-top: 15%;
        }

    </style>


</head>
<header>
    <jsp:include page="header.jsp"></jsp:include>
</header>

<div class="foter">
    <jsp:include page="footerjsp.jsp"></jsp:include>
</div>
<body data-home-page="Page-1.html" data-home-page-title="Page 1" class="u-body">
<div class="move">
  <section class="u-align-center u-clearfix u-palette-5-base u-section-1" id="carousel_3ef8">
    <div class="u-clearfix u-sheet u-sheet-1">
        <h2 class="u-custom-font u-font-playfair-display u-text u-text-1">Companies</h2>
        <p class="u-text u-text-2">Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla</p>
        <div class="u-expanded-width u-table u-table-responsive u-table-1">
            <table class="u-table-entity u-table-entity-1">
                <colgroup>
                    <col width="20%">
                    <col width="20%">
                    <col width="20%">
                    <col width="20%">
                    <col width="20%">
                </colgroup>
                <thead class="u-palette-5-dark-2 u-table-header u-table-header-1">
                <tr style="height: 46px;">
                    <th class="u-border-2 u-border-no-left u-border-no-right u-border-no-top u-border-palette-5-dark-1 u-table-cell">NAME</th>
                    <th class="u-border-2 u-border-no-left u-border-no-right u-border-no-top u-border-palette-5-dark-1 u-table-cell">OFFICE</th>
                    <th class="u-border-2 u-border-no-left u-border-no-right u-border-no-top u-border-palette-5-dark-1 u-table-cell">date of establishment</th>
                    <th class="u-border-2 u-border-no-left u-border-no-right u-border-no-top u-border-palette-5-dark-1 u-table-cell">aircrafts</th>
                    <th class="u-border-2 u-border-no-left u-border-no-right u-border-no-top u-border-palette-5-dark-1 u-table-cell">employees</th>
                </tr>
                </thead>
                <tbody class="u-palette-5-dark-3 u-table-body u-table-body-1">
                <c:forEach items="${companies}" var="comp">
                <tr style="height: 69px;">
                    <td class="u-border-1 u-border-palette-5-dark-1 u-table-cell u-table-cell-6">${comp.nume}</td>
                    <td class="u-border-1 u-border-palette-5-dark-1 u-table-cell u-table-cell-7">${comp.sediu}</td>
                    <td class="u-border-1 u-border-palette-5-dark-1 u-table-cell u-table-cell-8">${comp.data_inf}</td>
                    <td class="u-border-1 u-border-palette-5-dark-1 u-table-cell u-table-cell-9">${comp.nr_avioane}</td>
                    <td class="u-border-1 u-border-palette-5-dark-1 u-table-cell u-table-cell-10">${comp.nr_angajati}</td>
                </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
   </section>
 </div>




</body>
</html>
