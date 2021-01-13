<%--
  Created by IntelliJ IDEA.
  User: POPE
  Date: 03.01.2021
  Time: 12:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Insert title here</title>
    <style type="text/css">
        *{
            margin:0;
            padding:0;
        }

        body{
            width: auto;
            height: 1000px;
            overflow: scroll;
        }
        body{
            background-image: url(backreg.jpg);
            background-position: center;
            background-position-x: right;
            background-size:2400px;

            font-family:Garamond, serif;
            margin-top:250px;
            background-color: lightblue;
        }
        .regform{
            width:1903px;
            background-color: rgba(27, 43, 77, 0.4);
            margin:auto;
            color:#FFFFFF;
            padding :10px 0px 10px 0px;
            text-align: center;
            border-radius: 15px 15px 0px 0px;
        }
        .main{
            background-color: rgba(33, 48, 75, 0.4);
            color:#FFFFFF;
            width: 1903px;
            margin:auto;
            margin-top:400px;

        }
        form{
            padding: 10px;
            margin-left: 500px;

        }
        #name{
            width: 100%;
            height:100px;
        }
        .name{
            margin-left: 25px;
            margin-top:30px;
            width:125px;
            color:white;
            font-weight: 700;
        }
        .firstname{
            position: relative;
            left:200px;
            top:-37px;
            line-height: 30px;
            border-radius: 10px;
            border: transparent;
            padding: 0 22px;
        }
        .secondname{
            position: relative;
            left:200px;
            top:-37px;
            line-height: 30px;
            border-radius: 10px;
            border: transparent;
            padding: 0 22px;
        }
        .firstlabel{
            position:relative;
            columns: #e5e5e5;
            text-transform: capitalize;
            font-size:14px;
            left:50px;
            top:-100x;
        }
        .lastlabel{
            position:relative;
            columns: #e5e5e5;
            text-transform: capitalize;
            font-size:14px;
            left:50px;
            top:-100x;
        }
        .emai{
            position: relative;
            left:200px;
            top:-37px;
            line-height: 40px;
            width: 480px;
            border-radius: 10px;
            border: transparent;
            padding: 0 22px;
            font-size: 16px;
            color: #555;
        }
        .imail{
            margin-left: 25px;
            margin-top:20px;
            width:125px;
            color:white;
            font-weight: 700;
        }
        .number{
            position: relative;
            left:200px;
            top:-37px;
            line-height: 40px;
            width: 480px;
            border-radius: 10px;
            border: transparent;
            padding: 0 22px;
            font-size: 16px;
            color: #555;
        }
        .telefon{
            margin-left: 25px;
            margin-top:20px;
            width:125px;
            color:white;
            font-weight: 700;
        }
        .CNP{
            position: relative;
            left:200px;
            top:-37px;
            line-height: 40px;
            width: 480px;
            border-radius: 10px;
            border: transparent;
            padding: 0 22px;
            font-size: 16px;
            color: #555;
        }
        .cod{
            margin-left: 25px;
            margin-top:20px;
            width:125px;
            color:white;
            font-weight: 700;
        }
        .password{
            position: relative;
            left:200px;
            top:-37px;
            line-height: 40px;
            width: 480px;
            height: 100px;
            border-radius: 10px;
            border: transparent;
            padding: 0 22px;
            font-size: 16px;
            color: #555;
        }
        .par{
            margin-left: 25px;
            margin-top:20px;
            width:125px;
            color:white;
            font-weight: 1000;
            border-radius: 20px;

        }
        .select{

            padding-left: 80px;
            left:50%;
            object-position: center;

        }
        .reg{
            background-color :rgba(79, 125, 224, 0);

            margin:20px 0px 0px 20px;
            text-align:center;
            text-transform:uppercase;
            border-radius: 12px;
            border: transparent;
            padding: 14px 110px;
            outline: none;
            color:rgb(14, 12, 12);
            cursor:pointer;
            transition:0.25px;
            transition:all 0.35s ease-out;
        }
        .reg:hover{
            background-color:rgba(140, 224, 92, 0.4);
            transition:all 0.35s ease-in;
        }
        .cancel{
            background-color :rgba(79, 125, 224, 0);
            margin:20px 0px 0px 20px;
            text-align:center;
            text-transform:uppercase;
            border-radius: 12px;
            border: transparent;
            padding: 15px 110px;
            outline: none;
            color:rgb(14, 12, 12);
            cursor:pointer;
            transition:0.25px;
            transition:all 0.35s ease-out;

        }
        .cancel:hover{
            background-color:rgba(241, 66, 66, 0.4);
            transition:all 0.35s ease-in;
        }
        .foter footer {
            top:1500px;
        }
    </style>
    <header>
        <jsp:include page="header.jsp"></jsp:include>
    </header>
    <div class="foter">
        <jsp:include page="footerjsp.jsp"></jsp:include>
    </div>
</head>
<body>
<div class="main">
    <div class="regform"><h1>Leave Review</h1></div>
    <form method="POST" action="${pageContext.request.contextPath}/submitreview">
        <div id="name">
            <h2 class="name">Employee Name </h2>
            <input class="firstname" type="text" name="nume" value="${submitreview.nume}"/>
            <label class="firstlabel">first name</label>
            <input class="secondname" type="text" name="prenume" value="${submitreview.prenume}"/>
            <label class="lastlabel">last name</label>
        </div>
        <h2 class="imail">Duty free</h2>
        <input class="emai" type="text" name="duty_free" value="${submitreview.duty_free}"/>

        <h2 class="par">Review</h2>
        <input class="password" type="text" name="review" value="${submitreview.review}"/>
        <div class="select">
            <input class="reg" type="submit" name="submit" value="Submit"/>
            <button class="cancel" type="submit" >Cancel</button>
        </div>
    </form>
</div>

</body>
</html>
