let exp = require('express');
let app = exp();
let fs = require('fs');

const port = 8080;

app.use(exp.static('public'));

app.get('/geojson', function (req, res) {
	let data = fs.readFileSync('geojson/' + req.query.file);
	let json = JSON.parse(data);
	console.log(json);
	res.send(json);
});

app.get('/api', function(req, res){
	res.send(process.env.api);
});

app.listen(port, function(){
	console.log("Listening on port 8080");
});