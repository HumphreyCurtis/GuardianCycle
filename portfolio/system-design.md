## 1. System Design

### a. Architecture of the entire system

### b. Object-Oriented design of key sub-systems (e.g. Desktop Application, Web Application etc.)

From the outset GuardianCycle endeavoured to take an object-oriented approach to the integration of key systems.  That is the various components that made up the system as a whole were considered as separate entities which each had its own set of encapsulated data and methods.  Considerable attention was given to how those encapsulated entities interfaced with each other, with a set of standard communication templates enforced throughout the project.

This was all the more important given what was the ambition of the project - GuardianCycle strove to provide a whole suite of functionality to the user, across a number of different platforms; which meant that the team as a whole needed to understand how myriad parts interlocked.  Taking this strong object-oriented approach fostered this understanding.

Indeed sketching out a UML Use Case diagram for this system (under the early working title of CyberDome) showed the number of different stakeholders involved:

![UML Use Case Diagram](media/enduser.png)

The complexity of interactions between these functions was further explored in a UML Class diagram which extended standard UML by attempting to overlay stakeholders over encapsulated methods and data:

![UML Class Venn diagram](media/initialuml.png)

This early worked showed the necessity of deciding up front the interfaces between thse elements.  Therefore it was an early design decision to ensure that all data passing between entities would belong to one of two classes:

![Route and Update classes](media/route_update.png)

This ensured that all developers on the team understood exactly what data they could expect to send and receive from their individual components.

### c. Requirements of key sub-systems (in the form of selected user stories)

### d. The evolution of UI wireframes for key sub-systems

#### Paper Prototype – User Testing

<p align="center">
  <img src="https://github.com/HumphreyCurtis/GuardianCycle/blob/master/portfolio/media/paper-prototype-gif.gif?raw=true">
</p>
<p align="center">
  A sample section of the paper prototype video.
</p>

An early part of the process saw the development of a paper-prototype that was tested with several people. By using the paper prototype as a simulation for test users, this allowed us to quickly and efficiently test the key features of our design. 

Whilst the initial tester feedback was positive, in as much as the system was simple to use and understand, concerns were raised by one user who objected to having to provide email or other data that would enable them to be identified.

As a response, we agreed the finished product wo  This would enable the fundamental road safety element – that of indicator/break lights to still be used.  Unfortunately the GPS system required the website registration to be active, so the fall alert would not function in this user case.

Our user interface developed considerably from the initial paper prototype but retained some of the key features. The key features we retained include the journey analytics and the route viewer (albeit in a very different format).

The most notable difference is that the paper prototype was designed with a mobile application in mind (as evidenced by the phone screen background). However we later learned that the specification involved a web application, a desktop application and an interface on the M5 devices, which all required a significant re-think in terms of design. 

#### Desktop Application

The key purpose of the desktop application is to display the previous routes the user has taken. The secondary purpose is to display back to the user.

For the initial stages, the user interface was not a primary concern. Our main focus was ensuring the required functionality was attainable so initial wireframes simply involved one static map.

Once this was established, we merged this interface with the analytics function which would display the statistics for the displayed route.

<One of my grey shots>

We then decided we could be utilising the screen space more efficiently. Most notably, that we could fit multiple routes onto the page without it being overcrowded. At this stage, we experimented with a mulitude of different views to determine a best fit. This involved striking the right balance between displaying as much information as possible and the screen being too overcrowded. 

At the same time, we also wanted our design to be clear and intuitive so we kept the main features aligned and centralised. The font was also updated from the default font to a more modern font we felt was more in-line with our brand image. 

### e. Details of the communication protocols in use (including a rational for your choice)
The devices communicated with the website and desktop application by sending small JSON files (in text format) via MQTT and Mosquitto (for web communication).

I have included a simple diagram below to illustrate how the data is communicated between the devices to the website and desktop application:

<p align="center">
<img src="https://raw.githubusercontent.com/HumphreyCurtis/GuardianCycle/master/portfolio/media/Communication-Diagram.png" alt="Comms Diagram">
</p>

#### JSONs
We decided on using the JSON format as firstly, it could be sent in a simple text format and secondly, could contain key details our program required such as geo co-ordinates. The details of the JSON structures we utilised are explained in more detail [on our data communication page.](https://github.com/HumphreyCurtis/GuardianCycle/tree/master/data-communication)

#### Rational for using Mosquitto over MQTT
While implementing our website, we had difficulty integrating the functionality with MQTT. Specifically, there were issues whereby the browser would flag the site as being insecure and which could only be remedied by modifying the browser settings to allow insecure content. We realised this was not a reasonable expectation for most users so we decided to change the network protocol across to Mosquitto. 

### f. Details of the data persistence mechanisms in use (including a rational for your choice)

### g. Details of web technologies in use (including a rational for your choice)
