## 1. System Design

### a. Architecture of the entire system

### b. Object-Oriented design of key sub-systems (e.g. Desktop Application, Web Application etc.)

From the outset GuardianCycle endeavoured to take an object-oriented approach to the integration of key system.  That is the various components were considered as entities with encapsulated data and methods.  Consideration was given to how those encapsulated entities interfaced with each other, with a set of standard communication templates enforced throughout the project.

This was all the more important given what was the ambition of the project - GuardianCycle strove to provide a whole suite of functionality to the user, across a number of different platforms; which meant that the team as a whole needed to understand how myriad parts interlocked, which taking a strong object-oriented approach fostered.

Indeed sketching out the use cases for this system showed the number of different stakeholders involved:

![UML Use Case Diagram](media/enduser.png)

Therefore it was an early design decision to ensure that all data passing between entities would belong to one of two classes:

![Route and Update classes](media/route_update.png)

This ensured that all developers on the team understood exactly what data they could expect to send and receive from their individual components.


### c. Requirements of key sub-systems (in the form of selected user stories)

### d. The evolution of UI wireframes for key sub-systems

<p align="center">
  <img src="https://github.com/HumphreyCurtis/GuardianCycle/blob/master/portfolio/media/paper-prototype-gif.gif?raw=true">
</p>
<p align="center">
  A sample section of the paper prototype video.
</p>

### e. Details of the communication protocols in use (including a rational for your choice)
The devices communicated with the website and desktop application by sending small JSON files (in text format) via MQTT and Phoenix (for web communication).

I have included a simple diagram below to illustrate how the data is communicated between the devices to the website and desktop application:

<p align="center">
<img src="https://raw.githubusercontent.com/HumphreyCurtis/GuardianCycle/master/portfolio/media/Communication-Diagram.png" alt="Comms Diagram">
</p>

#### JSONs
We decided on using the JSON format as firstly, it could be sent in a simple text format and secondly, could contain key details our program required such as geo co-ordinates. The details of the JSON structures we utilised are explained in more detail [on our data communication page.](https://github.com/HumphreyCurtis/GuardianCycle/tree/master/data-communication)

#### Rational for using Phoenix over MQTT
While implementing our website, we had difficulty integrating the functionality with MQTT. Specifically, there were issues whereby the browser would flag the site as being insecure and which could only be remedied by modifying the browser settings to allow insecure content. We realised this was not a reasonable expectation for most users so we decided to change the network protocol across to Phoenix. 

### f. Details of the data persistence mechanisms in use (including a rational for your choice)

### g. Details of web technologies in use (including a rational for your choice)
