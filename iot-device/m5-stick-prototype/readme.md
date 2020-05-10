# M5 Stick Prototype

We intended the M5 stick to be used as the interface which would trigger the alert on the concerned persons/emergency services view on our website.

The small size of the screen and the limited input methods on the M5 stick was very limiting and I realised any complicated user interface loaded onto the stick would likely not be properly visible to the user.

With this in mind, I created a minimalist user interface that consisted of colours to indicate the state of the device.

I have included a basic diagram of the interface functionality. The colours named refer to the background of the device.

<p align="center">
  <img src="https://raw.githubusercontent.com/HumphreyCurtis/GuardianCycle/master/iot-device/m5-stick-prototype/images/M5Stick-FSM.png" alt="centered"/>
</p>

## Alarm Triggered
When the alarm is triggered, a JSON containing the co-ordinates of the incident is sent out via MQTT. This data is then extracted by the web client in order to display the location to the end-user.


