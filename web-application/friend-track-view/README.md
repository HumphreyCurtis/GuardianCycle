# GuardianCycle Emergency Services View

This component of the GuardianCycle application is intended to alert the Emergency Services to incidents it has created.

It is written using the React framework, is fed data from Hive MQ MQTT and uses mapbox for mapping services.

The live website can be viewed at:

[guardiancycle.preciouschicken.com](https://guardiancycle.preciouschicken.com)

Unfortunately due to a web-sockets issue the site does not display initially (you get a blank page) until you have allowed 'unsafe' elements - this is possible via an icon in the URL bar of the browser (tested on Vivaldi broswer, so others - Chrome / Firefox / Safari may vary).

to activate an incident use the HiveMQ broker using the topic `guardiancycle` and the following message:

```json
{
   "lastCoord":[
      -2.5906169414520264,
      51.45326480293432
   ],
   "name":"John Doe",
   "timeSent":"2020-03-04T18:25:43.511Z",
   "isIncident":true
}
```

## Installation

To run locally:

`npm install`

`npm start`

## Development

### mqtt.js

Installed using `npm install mqtt`.

The [mqtt.js](https://www.hivemq.com/blog/mqtt-client-library-mqtt-js/) library was used for the website client to capture MQTT messages.  I found the documentation for this so difficult I ended up creating my own: [A taste of MQTT in React](https://www.preciouschicken.com/blog/posts/a-taste-of-mqtt-in-react/).

### mapbox

They have an excellent tutorial on using mapbox in React: [Use Mapbox GL JS in a React app](https://docs.mapbox.com/help/tutorials/use-mapbox-gl-js-with-react/).

The animated icon was added using another good [tutorial](https://docs.mapbox.com/mapbox-gl-js/example/add-image-animated/).

### material-ui

Installed using `npm install @material-ui/lab`.

The alert component (e.g. red / green incident box) belongs to [material-ui](https://material-ui.com).

