<%@page import="java.util.List"%>
<%@page import="trangbtt.dtos.RoomDTO"%>
<%@page import="trangbtt.daos.RoomDAO"%>
<!-- Room Section Begin -->
<section class="room-section">
    <div class="container-fluid">


        <div class="row">
            <div class="col-lg-6">
                <div class="ri-slider-item">
                    <div class="ri-sliders owl-carousel">
                        <div class="single-img set-bg" data-setbg="img/rooms/room-3.jpg"></div>
                        <div class="single-img set-bg" data-setbg="img/rooms/room-4.jpg"></div>
                        <div class="single-img set-bg" data-setbg="img/rooms/room-1.jpg"></div>
                    </div>
                </div>
            </div>
            <div class="col-lg-6" style="display: flex; justify-content: center; align-items: center;">
                <form action="InsertCartController"  method="POST">

                    <div>
                        <h4>Make a Revervation</h4>
                        <div style="width: 200px;">
                            <p>From</p>
                            <div class="input-group">
                                <input type="text" id="picker1" class="form-control" name="txtFrom" autocomplete="off">
                                <div class="input-group-prepend">
                                    <button type="button" id="toggle1" class="input-group-text">
                                        <i class="far fa-calendar-alt"></i>
                                    </button>
                                </div>
                            </div>
                            <p>To</p>
                            <div class="input-group">
                                <input type="text" id="picker2" class="form-control" name="txtTo" autocomplete="off">
                                <div class="input-group-prepend">
                                    <button type="button" id="toggle2" class="input-group-text">
                                        <i class="far fa-calendar-alt"></i>
                                    </button>
                                </div>
                            </div>
                        </div>
                        <div class="room-quantity">
                            <div class="single-quantity">
                                <p>Adults</p>
                                <input type="number" min="1" max="8" value="1" style="width: 80%;" name="txtAdult">
                            </div>
                            <div class="single-quantity">
                                <p>Children</p>
                                <input type="number" min="0" max="8" value="0" style="width: 80%;" name="txtChild">
                            </div>

                            <div class="room-selector">
                                <p>Room</p>
                                <%
                                    RoomDAO dao = new RoomDAO();
                                    List<RoomDTO> result = dao.loadRoomDTO();
                                    int count = 0;
                                    if (result != null) {
                                        count++;

                                %>
                               
                                
                                <select class="suit-select" name="txtRoom">
                                    <option  selected disabled hidden>Number Room-Type-Price</option>

                                    <%   for (RoomDTO dto : result) {
                                    %>
                                    <option  value="<%= dto.getRoomID()%> <%= dto.getRoomType()%> <%= dto.getPrice()%>"> <%= dto.getRoomID()%> <%= dto.getRoomType()%> <%= dto.getPrice()%></option>
                                    <%
                                        }%>
                                </select>

                                <%
                                    }
                                %>
                            </div>


                        </div>

                        <br /> <br />

                        <input type="submit" value="Add to Cart" class="primary-btn">
                    </div>
                </form>

            </div>
        </div>
    </div>

</section>
<!-- Room Section End -->