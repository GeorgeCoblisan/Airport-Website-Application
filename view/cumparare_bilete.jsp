<%--
  Created by IntelliJ IDEA.
  User: POPE
  Date: 18.12.2020
  Time: 08:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Insert title here</title>
    <header>
        <jsp:include page="header.jsp"></jsp:include>
    </header>

    <div class="foter">
        <jsp:include page="footerjsp.jsp"></jsp:include>
    </div>
    <style type="text/css">
        *{
            margin:0;
            padding:0;
        }
        body{
            background-position: center;
            text-align: center;
            margin-top: 600px;
            margin-left: 200px;
            width: auto;
            height: 1000px;
            overflow: scroll;
            padding-left: -300px;

        }
        .titlu{
            padding-bottom: 70px;
            font-family:  Rockwell;
            color: rgba(0,0,255,0.5);
        }
        .plecare{
            position: relative;
            left:200px;
            top:-60px;
            line-height: 20px;
            border-radius: 10px;
            padding: 0 22px;
            margin-left: -200px;
            margin-right: 40px;
        }
        .sosire{
            position: relative;
            left:240px;
            top:-60px;
            line-height: 20px;
            border-radius: 10px;
            padding: 0 22px;
            margin-left: -150px;
            margin-right: 200px;
        }
        .plecarelabel{
            position:relative;
            columns: #e5e5e5;
            left:-25px;
            top:-40px;
            margin-top: -20px;

        }
        .sosirelabel{
            position:relative;
            columns: #e5e5e5;
            left:-120px;
            top:-30px;
        }
        .data {
            width: 200px;
            height: 100px;
            margin: 0 auto;
            margin-top: -100px;
            margin-left: 550px;

        }
        input[type=date] {
            height: 35px;
            margin: 0 auto;
            width: 100%;
            font-family: arial, sans-serif;
            font-size: 17px;
            font-weight: bold;
            text-transform: uppercase;
            background-color: lighten(#2f2f2f,40%);
            outline: none;
            border: 3px;
            border-radius: 3px;
            padding: 0 0px;
            color: #347aeb;
        }
        ::-webkit-datetime-edit { padding: 1em; }
        ::-webkit-datetime-edit-fields-wrapper { background: rgb(255, 255, 255); }
        ::-webkit-datetime-edit-text { color: rgb(0, 60, 255); padding: 0 0.3em; }
        ::-webkit-datetime-edit-month-field { color: rgb(64, 64, 136); }
        ::-webkit-datetime-edit-day-field { color: rgb(69, 93, 158); }
        ::-webkit-datetime-edit-year-field { color: rgb(56, 62, 155); }
        ::-webkit-inner-spin-button { display: none; }
        .titlu{
            margin-left: 150px;
        }

        .buton1{
            background-color :rgba(235, 238, 243, 0);
            margin:20px 0px 0px 20px;
            text-align:center;
            text-transform:uppercase;
            border-radius: 30px;
            border: transparent;
            padding: 0px 40px;
            outline: none;
            transition:0.25px;
            transition:all 0.35s ease-out;
        }
        .buton1:hover{
            background-color:rgba(17, 50, 238, 0.3);
            transition:all 0.35s ease-in;
        }
        .namebtn{
            font-family: Rockwell Extra Bold,Rockwell Bold,monospace;
        }
        #Date{
            margin-left: -390px;
            margin-top: 50px;
            background-color: silver;
            border-radius: 30px;
            border: transparent;
            padding: 0px 40px;
            outline: none;

        }
        .checkbox{
            margin-top: -15px;
            margin-left: 30px;
        }
        .persoane{
            margin-top: -25px;
            margin-left:100px;
        }
        .findticket{
            margin-top:20px;
            margin-left: 220px;
        }
        .subm{
            height: 40px;
            width: 150px;
            background-color: rgb(247, 248, 247);
            border-radius: 30px;
            border: transparent;
            padding: 0px 34px;
            outline: none;
            transition:0.25px;
            transition:all 0.35s ease-out;
        }
        .subm:hover{
            background-color:rgba(17, 50, 238, 0.582);
            transition:all 0.35s ease-in;
        }
        th{
            padding-right: 40px;
            padding-top: 30px;
        }
        td{
            padding-top: 30px;
        }
        .buyt{
            height: 40px;
            width: 150px;
            background-color: rgb(247, 248, 247);
            border-radius: 30px;
            border: transparent;
            padding: 0px 34px;
            outline: none;
            transition:0.25px;
            transition:all 0.35s ease-out;
        }
        .buyt:hover{
            background-color:rgba(17, 238, 35, 0.3);
            transition:all 0.35s ease-in;
        }
        .foter footer {
            top:1400px;
            height: 250px;
        }
        .container1{
            margin-top: 300px;
            margin-left: -120px;
            position: center;
            background-image:url(tickets.jpg);
            background-position: center;

        }
        #rout{
            margin-left: 20%;
        }
        #rout .subm{
            margin-left: 10%;
        }
       .economy{
           margin-top: -25px;
           margin-left:300px;
       }
       .Business{
           margin-top: -25px;
           margin-left:400px;
       }
       .first_class{
           margin-top: -25px;
           margin-left:500px;
       }
       .geniu{
           margin-left: -20%;
           padding-right:3%;
           position: center;
       }
       .nr_bilet{
          width: 30px;
       }
      tr{
          width: max-content;
      }

    </style>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css"
          integrity="sha384-9gVQ4dYFwwWSjIDZnLEWnxCjeSWFphJiwGPXr1jddIhOegiu1FwO5qRGvFXOdJZ4" crossorigin="anonymous">
</head>

<body>
<div class="container1" >
  <div class="container col-sm-4 col-md-7 col-lg-4 mt-5">
   <form method="POST" action="${pageContext.request.contextPath}/buyticket">
    <h1 class="titlu">Cumparare Bilete</h1>
    <div class="select_box">
        <input class="plecare" type="text" name="plecare_aero" value=""/>
        <label class="plecarelabel">Locatia de plecare</label>
        <input class="sosire" type="text"  name="sosire_aero" value=""/>
        <label class="sosirelabel">Destinatia</label>
    </div>
    <div class="data">
        <input type="date" id="myDate" name="data" value="">
       <!-- <button onclick="myFunction()" class="buton1"><a class="namebtn">Get date</a></button>
        <output type="date" id="Date" name="data" value="">-->
    </div>
    <div class="checkbox">
        <div class="cargo"><td>Cargo</td>
            <td><input type="checkbox" name="cargo" value="" /></td></div>
        <div class="persoane"><td>Persoane</td>
            <td><input type="checkbox" name="pers" value="" /> </td></div>
        <div class="economy"><td>Economy</td>
            <td><input type="checkbox" name="eco" value="" /> </td></div>
        <div class="Business"><td>Business</td>
            <td><input type="checkbox" name="bus" value="" /> </td></div>
        <div class="first_class"><td>First Class</td>
            <td><input type="checkbox" name="fc" value="" /> </td></div>
    </div>
    <div class="findticket">
        <input type="submit" value= "Find Rout" class="subm" onclick="myFunction2()"/>
    </div>
   </form>
      <div id="rout">
        <table>
            <tr>
                <th>Plecare</th>
                <th>Escala 1</th>
                <th>Escala 2</th>
                <th>Destinatie</th>
            </tr>
            <tr>
               <c:forEach items="${buyticket}" var="rout" >
                 <th>${rout.nume}</th>
               </c:forEach>
            </tr>
        </table>
        <input type="submit" value= "Find Tickets" class="subm" onclick="myFunction1()" />
    </div>

    <div id="myDIV">
        <table>
            <tr>
                <th>Numar Bilet</th>
                <th>Tip</th>
                <th>Loc</th>
                <th>Pret</th>
                <th>Tip Bagaj</th>
                <th>Ora Plecare</th>
                <th>Ora Sosire</th>
            </tr>

            <!--<c:forEach items="${tickets}" var="ti" >-->
            <tr>
                <td>${ti.nr_bilet}</td>
                <td>${ti.tip_bilet}&nbsp;&nbsp;</td>
                <td>&nbsp;&nbsp;${ti.loc}</td>
                <td>${ti.pret}$</td>
                <td>${ti.tip_bagaj}</td>
                <td>${ti.ora_plecare}</td>
                <td>${ti.ora_sosire}</td>
            </tr>
            <!--</c:forEach>-->
            <form method="POST" action="${pageContext.request.contextPath}/buyt">
                <td><input type="submit" value="Buy Tickets" class="buyt"/></td>
            </form>
        </table>
    </div>
</div>
</div>
<script>
    function myFunction() {
        var x = document.getElementById("myDate").value;
        document.getElementById("Date").innerHTML = x;
    }
    function myFunction1() {
        var x = document.getElementById("myDIV");
        if (x.style.display == "none") {
            x.style.display = "block";
        } else {
            x.style.display = "none";
        }
    }
    document.getElementById("myDIV")
        .addEventListener("mouseover", document.getElementById("myDIV").style.display="none");

    function myFunction2() {
        var x = document.getElementById("rout");
        if (x.style.display == "none") {
            x.style.display = "block";
        } else {
            x.style.display = "none";
        }
    }
    document.getElementById("rout")
        .addEventListener("mouseover", document.getElementById("rout").style.display="none");
</script>
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
        integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
        crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"
        integrity="sha384-cs/chFZiN24E4KMATLdqdvsezGxaGsi4hLGOzlXwp5UZB1LY//20VyM2taTB4QvJ"
        crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"
        integrity="sha384-uefMccjFJAIv6A+rW+L4AHf99KvxDjWSu1z9VI8SKNVmz4sk7buKt/6v9KI65qnm"
        crossorigin="anonymous"></script>
</body>
</html>
