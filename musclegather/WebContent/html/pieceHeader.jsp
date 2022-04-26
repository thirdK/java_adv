<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div id="headerWrap">
    <div class="topSideBtn">
        <input type="button" class="labelBtn" id="sideBtn1" />
        <label for="sideBtn1">
            <span></span><span></span><span></span>
        </label>
    </div>

    <div class="topLogo">
        <div>
            <img src="/src/assets/image/logo/muscle_logo1.png" alt="" />
            <!-- <img src="/src/assets/image/logo/muscle_logo2.png" alt="" /> -->
        </div>
    </div>

    <div class="topLink">
        <ul class="noneStyle">
            <li><a href="">링크1</a></li>
            <li><a href="">링크2</a></li>
            <li><a href="">링크3</a></li>
        </ul>
    </div>
    <div class="topLog">
        <input type="button" class="inputBtn labelBtn" id="topBtn1" onclick="location.href='/membership.html'" />
        <label for="topBtn1">Login</label>
        <span>/</span>
        <input type="button" class="inputBtn labelBtn" id="topBtn2" onclick="location.href='#' " />
        <label for="topBtn2">Logout</label>

    </div>
</div>