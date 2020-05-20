import React from 'react';
import mapboxgl from 'mapbox-gl';
import AlrtIncident from '../components/AlrtIncident';

mapboxgl.accessToken = process.env.REACT_APP_mapboxgl.accessToken;
var mqtt    = require('mqtt');
var options = {
	protocol: 'mqtts',
	// clientId uniquely identifies client
	// choose any string you wish
	clientId: 'b0908853' 	
};
var client  = mqtt.connect('mqtt://test.mosquitto.org:8081', options);
client.subscribe('guardiancycle');


// implementation of CustomLayerInterface to draw a pulsing dot icon on the map
// see https://docs.mapbox.com/mapbox-gl-js/api/#customlayerinterface for more info
class Map extends React.Component {
	constructor(props) {
		super(props);
		this.state = {
			lng: -2.6004,
			lat: 51.4562,
			zoom: 12.10,
			inc: {isIncident: false,
				lastCoord: [0,0]}
		};
	}

	componentDidMount() {
		var size = 200;
		var dotInnerColour;
		var dotOuterColour;
		// As per https://stackoverflow.com/a/55286301/6333825
		// ensures layer removed before new one in place
		function RemoveMapLayer() {
			var mpLayer = map.getLayer('points');
			if (typeof mpLayer === 'undefined') {
				// No Layer
			} else {
				map.removeLayer('points');
			}

			var mpSource = map.getSource('points');
			if (typeof mpSource === 'undefined') {
				// No Source
			} else {
				map.removeSource('points');
			}

			if (map.hasImage('pulsing-dot')) {
				map.removeImage('pulsing-dot');	
			}

		}
		const map = new mapboxgl.Map({
			container: this.mapContainer,
			style: 'mapbox://styles/mapbox/streets-v11',
			center: [this.state.lng, this.state.lat],
			zoom: this.state.zoom
		});
		map.on('move', () => {
			this.setState({
				lng: map.getCenter().lng.toFixed(4),
				lat: map.getCenter().lat.toFixed(4),
				zoom: map.getZoom().toFixed(2)
			});
		});
		client.on('message',(topic, message) => {
			this.setState({inc: JSON.parse(message)});
			if (this.state.inc.isIncident === false) {
				dotInnerColour = 'rgba(0, 72, 186,';
				dotOuterColour = 'rgba(0, 72, 186,';
			} else {
				dotOuterColour = 'rgba(255, 200, 200,';
				dotInnerColour = 'rgba(255, 100, 100,';
			}
			RemoveMapLayer();
			map.addImage('pulsing-dot', pulsingDot, { pixelRatio: 2 });
			map.addSource('points', {
				'type': 'geojson',
				'data': {
					'type': 'FeatureCollection',
					'features': [
						{'type': 'Feature','geometry': 
							{'type': 'Point','coordinates': [this.state.inc.lastCoord[0], this.state.inc.lastCoord[1]]}
						}
					]
				}
			});
			map.addLayer({
				'id': 'points',
				'type': 'symbol',
				'source': 'points',
				'layout': {
					'icon-image': 'pulsing-dot'
				}
			});
		}
		);
		var pulsingDot = {
			width: size,
			height: size,
			data: new Uint8Array(size * size * 4),
			// get rendering context for the map canvas when layer is added to the map
			onAdd: function onAdd() {
				var canvas = document.createElement('canvas');
				canvas.width = this.width;
				canvas.height = this.height;
				this.context = canvas.getContext('2d');
			},
			// called once before every frame where the icon will be used
			render: function render() {
				var duration = 1000;
				var t = (performance.now() % duration) / duration;
				var radius = (size / 2) * 0.3;
				var outerRadius = (size / 2) * 0.7 * t + radius;
				var context = this.context;
				// draw outer circle
				context.clearRect(0, 0, this.width, this.height);
				context.beginPath();
				context.arc(
					this.width / 2,
					this.height / 2,
					outerRadius,
					0,
					Math.PI * 2
				);
				context.fillStyle = dotOuterColour + (1 - t) + ')';
				context.fill();
				// draw inner circle
				context.beginPath();
				context.arc(
					this.width / 2,
					this.height / 2,
					radius,
					0,
					Math.PI * 2
				);
				context.fillStyle = dotInnerColour + ' 1)';
				context.strokeStyle = 'white';
				context.lineWidth = 2 + 4 * (1 - t);
				context.fill();
				context.stroke();
				// update this image's data with data from the canvas
				this.data = context.getImageData(
					0,
					0,
					this.width,
					this.height
				).data;
				// continuously repaint the map, resulting in the smooth animation of the dot
				map.triggerRepaint();
				// return `true` to let the map know that the image was updated
				return true;
			}
		};
	}
	componentWillUnmount() {
		client.end();
	}
	render() {
		const img = {
			width: 50,
			height: 50,
			float: 'left',
			'marginRight': 10,
		}
		var time = this.state.inc.timeSent;
		var name = this.state.inc.name;
		var lat = this.state.inc.lastCoord[0];
		var long = this.state.inc.lastCoord[1];
		var incident = this.state.inc.isIncident;

		return (
			<div>
			<div className='infopane'>
			<img style={img} src='/helmetLogo.png' alt="Logo" />
			<h1>GuardianCycle Friend Locator</h1>
			<AlrtIncident time={time} name={name} lat={lat} long={long} incident={incident} />
			</div>
			<div className='sidebarStyle'>
			<div>Longitude: {this.state.lng} | Latitude: {this.state.lat} | Zoom: {this.state.zoom}</div>
			</div>
			<div ref={el => this.mapContainer = el} className='mapContainer' />
			</div>
		)
	}
}

export default Map;

