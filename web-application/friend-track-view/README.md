# GuardianCycle Friend Track View

This component of the GuardianCycle application is intended for users to allow friends and family to see their current location (once they have started the application).

It is written using the React framework, is fed data from Mosquitto MQTT and uses mapbox for mapping services.

The live website can be viewed at:

[friend-track-view.preciouschicken.now.sh](https://friend-track-view.preciouschicken.now.sh)

The websockets issue originally present has been corrected by using a different broker, but this requires some configuration.

Ensure that the [HiveMQ broker](http://www.hivemq.com/demos/websocket-client/) has the following variables when connecting:

- host: test.mosquitto.org
- port: 8081

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

To run locally:

`npm install`

`npm start`

## Development

### mqtt.js

Installed using `npm install mqtt`.

The [mqtt.js](https://www.hivemq.com/blog/mqtt-client-library-mqtt-js/) library was used for the website client to capture MQTT messages.  I found the documentation for this so difficult I ended up creating my own: [A taste of MQTT in React](https://www.preciouschicken.com/blog/posts/a-taste-of-mqtt-in-react/) - now updated to solve websocket issue.

### mapbox

They have an excellent tutorial on using mapbox in React: [Use Mapbox GL JS in a React app](https://docs.mapbox.com/help/tutorials/use-mapbox-gl-js-with-react/).

The animated icon was added using another good [tutorial](https://docs.mapbox.com/mapbox-gl-js/example/add-image-animated/).

### material-ui

Installed using `npm install @material-ui/lab`.

The alert component (e.g. red / green incident box) belongs to [material-ui](https://material-ui.com).

