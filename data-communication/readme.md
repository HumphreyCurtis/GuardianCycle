# Data communication

This folder is for code relating to how  application data moves between components of the system (e.g. web to desktop / IoT device to web / IoT to desktop).

All data moving between components in the system is structured in one of two ways:

- [update.json](update.json).  This JSON template is used for data in transit from the [iot-device](https://github.com/HumphreyCurtis/GuardianCycle/tree/master/iot-device) to the [web-application](https://github.com/HumphreyCurtis/GuardianCycle/tree/master/web-application).  It contains the name of the cyclist, their last position (lat / long), the time they were at that position and whether an incident (e.g. a fall) has been detected by the iot-device gyroscope.  This is intended to be used either by the [emergency-services-view](https://github.com/HumphreyCurtis/GuardianCycle/tree/master/web-application/emergency-services-view) to inform the emergency services of locations of accidents, or in [friend-track-view](https://github.com/HumphreyCurtis/GuardianCycle/tree/master/web-application/friend-track-view) to inform contacts of the current location of the cyclist (where that data has been shared by the cyclist)

- [route.geojson](route.geojson).  GeoJSON is a "geospatial data interchange format based on JSON" (see [IETF RFC 7946](https://tools.ietf.org/html/rfc7946)) and is used for data in transit from the [iot-device](https://github.com/HumphreyCurtis/GuardianCycle/tree/master/iot-device) to the [desktop-application](https://github.com/HumphreyCurtis/GuardianCycle/tree/master/desktop-application).  It contains the total duration of a route taken (from when the cyclist starts tracking to when the cyclist stops tracking) and co-ordinates taken at a predefined frequency.  This is intended to be used by the cyclist to review routes taken.

Both templates are development versions only to demonstrate functionality.  In reality for instance both templates would likely include a unique value (e.g. serial number) to identify the device, likewise consideration would have to be given as to whether the user's name would be revealed in plain text format.
