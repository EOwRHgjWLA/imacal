document.addEventListener("DOMContentLoaded", function () {
  document.body.addEventListener("ajax:success", function (event) {
    var detail = event.detail;
    var data = detail[0], status = detail[1], xhr = detail[2];
  });
});