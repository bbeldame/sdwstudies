var questionId = 0;

function enterTheGame() {
	var name = $('#init #name').val();
	if (!!name) {
		$.ajax({
			url: 'ajax.php',
			data: {
				name: name,
				func: 'init'
			},
			dataType: 'json',
			type: 'POST'
		}).done(function(data){
			$('#init').hide();
			displayPlayerInfo(data);
			question(questionId);
		}).fail(function(data){
			alert('Error on enterTheGame');
		});
	} else {
		$('#init p').text('Ecris ton nom stp');
	}	
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
		$('#question').append("<p><u>Clique sur la bonne réponse à cette question : </u></p>");
		$('#question').append("<p>" + data.question + "</p>")
		for (var i = 0; i < data.answers_length; i++) {
			$("#question").append("<p class=\"questions\" id=" + i + ">" + data.answers[i].answer + '</p>');
		}
		for (var i = 0; i <= data.answers_length; i++) {
    		var selector = "#" + i;
    		$(selector).on('click', {id: i}, function (e) {
    		    verify_answer(e.data.id);
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
		console.log(data);
		if (data == 1) {
			$('#question #' + id).removeClass().addClass('questionsRight');
		} else {
			$('#question #' + id).removeClass().addClass('questionsFalse');
		}
		setTimeout(function(){
			$('#question #' + id).removeClass().addClass('questions');
			$('#question').empty();
			getPlayerInfo();
			questionId++;
			if (questionId < 20) {
				question(questionId);
			} else {
				theEnd();
			}
		}, 200);
	}).fail(function(res){
		alert('Error on verify_answer with id ', id);
	});
}

function getPlayerInfo() {
	$.ajax({
		url: 'ajax.php',
		data: {
			func: 'getPlayerInfo'
		},
		dataType: 'json',
		type: 'POST'
	}).done(function(data){
		displayPlayerInfo(data);
	}).fail(function(res){
		alert('Error on getplayerinfo with id ', id);
	});
}

function displayPlayerInfo(data) {
	$('footer p #name').text(data.name);
	$('footer p #points').text(data.points);
	$('footer p #questionNumber').text(questionId + 1);
	$('footer').show();
}

function theEnd() {
	$('body').empty();

	$.ajax({
		url: 'ajax.php',
		data: {
			func: 'getPlayerTheEnd'
		},
		dataType: 'json',
		type: 'POST'
	}).done(function(data){
		$('body').append('<p>'+data.name+', vous avez fini avec un score de '+data.points+' sur 20 !</p>');
		$('body').append('<p>Vous êtes : '+data.glory+'</p>');
		$('body').append('<a><u>Clique pour recommencer</u></a>');
		$('body a').click(function() {
    		location.reload();
		});
	}).fail(function(res){
		alert('Error on theend with id ', id);
	});	
}