
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page isELIgnored="false" %>


<fmt:setLocale value="${sessionScope.lang}"/>
<fmt:setBundle basename="messages"/>


<html>
<head>
    <!----Bootstrap CDN---->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">

    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js" integrity="sha384-7+zCNj/IqJ95wo16oMtfsKbZ9ccEh31eOz1HGyDuCQ6wgnyJNSYdrPa03rtR1zdB" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js" integrity="sha384-QJHtvGhmr9XOIpI6YVutG+2QOK9T+ZnN4kzFN1RtK3zEFEIsxhlmWl5/YESvpZ13" crossorigin="anonymous"></script>

    <!----Datepicker---->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/css/bootstrap-datepicker.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/js/bootstrap-datepicker.js"></script>

    <style>
        #image{
            background-repeat: no-repeat;
            background-attachment: fixed;
            min-height: 100vh;
        }
    </style>
    <title>Account</title>
</head>
<body>
<input type="hidden" id="status" value="<%=request.getAttribute("status")%>">
<header>
    <!----Navigation bar---->
    <nav class="navbar navbar-expand-lg navbar-light bg-light fixed-top" style="max-height: 80px">
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
                        <a class="nav-link" href="${requestScope['javax.servlet.forward.request_uri']}?lang=en"><fmt:message key="label.lang.en"/></a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="${requestScope['javax.servlet.forward.request_uri']}?lang=ua"><fmt:message key="label.lang.ua" /></a>
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

    <section style="padding-bottom: 40px">
        <div class="container-xxl">
                <div class="row" style="padding-top: 85px">
                    <div class="col-1">
                    </div>
                    <div class="col-3">
                        <!----User info card---->
                        <div class="card" style="text-align: center">
                            <div class="card-body">
                                <h5 class="card-title"><%=session.getAttribute("name")%></h5>

                                <%@ page import="java.text.SimpleDateFormat" %>
                                <%@ page import="java.util.Date" %>
                                <%@ page import="java.time.format.DateTimeFormatter" %>
                                <%@ page import="java.time.LocalDateTime" %>
                                <%@ page import="java.util.Locale" %>
                                <%@ page import="com.example.hotel.dao.UsersDao" %>
                                <%@ page import="com.example.hotel.classes.User" %>
                                <%@ page import="java.util.List" %>
                                <%@ page import="com.example.hotel.classes.Order" %>
                                <%@ page import="com.example.hotel.dao.OrdersDao" %>
                                <%@ page import="com.example.hotel.dao.BookingsDao" %>
                                <%@ page import="com.example.hotel.dao.join.RoomBooking" %>
                                <%@ page import="java.text.ParseException" %>

                                <%
                                    String user_id = session.getAttribute("user_id").toString();
                                    User account = UsersDao.getUserById(user_id);
                                                   if(account!=null){
                                %>
                                                    <h5><fmt:message key="label.email"/> : <%=account.getEmail()%></h5>
                                                    <h5 style="padding-top: 5px"><fmt:message key="label.phone"/> : <%=account.getPhone()%></h5>
                                <%
                                                    }
                                            %>
                                <p></p>
                                <a href="logout" class="btn btn-info"><fmt:message key="label.logout"/></a>
                            </div>
                        </div>
                    </div>
                    <div class="col-7">
                        <!----User orders---->
                        <div class="row">
                            <div class="card" style="text-align: center">
                                <div class="card-body">
                                    <h5 class="card-title"><fmt:message key="label.managerReview"/></h5>
                                    <!-----Table with bookings---->
                                    <table class="table table-warning table-hover" id="sortTable">
                                        <thead>
                                        <tr>
                                            <td><h5 style="margin-left: 20px"><fmt:message key="label.capacity"/></h5></td>
                                            <td><h5 style="margin-left: 20px"><fmt:message key="label.hotelClass"/></h5></td>
                                            <td><h5 style="margin-left: 20px"><fmt:message key="label.checkIn"/></h5></td>
                                            <td><h5 style="margin-left: 20px"><fmt:message key="label.checkOut"/></h5></td>
                                            <td><h5 style="margin-left: 20px"><fmt:message key="label.status"/></h5></td>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        <%
                                            String sessionUser = session.getAttribute("user_id").toString();
                                            List<Order> orders = OrdersDao.getOrdersByUserId(sessionUser);

                                            for (Order order: orders) {
                                        %>
                                        <tr>
                                            <td><h6 style="text-align: center"><%=order.getCapacity()%></h6></td>
                                            <td><h6 style="text-align: center"><%=order.getRoomClass()%></h6></td>
                                            <td><h6 style="text-align: center"><%=order.getDate1()%></h6></td>
                                            <td><h6 style="text-align: center"><%=order.getDate2()%></h6></td>
                                            <td><h6 style="text-align: center"><%=order.getStatus()%></h6></td>
                                        </tr>
                                        <%
                                                }
                                        %>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-1">
                    </div>
                </div>
                <div class="row pt-4">
                    <div class="col-1">
                    </div>
                    <div class="col-10">
                        <!----User bookings---->
                        <div class="card" style="text-align: center">
                            <div class="card-body">
                                <h5 class="card-title"><fmt:message key="label.yourBookings"/></h5>
                                <!-----Table with bookings---->
                                <table class="table table-striped table-hover">
                                    <thead>
                                    <tr>
                                        <td><h6 style="margin-left: 20px"><fmt:message key="label.number"/></h6></td>
                                        <td><h6 style="margin-left: 20px"><fmt:message key="label.hotelClass"/></h6></td>
                                        <td><h6 style="margin-left: 20px"><fmt:message key="label.checkIn"/></h6></td>
                                        <td><h6 style="margin-left: 20px"><fmt:message key="label.checkOut"/></h6></td>
                                        <td><h6 style="margin-left: 20px"><fmt:message key="label.status"/></h6></td>
                                        <td><h6 style="margin-left: 30px"><fmt:message key="label.expire"/></h6></td>
                                        <td><h6></h6></td>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <%
                                            String sessionID = session.getAttribute("user_id").toString();
                                            List<RoomBooking> list = BookingsDao.getBookingsJoinRoom(sessionID);

                                            for(RoomBooking rb : list){
                                    %>
                                    <tr>
                                        <td><h6 style="text-align: center"><%=rb.getRoomNumber()%></h6></td>
                                        <td><h6 style="text-align: center"><%=rb.getRoomClass()%></h6></td>
                                        <td><h6 style="text-align: center"><%=rb.getBooking().getDate1()%></h6></td>
                                        <td><h6 style="text-align: center"><%=rb.getBooking().getDate2()%></h6></td>
                                        <td><h6 style="text-align: center"><%=rb.getBooking().getStatus()%></h6></td>
                                        <!-----Expiration date format----->
                                        <%
                                            final String OLD_FORMAT = "yyyy-MM-dd HH:mm:ss";
                                            final String NEW_FORMAT = "dd, MMM HH:mm";

                                            String oldDateString = rb.getBooking().getExpire();
                                            String newDateString;

                                            SimpleDateFormat sdf = new SimpleDateFormat(OLD_FORMAT);
                                            Date d = null;
                                            try {
                                                d = sdf.parse(oldDateString);
                                            } catch (ParseException e) {
                                                e.printStackTrace();
                                            }
                                            sdf.applyPattern(NEW_FORMAT);
                                            newDateString = sdf.format(d);
                                        %>
                                        <td><h6 style="text-align: center"><%=newDateString%></h6></td>
                                        <%
                                            LocalDateTime now = LocalDateTime.now();
                                            DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
                                            String nowString = now.format(formatter);

                                            Date expireDate = new Date();
                                            Date nowDate = new Date();
                                            try {
                                                expireDate = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss", Locale.ENGLISH).parse(oldDateString);
                                                nowDate = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss", Locale.ENGLISH).parse(nowString);
                                            } catch (ParseException e) {
                                                e.printStackTrace();
                                            }
                                            if(rb.getBooking().getStatus().equals("not paid") && expireDate.compareTo(nowDate) > 0){%>
                                        <td>
                                            <a href="https://www.visa.com.ua/ru_UA/pay-with-visa/featured-technologies/google-pay-consumer.html" class="btn btn-danger"><fmt:message key="label.payOrder"/></a>
                                        </td>
                                        <%
                                        }
                                        else if(rb.getBooking().getStatus().equals("not paid") && expireDate.compareTo(nowDate) <= 0){
                                        %>
                                        <td>
                                            <a href="#" class="btn btn-secondary disabled" role="button" aria-disabled="true"><fmt:message key="label.timeExpired"/></a>
                                        </td>
                                        <%
                                        }
                                        else {
                                        %>
                                        <td>
                                            <a href="#" class="btn btn-secondary disabled" role="button" aria-disabled="true"><fmt:message key="label.orderPaid"/></a>
                                        </td>
                                        <% }
                                        }
                                        %>
                                    </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                    <div class="col-1">
                    </div>
                </div>
        </div>
    </section>
</div>

<!----Sweet alert---->
<script src="vendor/jquery/jquery.min.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<link rel="stylesheet" href="alert/dist/sweetalert.css">


<!----Script to check status of making an order/booking---->
<script type="text/javascript">
    var status = document.getElementById("status").value;
    if(status === "success"){
        swal({
            title: "Booking made successfully",
            text: "Pay it in two days",
            type: "success"
        });
    }
    if(status === "failed"){
        swal("Sorry", "Booking error", "error");
    }
</script>

</body>
</html>
