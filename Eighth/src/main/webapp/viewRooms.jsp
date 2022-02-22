<%@ page import="com.example.hotel.dao.RoomsDao" %>
<%@ page import="com.example.hotel.classes.Room" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page isELIgnored="false" %>


<fmt:setLocale value="${sessionScope.lang}"/>
<fmt:setBundle basename="messages"/>

<html>
<head>
    <!----Bootstrap---->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">

    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js" integrity="sha384-7+zCNj/IqJ95wo16oMtfsKbZ9ccEh31eOz1HGyDuCQ6wgnyJNSYdrPa03rtR1zdB" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js" integrity="sha384-QJHtvGhmr9XOIpI6YVutG+2QOK9T+ZnN4kzFN1RtK3zEFEIsxhlmWl5/YESvpZ13" crossorigin="anonymous"></script>


    <style>
        #roomsTable{
            padding-top: 85px;
            padding-bottom: 70px;
        }
        #image{
            background-repeat: no-repeat;
            background-attachment: fixed;
            min-height: 100vh;
        }
    </style>

    <title>Users</title>
</head>
<body>
<header>
    <!----Navigation bar---->
    <nav class="navbar navbar-expand-lg navbar-light bg-light fixed-top">
        <div class="container-xxl">
            <a class="navbar-brand" href="index.jsp"><fmt:message key="label.hotel"/></a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                    <li class="nav-item">
                        <a class="nav-link" href="account.jsp"><fmt:message key="label.myAccount"/>(<%=session.getAttribute("name")%>)</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="viewRooms.jsp?page=1&lang=en"><fmt:message key="label.lang.en"/></a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="viewRooms.jsp?page=1&lang=ua"><fmt:message key="label.lang.ua" /></a>
                    </li>
                </ul>
                <form class="form-inline my-2 my-lg-0" method="get" action="logout">
                    <button class="btn btn-outline-info my-2 my-sm-0" type="submit"><fmt:message key="label.logout"/></button>
                </form>
            </div>
        </div>
    </nav>
</header>
<!----Background image---->
<div id="image" class="bg-image"
     style="background-image: url('https://pbs.twimg.com/media/EESubW0XsAA0jPA?format=jpg&name=large')">
    <!----Info---->

    <!---Table with rooms--->
    <section id="roomsTable">
        <div class="container-xxl">
            <div class="card">
                <div class="card-body">
                    <div class="row">
                        <div class="col-2">
                        </div>
                        <div class="col-8">
                            <div class="row">
                                <div class="col-6">
                                    <h1><fmt:message key="label.rooms"/></h1>
                                </div>
                                <div class="col-6">
                                    <form action="insertRoom" method="post">
                                        <div class="row">
                                            <div class="col">
                                                <div class="form-group">
                                                    <input class="form-control" id= "inputNumber" name="number" placeholder="<fmt:message key="label.number"/>" required>
                                                </div>
                                                <p></p>
                                                <div class="form-group">
                                                    <input class="form-control" id= "inputCapacity" name="capacity" placeholder="<fmt:message key="label.capacity"/>" required>
                                                </div>
                                                <p></p>
                                                <div class="form-group">
                                                    <input class="form-control" id= "inputClass" name="roomClass" placeholder="<fmt:message key="label.hotelClass"/>" required>
                                                </div>
                                            </div>
                                            <div class="col">
                                                <div class="form-group">
                                                    <input class="form-control" id= "inputPrice" name="price" placeholder="<fmt:message key="label.price"/>" required>
                                                </div>
                                                <p></p>
                                                <div class="form-group">
                                                    <input class="form-control" id= "inputStatus" name="status" placeholder="<fmt:message key="label.status"/>" required>
                                                </div>
                                                <p></p>
                                                <button type="submit" class="btn btn-info btn-lg"><fmt:message key="label.add"/></button>
                                            </div>
                                        </div>
                                    </form>
                                </div>
                            </div>
                            <div class="row">
                                <table class="table table-striped table-hover">
                                    <thead>
                                    <tr>
                                        <td><h5 style="margin-left: 10px"><fmt:message key="label.number"/></h5></td>
                                        <td><h5 style="margin-left: 10px"><fmt:message key="label.capacity"/></h5></td>
                                        <td><h5 style="margin-left: 10px"><fmt:message key="label.hotelClass"/></h5></td>
                                        <td><h5 style="margin-left: 10px"><fmt:message key="label.price"/></h5></td>
                                        <td><h5 style="margin-left: 10px"><fmt:message key="label.status"/></h5></td>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <%
                                        String stringPageId=request.getParameter("page");
                                        int pageId =Integer.parseInt(stringPageId);
                                        int total = (int) Math.ceil(RoomsDao.count()/5.0);

                                        if(pageId == 1){}
                                        else{
                                            pageId = pageId - 1;
                                            pageId = pageId * total + 1;
                                        }
                                        List<Room> rooms = RoomsDao.getRecords(pageId,total);

                                        for(Room room : rooms){
                                    %>
                                    <tr>
                                        <td><h6 style="text-align: center"><%=room.getNumber()%></h6></td>
                                        <td><h6 style="text-align: center"><%=room.getCapacity()%></h6></td>
                                        <td><h6 style="text-align: center"><%=room.getRoomClass()%></h6></td>
                                        <td><h6 style="text-align: center"><%=room.getPrice()%></h6></td>
                                        <td><h6 style="text-align: center"><%=room.getStatus()%></h6></td>
                                        <td>
                                        <form action="deleteRoom" method="post">
                                            <input hidden name="roomNumber" value="<%=room.getNumber()%>">
                                            <button type="submit" class="btn btn-danger"><fmt:message key="label.delete"/></button>
                                        </form>
                                        </td>
                                    </tr>
                                    <%
                                        }
                                    %>
                                    </tbody>
                                </table>
                            </div>
                            <div class="row">
                                <h4 style="text-align: center"><a href="viewRooms.jsp?page=1" class="link-info">1</a>
                                    <a href="viewRooms.jsp?page=2" class="link-info">2</a>
                                    <a href="viewRooms.jsp?page=3" class="link-info">3</a>
                                    <a href="viewRooms.jsp?page=4" class="link-info">4</a>
                                    <a href="viewRooms.jsp?page=5" class="link-info">5</a></h4>
                            </div>
                        </div>
                        <div class="col-2">
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
</div>
</body>
</html>
