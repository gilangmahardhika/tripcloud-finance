$(function() {
	$(document).on('change', 'input.single-price', function() {
		var temp = 0;
		$('input.single-price').each(function() {
			var nilai = parseFloat($(this).val());
			temp = temp + nilai;
		});
		$('input.grand-price').val(temp);
	});
});