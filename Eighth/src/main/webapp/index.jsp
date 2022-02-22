
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

    <title>Hotel</title>
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
<div class="bg-image"
     style="background-image: url('https://pbs.twimg.com/media/EESubW0XsAA0jPA?format=jpg&name=large');
            background-repeat: no-repeat;
            background-attachment: fixed;
            min-height: 100vh">


    <!----Hotel carousel---->
    <section style="padding-top: 85px">
        <div class="container-xxl">
            <div class="card text-center">
                <div class="card-body">
                    <div class="row">
                        <div class="col-7">
                            <div id="carouselExampleControls" class="carousel slide" data-bs-ride="carousel">
                                <div class="carousel-inner" style=" width:100%; height: 450px !important;">
                                    <div class="carousel-item active " style="-webkit-transition: 0.2s !important; -o-transition: 0.2s !important; transition: 0.2s !important;">
                                        <img src="https://imagesvc.meredithcorp.io/v3/mm/image?url=https%3A%2F%2Fstatic.onecms.io%2Fwp-content%2Fuploads%2Fsites%2F28%2F2021%2F08%2F11%2Fgrace-hotel-00-GRRESTHOTELWB21.jpg" class="d-block w-100" alt="...">
                                    </div>
                                    <div class="carousel-item" style="-webkit-transition: 0.2s !important; -o-transition: 0.2s !important; transition: 0.2s !important;">
                                        <img src="https://www.travelplusstyle.com/wp-content/uploads/2020/05/vora-santorini-villa-ro-r-10.jpg" class="d-block w-100" alt="...">
                                    </div>
                                    <div class="carousel-item" style="-webkit-transition: 0.2s !important; -o-transition: 0.2s !important; transition: 0.2s !important;">
                                        <img src="https://media-cdn.tripadvisor.com/media/photo-m/1280/17/62/64/83/sel-de-mer.jpg" class="d-block w-100" alt="...">
                                    </div>
                                    <div class="carousel-item" style="-webkit-transition: 0.2s !important; -o-transition: 0.2s !important; transition: 0.2s !important;">
                                        <img src="https://imageio.forbes.com/specials-images/imageserve/6080eb2ba2428f14701c1409/0x0.jpg?format=jpg&width=1200&fit=bounds" class="d-block w-100" alt="...">
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
                        </div>
                        <div class="col-5">
                            <img src="https://d1csarkz8obe9u.cloudfront.net/posterpreviews/grand-hotel-logo-design-template-50c7255579b1e9df6d8bae41f78889c1_screen.jpg?ts=1611148225" class="rounded mx-auto d-block" width="400px" height="400px" style="padding-top: 40px">
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!----Info---->
    <section style="padding-top: 20px">
        <div class="container-xxl">
            <div class="card-group">
                <div class="card text-center">
                    <img src="https://www.filoxenianews.gr/wp-content/uploads/2021/02/w-bogota-extreme-wow-suite-1024x683.jpg"
                         style=" width:100%; height: 300px !important;"
                         class="card-img-top" alt="room1">
                    <div class="card-body">
                        <h5 class="card-title"><fmt:message key="label.standard"/></h5>
                        <p class="card-text"><fmt:message key="label.100"/></p>
                        <p class="card-text"><fmt:message key="label.garden"/></p>
                        <p class="card-text"><fmt:message key="label.breakfast"/></p>
                        <a href="standard.jsp" class="btn btn-primary btn-lg" style="background-color: teal"><fmt:message key="label.moreInfo"/></a>
                    </div>
                </div>
                <div class="card text-center">
                    <img src="https://www.filoxenianews.gr/wp-content/uploads/2021/10/w-doha-qatar-suite-min-1024x683.jpg"
                         style=" width:100%; height: 300px !important;"
                         class="card-img-top" alt="room2">
                    <div class="card-body">
                        <h5 class="card-title"><fmt:message key="label.comfort"/></h5>
                        <p class="card-text"><fmt:message key="label.180"/></p>
                        <p class="card-text"><fmt:message key="label.sea"/></p>
                        <p class="card-text"><fmt:message key="label.three"/></p>
                        <a href="comfort.jsp" class="btn btn-primary btn-lg" ><fmt:message key="label.moreInfo"/></a>
                    </div>
                </div>
                <div class="card text-center">
                    <img src="https://i.pinimg.com/originals/a4/a8/b5/a4a8b5e997c88d3854d6bf2696b3c725.jpg"
                         style=" width:100%; height: 300px !important;"
                         class="card-img-top" alt="room3">
                    <div class="card-body">
                        <h5 class="card-title"><fmt:message key="label.premium"/></h5>
                        <p class="card-text"><fmt:message key="label.300"/></p>
                        <p class="card-text"><fmt:message key="label.sea"/></p>
                        <p class="card-text"><fmt:message key="label.allInc"/></p>
                        <a href="premium.jsp" class="btn btn-primary btn-lg" style="background-color: mediumvioletred"><fmt:message key="label.moreInfo"/></a>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!----Book---->
    <section>
        <div class="container-xxl" style="padding-top: 25px; padding-bottom: 30px">
            <div class="row">
                <div class="col">
                </div>
                <div class="col-6">
                    <div class="card">
                        <div class="card-body">
                            <h5 class="card-title text-danger text-capitalize text-center"><fmt:message key="label.bookNow"/></h5>
                                <div class="row">
                                        <form action="order" method="post" autocomplete="off">

                                            <div class="row">
                                                <div class="col">
                                                    <div class="form-group">
                                                        <input type="text" class="form-control" id="datepicker1" name="datepicker1" placeholder="<fmt:message key="label.date1"/>" required>
                                                    </div>
                                                </div>
                                                <div class="col">
                                                    <div class="form-group">
                                                        <input type="text" class="form-control" id="datepicker2" name="datepicker2" placeholder="<fmt:message key="label.date2"/>" required>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col">
                                                    <select class="form-select" name="class" id="class" aria-label="Default select example">
                                                        <option selected="selected" hidden="hidden"><fmt:message key="label.hotelClass"/></option>
                                                        <option value="standard"><fmt:message key="label.standard"/></option>
                                                        <option value="comfort"><fmt:message key="label.comfort"/></option>
                                                        <option value="premium"><fmt:message key="label.premium"/></option>
                                                    </select>
                                                </div>
                                                <div class="col">
                                                    <select class="form-select" name="capacity" id="capacity" aria-label="Default select example">
                                                        <option selected="selected" hidden="hidden"><fmt:message key="label.capacity"/></option>
                                                        <option value="1">1</option>
                                                        <option value="2">2</option>
                                                        <option value="3">3</option>
                                                        <option value="4">4</option>
                                                        <option value="5">5</option>
                                                    </select>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-9"></div>
                                                <div class="col-3">
                                                    <div class="text-center text-lg-start mt-2 pt-2">
                                                        <button type="submit" class="btn btn-danger btn-lg pt-2"><fmt:message key="label.book"/></button>
                                                    </div>
                                                </div>
                                            </div>
                                        </form>
                                </div>
                        </div>
                        <div class="card-footer text-center text-muted">
                            <fmt:message key="label.bookingConfirm"/>
                        </div>
                    </div>
                </div>
                <div class="col">
                </div>
            </div>
        </div>
    </section>
</div>



<!----Sweet alert---->
<script src="vendor/jquery/jquery.min.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<link rel="stylesheet" href="alert/dist/sweetalert.css">

<!----Datepicker---->
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

<!----Check status of creating account---->
<script type="text/javascript">
    var status = document.getElementById("status").value;
    if(status === "success"){
        swal({
            title: "Congrats",
            text: "Account Created Successfully",
            type: "success"
        }).then(function() {
            window.location = "login.jsp";
        });
    }
    if(status === "failed"){
        swal("Sorry", "User already exists", "error");
    }
    if(status === "failedByValid"){
        swal("Sorry", "Failed validation", "error");
    }
</script>

</body>
</html>
