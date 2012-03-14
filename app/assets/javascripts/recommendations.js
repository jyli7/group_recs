$(document).ready(function() {
	Recommendations.initialize();
});

var Recommendations = {
	initialize: function() {
		this.friend_blocks = $('#friends_container .friend_block');
		
		$('#recommendations_form').submit(function(e){
			Recommendations.on_submit_form();
		});
		
		$('#search').keyup(function() {
			Recommendations.filter($('#search').val());
		});
		
		$('.friend_block').click(function(e) {
			e.preventDefault();
			var block = $(this);
			block.hasClass('selected') ? block.removeClass("selected") : block.addClass("selected")
		});
		
		$('#show_selected').click(function(e) {
			e.preventDefault();
			$('.friend_block, #show_selected').addClass('hidden');
			$('.friend_block.selected, #show_all').removeClass('hidden');
		});
		
		$('#show_all').click(function(e){
			e.preventDefault();
			$(this).addClass('hidden');
			$('.friend_block, #show_selected').removeClass('hidden');
		});
		
		$('#clear_selections').click(function(e){
			e.preventDefault();
			$('.selected').removeClass('selected');
		});

    $('.clear_search').click(function() {
      $('#search').val('');
      Recommendations.filter('');
    })
	},
	
	on_submit_form: function() {
		var selected_users = $(".friend_block.selected");
		var user_ids = [];
		for(var i = 0; i < selected_users.length; i++) {
			user_ids.push(selected_users.eq(i).attr('id'));
		}
		$("#recommendations_user_ids").val(user_ids);
	},
	
	filter: function(typed_in) {
		var name, block;
		var friend_blocks = Recommendations.friend_blocks;
    typed_in.length ? $('.clear_search').show() : $('.clear_search').hide();
		if (typed_in.length < 3) {
			friend_blocks.removeClass('hidden');
			return;
		}
		for (i = 0; i < friend_blocks.length; i++){
			block = friend_blocks.eq(i);
			name = block.find('.name').html().toLowerCase();
			if (name.indexOf(typed_in) === -1 && !block.hasClass('selected')) {
				block.addClass('hidden');
			} else {
				block.removeClass('hidden');
			}
		}
	}
}
