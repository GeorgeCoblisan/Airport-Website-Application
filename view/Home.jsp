<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<home>
<head>
<meta charset="ISO-8859-1">
<link href="${pageContext.request.contextPath}/header">
<link href="${pageContext.request.contextPath}/styleHome" rel="stylesheet" type="text/css">
<title>Home Page</title>
    <style>
        body{
            background-image: url(185289.jpg);
            background-position: center;
            background-size: 2400px;
            font-family:Garamond, serif;
            background-color: lightblue;

        }
        body {
            width: 2350px;
            height: 1440px;
            overflow: scroll;
        }
      .foot footer{
          top:1400px;
      }

    </style>
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>
<div class="back">

    </div>
<div class="foot"><jsp:include page="footerjsp.jsp"></jsp:include></div>
</body>
</home>