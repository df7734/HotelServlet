
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>

<html>
<head>
    <!----Bootstrap---->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">

    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js" integrity="sha384-7+zCNj/IqJ95wo16oMtfsKbZ9ccEh31eOz1HGyDuCQ6wgnyJNSYdrPa03rtR1zdB" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js" integrity="sha384-QJHtvGhmr9XOIpI6YVutG+2QOK9T+ZnN4kzFN1RtK3zEFEIsxhlmWl5/YESvpZ13" crossorigin="anonymous"></script>

    <!----Datepicker---->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/css/bootstrap-datepicker.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/js/bootstrap-datepicker.js"></script>

    <!----DataTable---->
    <link rel="stylesheet" href="https://cdn.datatables.net/1.10.22/css/dataTables.bootstrap4.min.css">
    <script src="https://cdn.datatables.net/1.10.22/js/jquery.dataTables.min.js">
    </script>
    <script src="https://cdn.datatables.net/1.10.22/js/dataTables.bootstrap4.min.js">
    </script>

    <style>
        #tableManager{
            padding-top: 85px;
            padding-bottom: 70px;
        }

        #image{
            background-repeat: no-repeat;
            background-attachment: fixed;
            min-height: 100vh;
        }
    </style>

    <title>Manager</title>
</head>
<body>
<header>
    <!----Navigation bar---->
    <nav class="navbar navbar-expand-lg navbar-light bg-light fixed-top">
        <div class="container-xxl">
            <a class="navbar-brand" href="index.jsp">Hotel</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                    <li class="nav-item">
                        <a class="nav-link" href="account.jsp">My Account(<%=session.getAttribute("name")%>)</a>
                    </li>
                </ul>
                <form class="form-inline my-2 my-lg-0" method="get" action="logout">
                    <button class="btn btn-outline-info my-2 my-sm-0" type="submit">Logout</button>
                </form>
            </div>
        </div>
    </nav>
</header>
<!----Background image---->
<div id="image" class="bg-image"
     style="background-image: url('https://pbs.twimg.com/media/EESubW0XsAA0jPA?format=jpg&name=large')">
    <!----Info---->

    <!---Table with orders--->
    <section id="tableManager">
        <div class="container-xxl">
            <div class="card">
                <div class="card-body">

                    <%@ page import="java.util.List" %>
                    <%@ page import="com.example.hotel.classes.Order" %>
                    <%@ page import="com.example.hotel.dao.OrdersDao" %>

                    <div class="row">
                        <div class="col-2">
                        </div>
                        <div class="col-8">
                            <div class="row">
                                <div class="col-10">
                                    <h1>Orders</h1>
                                </div>
                                <div class="col-2">
                                    <h5><a href="viewRooms.jsp?page=1" class="link-info">View Rooms</a></h5>
                                </div>
                            </div>
                            <table class="table table-striped table-hover" id="sortTable">
                                <thead>
                                <tr>
                                    <td><h5 style="margin-left: 3px">user ID</h5></td>
                                    <td><h5 style="margin-left: 3px">capacity</h5></td>
                                    <td><h5 style="margin-left: 3px">class</h5></td>
                                    <td><h5 style="margin-left: 3px">check-in</h5></td>
                                    <td><h5 style="margin-left: 3px">check-out</h5></td>
                                    <td><h5 style="margin-left: 3px">status</h5></td>
                                    <td><h5 style="margin-left: 3px"></h5></td>
                                </tr>
                                </thead>
                                <tbody>
                                <%
                                    List<Order> orders = OrdersDao.getOrders();
                                        for(Order order : orders){
                                %>
                                <tr>
                                    <td><h6 style="text-align: center"><%=order.getUser_id()%></h6></td>
                                    <td><h6 style="text-align: center"><%=order.getCapacity()%></h6></td>
                                    <td><h6 style="text-align: center"><%=order.getRoomClass()%></h6></td>
                                    <td><h6 style="text-align: center"><%=order.getDate1()%></h6></td>
                                    <td><h6 style="text-align: center"><%=order.getDate2()%></h6></td>
                                    <td><h6 style="text-align: center"><%=order.getStatus()%></h6></td>
                                    <%
                                        if(order.getStatus().equals("wait"))  {
                                    %>
                                    <td>
                                        <form action="choose" method="get">
                                            <input hidden name="orderId" value="<%=order.getId()%>">
                                            <button type="submit" class="btn btn-outline-primary">Choose</button>
                                        </form>
                                    </td>
                                    <%
                                    } else {
                                    %>
                                    <td><button disabled type="button" class="btn btn-outline-secondary">Done</button></td>
                                    <%
                                        }
                                    %>
                                </tr>
                                <%
                                        }
                                %>
                                </tbody>
                            </table>
                        </div>
                        <div class="col-2">
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
</div>
<!----Script for datatable---->
<script>
    $('#sortTable').DataTable();
</script>

</body>
</html>

