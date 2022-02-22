<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>


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

    <!----CDN DataTable---->
    <link rel="stylesheet" href="https://cdn.datatables.net/1.10.22/css/dataTables.bootstrap4.min.css">
    <script src="https://cdn.datatables.net/1.10.22/js/jquery.dataTables.min.js">
    </script>
    <script src="https://cdn.datatables.net/1.10.22/js/dataTables.bootstrap4.min.js">
    </script>

    <style>
        #table{
            display: none;
            padding-top: 25px;
            padding-bottom: 70px;
        }
        #image{
            background-repeat: no-repeat;
            background-attachment: fixed;
            min-height: 100vh;
        }
    </style>

    <title>Premium</title>
</head>
<body>
<header>
    <!----Navigation bar---->
    <nav class="navbar navbar-expand-lg navbar-light bg-light fixed-top" style="max-height: 80px">
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
<!---Background image--->
<div id="image" class="bg-image"
     style="background-image: url('https://pbs.twimg.com/media/EESubW0XsAA0jPA?format=jpg&name=large')">
    <!---Room info--->
    <section style="padding-top: 85px">
        <div class="container-xxl">
            <div class="card">
                <div class="card-body">
                    <div class="container">
                        <div class="row">
                            <div class="col" style="padding-top: 30px">
                                <div id="carouselExampleControls" class="carousel slide" data-bs-ride="carousel">
                                    <div class="carousel-inner" style=" width:100%; height: 400px !important;">
                                        <div class="carousel-item active" style="-webkit-transition: 0.2s !important; -o-transition: 0.2s !important; transition: 0.2s !important;">
                                            <img src="https://i.pinimg.com/originals/a4/a8/b5/a4a8b5e997c88d3854d6bf2696b3c725.jpg" class="d-block w-100" alt="...">
                                        </div>
                                        <div class="carousel-item" style="-webkit-transition: 0.2s !important; -o-transition: 0.2s !important; transition: 0.2s !important;">
                                            <img src="https://t.eu1.jwwb.nl/W739179/LVUllzvJ-LETj6ANGXPd2GevIrY=/full-fit-in/400x400/filters:no_upscale():quality(40)/f.eu1.jwwb.nl%2Fpublic%2Fo%2Ft%2Fs%2Ftemp-rarpipdeqezxnveglvrv%2Frv0wgn%2FBurj-Al-Arab-Club-Suite-Upper-level-luxury-bathroom.jpg" class="d-block w-100" alt="...">
                                        </div>
                                        <div class="carousel-item" style="-webkit-transition: 0.2s !important; -o-transition: 0.2s !important; transition: 0.2s !important;">
                                            <img src="https://img1.goodfon.com/wallpaper/nbig/9/23/greciya-more-terrasa-vid.jpg" class="d-block w-100" alt="...">
                                        </div>
                                    </div>
                                    <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleControls" data-bs-slide="prev">
                                        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                                        <span class="visually-hidden">Previous</span>
                                    </button>
                                    <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleControls" data-bs-slide="next">
                                        <span class="carousel-control-next-icon" aria-hidden="true"></span>
                                        <span class="visually-hidden">Next</span>
                                    </button>
                                </div>

                                <h5 class="card-text" style="color: teal; text-align: justify; text-indent: 25px; padding-bottom: 20px">You’ll notice it the instant you walk in –
                                    the attention to detail and the effort we made to meet your
                                    needs and requirements. Starting from the comfortable king-size
                                    bed to the spacious walk-in closet to the large marble bathroom
                                    with separate shower and bathtub. 24 hour room service, bathrobe
                                    and slippers and, upon your request, the daily newspaper at your
                                    door – we don’t want you to lack anything.</h5>
                            </div>
                            <div class="col">
                                <div class="container-xxl">
                                    <div class="row">
                                        <div class="col-12">
                                            <!------Order window---->
                                            <div class="card text-center">
                                                <div class="card-body">
                                                    <h5 class="card-title text-danger text-capitalize">Book your Premium room</h5>
                                                    <form action="order" method="post" autocomplete="off">
                                                        <div class="row">
                                                            <div class="col">
                                                                <div class="form-group">
                                                                    <input type="text" class="form-control" id="datepicker1" name="datepicker1" placeholder="Select Check-in Date" required>
                                                                </div>
                                                            </div>
                                                            <div class="col">
                                                                <div class="form-group">
                                                                    <input type="text" class="form-control" id="datepicker2" name="datepicker2" placeholder="Select Check-out Date" required>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="row">
                                                            <div class="col">
                                                                <select class="form-select" name="class" id="class" aria-label="Default select example">
                                                                    <option selected="selected" hidden="hidden" value="premium">Premium</option>
                                                                    <option value="premium">Premium</option>
                                                                </select>
                                                            </div>
                                                            <div class="col">
                                                                <select class="form-select" name="capacity" id="capacity" aria-label="Default select example">
                                                                    <option selected="selected" hidden="hidden">Number of persons</option>
                                                                    <option value="1">1</option>
                                                                    <option value="2">2</option>
                                                                    <option value="3">3</option>
                                                                    <option value="4">4</option>
                                                                    <option value="5">5</option>
                                                                </select>
                                                            </div>
                                                        </div>
                                                        <div class="row">
                                                            <div class="col-8"></div>
                                                            <div class="col-4">
                                                                <div class="text-center text-lg-start mt-4 pt-2">
                                                                    <button type="submit" class="btn btn-danger btn-lg">Book</button>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </form>
                                                </div>
                                            </div>
                                            <div class="card-footer text-center text-muted">
                                                Booking confirmation will be in your Account and Email
                                            </div>
                                            <div class="row">
                                                <p></p>
                                                <p></p>
                                            </div>
                                            <!----Booking (Show table)----->
                                            <div class="card text-center">
                                                <div class="card-body">
                                                    <h5 class="card-title text-primary text-capitalize">Or Choose the exact room you want</h5>
                                                    <div class="row">
                                                        <div class="col-12 text-center">
                                                            <input type="button" class="btn btn-primary text-end" value="Show rooms list" onmousedown="viewTable()">
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!---Modal window to book the room--->
    <section>
        <div class="modal" id="addBookDialog" tabindex="-1" role="dialog">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title">Booking</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">

                        <form action="book" method="post" autocomplete="off">

                            <h3 style="display: inline">Room № </h3><h3 style="display: inline" id="roomNo">?</h3>
                            <input hidden name="roomNo" value="&" id="roomInput">

                            <div class="row">
                                <div class="col">
                                    <div class="form-group pt-2">
                                        <input type="text" class="form-control" id="datepicker3" name="datepicker3" placeholder="Select Check-in Date" required>
                                    </div>
                                </div>
                                <div class="col">
                                    <div class="form-group pt-2">
                                        <input type="text" class="form-control" id="datepicker4" name="datepicker4" placeholder="Select Check-out Date" required>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-7"></div>
                                <div class="col-2">
                                    <div class="text-center text-lg-start pt-2 pe-2">
                                        <button type="submit" class="btn btn-danger btn-lg">Book</button>
                                    </div>
                                </div>
                                <div class="col-3">
                                    <div class="text-center text-lg-start pt-2 pe-3">
                                        <button type="button" class="btn btn-secondary btn-lg" data-dismiss="modal">Cancel</button>
                                    </div>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!---Table with rooms--->
    <section id="table">
        <div class="container-xxl">
            <div class="card">
                <button type="button" class="btn-close align-self-end mt-4 me-4" aria-label="Close" onmousedown="hideTable()"></button>
                <div class="card-body">

                    <%@ page import="com.example.hotel.classes.Room" %>
                    <%@ page import="com.example.hotel.dao.RoomsDao" %>
                    <%@ page import="java.util.List" %>

                    <div class="row">
                        <div class="col-2">
                        </div>
                        <div class="col-8">
                            <h1>Premium rooms:</h1>
                            <table class="table table-striped table-hover" id="sortTable">
                                <thead>
                                <tr>
                                    <td><h3 style="margin-left: 50px">number</h3></td>
                                    <td><h3 style="margin-left: 50px">capacity</h3></td>
                                    <td><h3 style="margin-left: 50px">price</h3></td>
                                    <td><h3 style="margin-left: 50px">status</h3></td>
                                    <td><h3 style="margin-left: 50px"></h3></td>
                                </tr>
                                </thead>
                                <tbody>
                                <%
                                    List<Room> list = RoomsDao.getRoomsByClass("premium");
                                    for (Room room: list) {
                                %>
                                <tr>
                                    <td><h6 style="text-align: center"><%=room.getNumber()%></h6></td>
                                    <td><h6 style="text-align: center"><%=room.getCapacity()%></h6></td>
                                    <td><h6 style="text-align: center"><%=room.getPrice()%></h6></td>
                                    <td><h6 style="text-align: center"><%=room.getStatus()%></h6></td>
                                    <%
                                        if(room.getStatus().equals("available"))  {
                                    %>
                                    <td><a data-toggle="modal" data-id="<%=room.getNumber()%>"
                                           class="open-AddBookDialog btn btn-outline-primary btn-sm" href="#addBookDialog">Book</a></td>
                                    <%
                                    } else {
                                    %>
                                    <td><a data-toggle="modal" data-id="<%=room.getNumber()%>"
                                           class="btn btn-outline-secondary btn-sm disabled">Book</a></td>
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

<!------Scripts for datepicker----->
<script type="text/javascript">
    $(document).ready(function () {
        $('#datepicker1').datepicker({
            todayHighlight: true,
            startDate: new Date(),
            autoclose: true,
            format: 'yyyy-mm-dd'
        });
    });
</script>
<script type="text/javascript">
    $(document).ready(function () {
        $('#datepicker2').datepicker({
            todayHighlight: true,
            startDate: new Date(),
            autoclose: true,
            format: 'yyyy-mm-dd'
        });
    });
</script>
<script type="text/javascript">
    $(document).ready(function () {
        $('#datepicker3').datepicker({
            todayHighlight: true,
            startDate: new Date(),
            autoclose: true,
            format: 'yyyy-mm-dd'
        });
    });
</script>
<script type="text/javascript">
    $(document).ready(function () {
        $('#datepicker4').datepicker({
            todayHighlight: true,
            startDate: new Date(),
            autoclose: true,
            format: 'yyyy-mm-dd'
        });
    });
</script>
<!------Scripts for table view----->
<script>
    function viewTable(){
        document.getElementById("table").style.display = "block";
    }
</script>
<script>
    function hideTable(){
        document.getElementById("table").style.display = "none";
    }
</script>
<!------Script to add booking modal window----->
<script>
    $(document).on("click", ".open-AddBookDialog", function () {
        var roomNumber = $(this).data('id');
        $("#roomInput").val(roomNumber);
        $("#roomNo").text(roomNumber);
    });
</script>
<!------Script for DataTable----->
<script>
    $('#sortTable').DataTable();
</script>

</body>
</html>
