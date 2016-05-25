// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require bootstrap
//= require_tree .

$(function() {
	$('li.user[user_id] .btn').click(function(event){
		var $this = $(this);
		var userId = $this.parent().attr('user_id');
		if ($(this).hasClass('btn-primary')) {
			$.ajax({
				url: '/users/'+userId+'/follow',
				type: 'POST',
				success: function(data, status){
					$this.html('Unfollow').removeClass('btn-primary');
				},
			});
		}else{
			$.ajax({
				url: '/users/'+userId+'/unfollow',
				type: 'DELETE',
				success: function(data, status) {
					$this.html('Follow').addClass('btn-primary');
				}
			});
		}
		event.preventDefault();
	})		
});

//$(function() {})是一個jQuery的construct功用是"這些程式等頁面全部載入之後執行"
//$('li.user[user_id] .btn')是一個jQuery的CSS對比功能
//幫助找到頁面上"有class是user以及attribute(屬性)是user_id的<li>元素底下(包住)的btn"
//再來把listener(監聽)的觸發事件設定為click,代表那段javascript會在點擊後執行
//另外 顯示Follow或UnFollow取決於那個btn的Class是否為btn-primary
//意思就是這段javascript會去看有沒有btn-primary來辨識你是否follow過這個用戶 當關注成功後 會更新link的文字與class(把btn-primary去掉)
//event.preventDefault()會在你操作的時候防止頁面上的自動化事件