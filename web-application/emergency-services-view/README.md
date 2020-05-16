# GuardianCycle Emergency Services View

This component of the GuardianCycle application is intended for the emergency services to view incidents created by the device.  Once the cyclist has started tracking their ride should the device detect an incident (logged by the gyroscope) then relevant details (name, location, time) will be passed to the relevant emergency services.  The representative view shown is in a standard web browser, but ultimately it would be proposed that the data produced by GuardianCycle is fed directly into the systems used by emergency services control rooms.

A user has the option of turning this functionality on or off within GuardianCycle, and data is only sent to the emergency services if a fall is detected (i.e. not during usual activity).  The device will give the user 60 seconds to cancel an incident after detection before alerting the emergency services, and an incident can also be cancelled any time after that.  The incident can also be cleared by the emergency services (not implemented within current representation).


A demonstration of this functionality can be viewed at:

[emergency-services-view.preciouschicken.now.sh](https://emergency-services-view.preciouschicken.now.sh)

There is no user log in splash screen (as there is for friend-track-view) as this data is being sent to a secure intranet and is not intended to be viewable on the public web.

In the absence of an IoT device, data can be fed to emergency-services-view online using 
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

