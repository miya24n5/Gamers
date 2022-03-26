// ↓document~ これを追加するとリロードせずともtag検索が何回もできる
document.addEventListener("turbolinks:load", function() {
  $(function() {
    $(".tag-name").on("click",function() {
      $(".tag-box1").slideToggle();
    });
  });
});