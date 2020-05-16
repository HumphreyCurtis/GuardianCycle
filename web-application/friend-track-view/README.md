# GuardianCycle Friend Track View

This component of the GuardianCycle application is intended for users to allow friends and family to see their current location, once the cyclist has started tracking their ride.  Permission would be granted to friends and family within GuardianCycle settings, nominated friends and family would then receive an email link to an URL.  Following a sign on procedure completed in the browser they would then have access to the users current location.  

The users location would be updated at a set frequency (e.g. 1 min) and would be represented by a pulsing blue dot on the map.  It is intended that if an incident is detected the representation on the map would change (i.e. 'incident detected' and a pulsing red dot) - though this has not been implemented yet.

The cyclists location would be viewable on the website for the duration of their journey - e.g. between them starting and stopping the tracking function.  A cyclist could turn off tracking for friends or family at any time.

A demonstration of this functionality can be viewed at:

[friend-track-view.preciouschicken.now.sh](https://friend-track-view.preciouschicken.now.sh)

The user log in splash screen is for representative purposes only and will accept any values to achieve successful logon (though not null).

In the absence of an IoT device, data can be fed to friend-track-view online using 
the [HiveMQ broker](http://www.hivemq.com/demos/websocket-client/) and the following variables when connecting:

- host: test.mosquitto.org
- port: 8081

(NB - This is a change from the default host, which does not feature WSS (web sockets secure) and therefore failed to negotiate modern browsers https security)

then use the topic `guardiancycle` and the following message:

```json
{
   "lastCoord":[
      -2.5906169414520264,
      51.45326480293432
   ],
   "name":"John Doe",
   "timeSent":"2020-03-04T18:25:43.511Z",
   "isIncident":false
}
```

## Installation

Friend-track-view is written using the React framework, is fed data from Mosquitto MQTT and uses mapbox for mapping services.

To run locally:

`npm install`

`npm start`

## Development

### mqtt.js

Installed using `npm install mqtt`.

The [mqtt.js](https://www.hivemq.com/blog/mqtt-client-library-mqtt-js/) library was used for the website client to capture MQTT messages.  The documentation for this proved so difficult the GuardianCycle team ended up writing their own guide: [A taste of MQTT in React](https://www.preciouschicken.com/blog/posts/a-taste-of-mqtt-in-react/).

### mapbox

They have an excellent tutorial on using mapbox in React: [Use Mapbox GL JS in a React app](https://docs.mapbox.com/help/tutorials/use-mapbox-gl-js-with-react/).

The animated icon was added using another useful mapbox tutorial: [Add an animated icon to the map](https://docs.mapbox.com/mapbox-gl-js/example/add-image-animated/).

### material-ui

Installed using `npm install @material-ui/lab`.

The alert component (e.g. red / green incident box) belongs to [material-ui](https://material-ui.com).

