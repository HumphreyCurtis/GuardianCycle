"use strict"
let map = initMap();
function initMap(){
	mapboxgl.accessToken = 'pk.eyJ1IjoiYXJ5Y3JvZnQiLCJhIjoiY2s2dWt4c2c3MDl5ODNnbzNnYmduMmp2ZiJ9.JQuRS_XMadiDfR9tKSCuqA';
	let map = new mapboxgl.Map({
		container: 'map',
		style: 'mapbox://styles/mapbox/streets-v9',
		zoom: 15,
		interactive: false
	});	
	return map;
}

async function fetchJSONObject (fileName) {
  let response = await fetch(fileName);
  let data = await response.json();
  return data;
}

function addEmptyRoute(name){
	let json = {
		type: 'geojson',
	   data: {
	       	"type": "FeatureCollection",
	       	"features": [{
	           "type": "Feature",
	           "geometry": {
	               "type": "LineString",
	               "coordinates": []
	     			},
	     			"properties": {"name":name}
	  		}]
	  	}
	};
	map.addSource(name, json);
	map.addLayer({
		'id': name,
		'type': 'line',
		'source': name,
		'layout': {
		'line-join': 'round',
		'line-cap': 'round'
		},
		'paint': {
		'line-color': '#ff0000',
		'line-width': 8
		}
	});
	return json;
}

function addPointToRoute(json, coords){
	let currentCoords = json.data.features[0].geometry.coordinates;
	currentCoords.push(coords);
	let name = json.data.features[0].properties.name;
	map.getSource(name).setData(json.data);
	let home = coords;
	map.setCenter(home);
}

function getBoundingBox(json){
	let offset = 0.001;
	let coords = json._data.features[0].geometry.coordinates;
	let min_lat = Number.MAX_SAFE_INTEGER;
	let min_lon = Number.MAX_SAFE_INTEGER;
	let max_lat = -Number.MAX_SAFE_INTEGER;
	let max_lon = -Number.MAX_SAFE_INTEGER;
	for(let i = 0; i < coords.length; i++){
		min_lat = Math.min(coords[i][0], min_lat);
  		min_lon = Math.min(coords[i][1], min_lon);
  		max_lat = Math.max(coords[i][0], max_lat);
  		max_lon = Math.max(coords[i][1], max_lon);
	}
	let bounds = new mapboxgl.LngLatBounds(
		new mapboxgl.LngLat(min_lat - offset, min_lon - offset),
		new mapboxgl.LngLat(max_lat + offset, max_lon + offset)
	);
	return bounds;
}

function addRoute(json, name){
	/*Async function to get JSON from server*/
	if(map.getSource(name) != undefined){
		map.fitBounds(getBoundingBox(map.getSource(name)), {
		linear: true
		});
		return;
	}
	fetchJSONObject("/geojson?file=" + json)
	.then(function(data) {
		map.addSource(name, {
 			type: 'geojson',
 			data: data
		});
		displayRoute(name);
	});
}

function displayRoute(name){
	if(map.getSource(name) == undefined){
		return;
	}
	map.addLayer({
		'id': name,
		'type': 'line',
		'source': name,
		'layout': {
		'line-join': 'round',
		'line-cap': 'round'
		},
		'paint': {
		'line-color': '#ff0000',
		'line-width': 8
		}
	});		
	map.fitBounds(getBoundingBox(map.getSource(name)), {
		linear: true
	});
}

function setUpHTMLButtons(routes, ){
	let buttonDiv = document.getElementById("prevRides");
	for(let i = 0; i < routes.length; i++){
		let newButton = document.createElement("button");
		newButton.id = routes[i];
		newButton.innerHTML = routes[i];
		newButton.addEventListener('click', function(){addRoute(routes[i], routes[i])});
		buttonDiv.appendChild(newButton);
	}
}

map.on('load', function(){
	/*Change this to a list of objects*/
	let routes = ["route_test.geojson", "test2.geojson"];
	setUpHTMLButtons(routes);
	addRoute(routes[0], routes[0]);
	/*
	addRoute("route_test.geojson", "test");
	let route = addEmptyRoute(map, "test");
	addPointToRoute(map, route, [-2.5967858,51.44952273]);
	setTimeout(() => {  addPointToRoute(map, route, [-2.59301718,51.44929554]); }, 1000);
	setTimeout(() => {  addPointToRoute(map, route, [-2.59277086,51.44958413]); }, 2000);
	setTimeout(() => {  addPointToRoute(map, route, [-2.59270189,51.4520432]); }, 3000);
	setTimeout(() => {  addPointToRoute(map, route, [-2.59427338,51.45191734]); }, 4000);
	setTimeout(() => {  addPointToRoute(map, route, [-2.59548033,51.45165639]); }, 5000);
	*/
});




