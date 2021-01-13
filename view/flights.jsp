<%--
  Created by IntelliJ IDEA.
  User: POPE
  Date: 21.12.2020
  Time: 15:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Insert title here</title>
    <style type="text/css">
        body {
            background: rgb(255, 255, 255);
        }
        .container{
            margin-left: 5%;
            margin-top: 15%;
        }
        .panes{
            width: 300px;
            height: 30px;
            display: inline-block;
            margin: 0 auto;
            border-radius: .05em;
            border: .01em solid #444;
            position: relative;
            background: #222;
            text-align: center;
            line-height: 1;
            font-size: 30px;
            color: #f7ef05;
            font-family: monospace;
            box-shadow:
                    0px .02em 0 #ccc,
                    0px .05em 0 #000;
            text-shadow: -1px -2px 2px rgba(0,0,0,1);
            z-index: 50;
            margin-bottom: 10px;
        }
        .pane{
            width: 300px;
            height: 30px;
            display: inline-block;
            margin: 0 auto;
            border-radius: .05em;
            border: .01em solid #444;
            position: relative;
            background: #222;
            text-align: center;
            line-height: 1;
            font-size: 30px;
            color: #f7ef05;
            font-family: monospace;
            box-shadow:
                    0px .02em 0 #ccc,
                    0px .05em 0 #000;
            text-shadow: -1px -2px 2px rgba(0,0,0,1);
            z-index: 50;
        }

        /*.pane:before {
          display: block;
          width: 100%;
          height: 0px;
          content: "";
          position: absolute;
          top: 50%;
          left: 0;
          margin: 0 auto;
          margin-left: -.05em;
          border: .05em solid black;
          z-index: -10;

        }*/

        .panes:after {
            position: absolute;
            top: 50%;
            left: 0;
            content: "";
            border-top: 2px solid #000;
            border-bottom: 2px solid rgba(255,255,255,.3);
            width: 100%;
            height: 0px;
            opacity: .8;
            z-index: 10;
            margin-top: -1px
        }
        .pane::after{
            position: absolute;
            top: 50%;
            left: 0;
            content: "";
            border-top: 2px solid #000;
            border-bottom: 2px solid rgba(255,255,255,.3);
            width: 100%;
            height: 0px;
            opacity: .8;
            z-index: 10;
            margin-top: -1px
        }
        .foter footer {
            top:1500px;
        }
    </style>
</head>
<header>
    <jsp:include page="header.jsp"></jsp:include>
</header>

<div class="foter">
    <jsp:include page="footerjsp.jsp"></jsp:include>
</div>
<body>
<div class="container">

    <div class="row">
        <div class="panes">ID FLIGHT</div>
        <div class="panes">DEPARTURE TIME</div>
        <div class="panes">PLECARE</div>
        <div class="panes">DESTINATIE</div>
        <div class="panes">COMPANIE</div>
        <div class="panes">AVION</div>
        <div class="panes">GATE</div>
    </div>
    <c:forEach items="${flights}" var="zbor">
    <div class="row">
        <div class="pane">${zbor.id_flight}</div>
       <div class="pane">${zbor.ora_plecare}</div>
        <div class="pane">${zbor.plecare}</div>
        <div class="pane">${zbor.destinatie}</div>
        <div class="pane">${zbor.companie}</div>
        <div class="pane">${zbor.avion}</div>
        <div class="pane">${zbor.poarta}</div>
    </div>
    </c:forEach>
</div>
</body>
</html>
