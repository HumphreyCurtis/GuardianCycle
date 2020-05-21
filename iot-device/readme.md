# IoT device

A key component of GuardianCycle is the IoT device, which is comprised of three pieces of hardware the M5Stack, M5Stick and 5X5 RGB LED as well as agile development and testing for each component - these can be succinctly found in:

- [M5Stick development](m5-stick-prototype) - the M5 stick is designed to act as an interface which would trigger the alert on the concerned persons/emergency services view on our website.

- [M5Stack full prototype](m5-final-prototype) - a full prototype of the GuardianCycle product.
  
- [M5Stack user interface development](m5-UI-testing) - early prototyping of the eventual user interface.

- [RGB LED Testing](m5-LED-testing) - testing of the M5Stack and its ability to orient the RGB LED to display the performance of certain maneuvers by the cyclist: 
  * White flash warning light.
  * Red arrow left light.
  * Red arrow right light.  

## Step-by-step GuardianCycleStackUI

* Press to turn M5Stack on:

<p align="center" >
<img src=[./media/start-journey.jpg](https://github.com/HumphreyCurtis/GuardianCycle/blob/master/portfolio/media/start-journey.jpg)" alt="Start of journey" height=700>
</p>

* Home UI rendered:

<p align="center" >
<img src="./media/current-UI.jpg" alt="Current UI" height=700>
</p>
  
* Press button A and C to render indicators.

* Press button B for route log: 

<p align="center" >
<img src="media/route-log.jpg" alt="Route Log" height=700>
</p>
  
* Press and hold button B to end journey and send route data as encoded polyline:

<p align="center" >
<img src="media/journey-data-sent.jpg" alt="Send journey data" height=700>
</p>
  
* Press and hold button A to trigger emergency and send JSON data: 

<p align="center" >
<img src="media/emergency-data-sent.jpg" alt="Emergency data sent" height=700>
</p>

