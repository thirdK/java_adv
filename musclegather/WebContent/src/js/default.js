/**
 * 
 */

//페이지 링크

$(document).ready(function () {
  $("#header").load("/../../html/pieceHeader.html");
  // $("#nav").load("../html/pieceNav.html");
  // $("#sideBar").load("/html/pieceSidebar.html");
  $("#footer").load("/../../html/pieceFooter.html");
});

// 페이지 오픈  이벤트
// 온오프 cee
$(document).ready(function () {
  $("label[for='sideBtn1']").click(function () {
    $("#nav").toggleClass("on");
  });
});

// 스크롤 이벤트
// header action
$(window).scroll(function () {
  if ($(this).scrollTop() == 0) $("#header").css("opacity", "1");
  else $("#header").css("opacity", ".4");
});

//
//popupShift
function popup() {
  //팝업 박스 오픈
  $("#popupBox").css("display", "block");
}