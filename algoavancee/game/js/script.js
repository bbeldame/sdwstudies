function enterTheGame() {
	var name = $('#name').val();
	console.log(name);

	$.ajax({
		url: 'ajax.php',
		data: {
			name: name,
			func: 'init'
		},
		type: 'POST'
	}).done(function(res){
		$('p').hide();
		$('#name').hide();
		$('button').hide();
		question(0);
	}).fail(function(res){
		alert('Error on enterTheGame');
	});
}

function question(id) {
	$.ajax({
		url: 'ajax.php',
		data: {
			id: id,
			func: 'getQuestion'
		},
		dataType: 'json',
		type: 'POST'
	}).done(function(data){
		$('body').append("<p><u>Clique sur la bonne réponse à cette question : </u></p>");
		$('body').append("<p>" + data.question + "</p>")
		for (var i=0; i < data.answers_length; i++) {
			$("body").append("<p id=" + i + ">" + data.answers[i].answer + '</p>');
			$("#" + i).click(function() {
				verify_answer(i);
			});
		}
	}).fail(function(res){
		alert('Error on question with id ', id);
	});
}

function verify_answer(id) {
	$.ajax({
		url: 'ajax.php',
		data: {
			id: id,
			func: 'verifyAnswer'
		},
		dataType: 'json',
		type: 'POST'
	}).done(function(data){

	}).fail(function(res){
		alert('Error on verify_answer with id ', id);
	});
}