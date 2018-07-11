var SystemAlert = require('ti.systemalert');

var mySystemAlert = SystemAlert.createSystemAlert({
	url: 'alert.wav'
});

var win = Ti.UI.createWindow({
	backgroundColor: '#fff'
});

var btn = Ti.UI.createButton({
	title: 'Play System Alert'
});

btn.addEventListener('click', function() {
	mySystemAlert.play();	
});

win.add(btn);
win.open();