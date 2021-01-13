<%--
  Created by IntelliJ IDEA.
  User: POPE
  Date: 10.12.2020
  Time: 18:52
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <header>
        <jsp:include page="header.jsp"></jsp:include>
    </header>
    <div class="foter">
        <jsp:include page="footerjsp.jsp"></jsp:include>
    </div>
    <meta charset="ISO-8859-1">
    <title>Insert title here</title>

    <style type="text/css">
        *{
            margin:0;
            padding: 0;
        }
        .foter footer {
            top:1300px;
        }
        body{
            margin-top: 300px;
        }
        .table-box{
            margin:50px auto;
        }
        .table-row{
            display:table;
            width:40%;
            margin:10px auto;
            font-family: sans-serif;
            background: transparent;
            padding: 12px 0;
            color: #555;
            font-size: 13px;
            box-shadow: 0 1px 4px 0 rgba(0,0,50,0.3);
        }
        .table-cell{
            display: table-cell;
            width: 10%;
            text-align:left;
            padding: 4px 0;

            vertical-align: middle;
        }
        .personal{
            text-align: center;
            font-family: 'Times New Roman', serif;
            text-transform: uppercase;
            font-size: 20px;
            background-color: rgba(82, 81, 95, 0.2);
            color:silver;
            width: 850px;
            margin-left: 600px;
        }
        .select{

            padding-left: 80px;
            left:50%;
            object-position: center;
            margin-left: 750px;
            padding-top: 80px;

        }
        .bil{
            background-color :rgba(79, 125, 224, 0);

            margin:20px 0px 0px 20px;
            text-align:center;
            text-decoration: none;
            text-transform:uppercase;
            border-radius: 12px;
            border: transparent;
            padding: 14px 110px;
            outline: none;
            color:rgb(14, 12, 12);
            cursor:pointer;

            transition:all 0.35s ease-out;
            font-family: "Apple Color Emoji", "Segoe UI Emoji", "NotoColorEmoji", "Segoe UI Symbol", "Android Emoji", "EmojiSymbols";
        }
        .bil:hover{
            background-color: rgba(4, 60, 243, 0.4);
            transition:all 0.35s ease-in;
        }
    </style>
</head>
<body>
<div class="inf_principale">
    <div class="table-box">
        <h1 class="personal">Informatii Principale</h1>
        <div class="table-row">
            <div class="table-cell">
                <p>First Name</p>
            </div>
            <div class="table-cell">
                <p class="text">${user.nume}</p>
            </div>
        </div>
        <div class="table-row">
            <div class="table-cell">
                <p>Last Name</p>
            </div>
            <div class="table-cell">
                <p class="text">${user.prenume}</p>
            </div>
        </div>
        <div class="table-row">
            <div class="table-cell">
                <p>Email</p>
            </div>
            <div class="table-cell">
                <p class="text">${user.email}</p>
            </div>
        </div>
        <div class="table-row">
            <div class="table-cell">
                <p>CNP</p>
            </div>
            <div class="table-cell">
                <p class="text">${user.CNP}</p>
            </div>
        </div>
        <div class="table-row">
            <div class="table-cell">
                <p>Phone Number</p>
            </div>
            <div class="table-cell">
                <p class="text">${user.nr_telefon}</p>
            </div>
        </div>
        <div class="table-row">
            <div class="table-cell">
                <p>Password</p>
            </div>
            <div class="table-cell">
                <p class="text">${user.password}</p>
            </div>
        </div>
    </div>
</div>
<div class="istoric_bilete">
    <div class="table-box">
        <div class="table-row">
            <div class="table-cell">
                <p>Numar Bilet</p>
            </div>
            <div class="table-cell">
                <p>Numar Zbor</p>
            </div>
            <div class="table-cell">
                <p>Tip bilet</p>
            </div>
            <div class="table-cell">
                <p>Loc</p>
            </div>
            <div class="table-cell">
                <p>Pret</p>
            </div>
            <div class="table-cell">
                <p>Tip Bagaj</p>
            </div>
        </div>
        <!--Linia 1-->
    <c:forEach items="${istB}" var="index" >
        <div class="table-row">
            <div class="table-cell">
                <p>${index.nr_bilet}</p>
            </div>
            <div class="table-cell">
                <p>${index.nr_zbor}</p>
            </div>
            <div class="table-cell">
                <p>${index.tip_bilet}</p>
            </div>
            <div class="table-cell">
                <p>${index.loc}</p>
            </div>
            <div class="table-cell">
                <p>${index.pret}</p>
            </div>
            <div class="table-cell">
                <p>${index.tip_bagaj}</p>
            </div>
        </div>
    </c:forEach>
    </div>

</div>
<div class="select">
    <a href="${pageContext.request.contextPath}/buyticket" class="bil" type="submit">Cumparare Bilete</a>
</div>


</body>
</html>




