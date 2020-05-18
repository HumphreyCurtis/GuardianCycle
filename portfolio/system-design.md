## 1. System Design

### a. Architecture of the entire system

### b. Object-Oriented design of key sub-systems

From the outset GuardianCycle endeavoured to take an object-oriented approach to the integration of key systems.  That is the various components that made up the system as a whole were considered as separate entities which each had its own set of encapsulated data and methods.  Considerable attention was given to how those encapsulated entities interfaced with each other, with a set of standard communication templates enforced throughout the project.

This was all the more important given what was the ambition of the project - GuardianCycle strove to provide a whole suite of functionality to the user, across a number of different platforms; which meant that the team as a whole needed to understand how myriad parts interlocked.  Taking this strong object-oriented approach fostered this understanding.

Indeed sketching out a UML use Case diagram for this system (under the early working title of CyberDome) showed the number of different stakeholders involved:

![UML Use Case Diagram](media/enduser.png)

The complexity of interactions between these functions was further explored in a UML class diagram which extended standard UML by attempting to overlay stakeholders over encapsulated methods and data:

![UML Class Venn diagram](media/initialuml.png)

This initial work proved the necessity of deciding up front the interfaces between these  elements.  Therefore it was an early design decision to ensure that all data passing between entities would belong to one of two classes, _Route_ or _Update_:

![Route and Update classes](media/route_update.png)

This ensured that all developers on the team understood exactly what data they could expect to send and receive from their individual components.  The components themselves however were also influenced by object oriented.

#### Desktop Application

The desktop application was written using Processing and a UML class diagram corresponding to the source code is below:

![Processing UML Class diagram](media/processing_class_uml.svg)

As illustrated the Processing code follows the object oriented design philosophy, with each class representing a modular functionality, using a form of Model-View-Controller design pattern.  In brief the _Gui_ class serves as the View - producing the various on screen elements (buttons, etc) and displaying data from the route to the user.  The Controller aspect is dually handled by _DataHandler_  and _MQTTHandler_ which is responsible for accepting input either from  the MQTT protocol or from the user and processing that accordingly.  Lastly the Model element is handled by _Calculator_, _Maps_ and _PolyLineEncoder_ which take the JSON data from the _Route_ class (referred to above) and runs it through algorithms to determine calories, distance covered, etc and correspondingly then place that data in geographical form (the _PolyLineEncoder_ acting to compress latitude / longitudinal data when sending over the lightweight MQTT network).

#### IoT Device

The minimum viable product devised by GuardianCycle has two components acting as IoT devices, as discussed previously: the MD5 Stick and the MD5 Stack.  Object-oriented design was again key here - primarily in ensuring that they interfaced with the rest of the system in a way that ensured encapsulation of data.  

The MD5 Stack performed a number of different functions, namely starting route tracking, stopping route tracking, uploading route data and activating the left/right/hazard helmet display.  An example of the hazard indicator during early construction is displayed:

![MD5Stack Indicator](media/MD5Stack_indicate.gif)

Both of these devices had far less complexity in their source code than the desktop application; so UML class diagrams have not been prepared.  However this UML activity diagram describes the flow of activity within the MD5 Stick:

![M5 Stick State Diagram](media/M5Stick-FSM-Updated.png)

As is illustrated the MD5 Stick can be used to alert the emergency services to an incident with two button presses - Arm and Alert; with positive confirmation needed to ensure the incident is raised, and an appropriate colour scheme (orange and red) to indicate escalation towards triggering the incident alert.  This is a secondary method for alarm activation - the primary one being the automatic fall detection present in the MD5 Stack gyroscope; however this has not been developed within the minimum viable product, instead the MD5 Stick is currently being used for demonstration purposes.

#### Web application

A UML class diagram of the friend-track-view web application shows object oriented design in work - although admittedly this was a more lightweight approach, being a relatively simple JavaScript React application, then the Java driven Processing desktop application: 

![UML Class Diagram for friend-track-view](media/ftv_uml.png)

Components _login_ and _map_ pages are logically separate; while within the _map_ component we have a number of discrete elements dedicated to serving different functions e.g. _alertIncident_, _removeMapLayer_, etc.  

#### Importance of object oriented design

The importance of the object oriented paradigm however is potentially easiest to understand when we look at the activities of all three key sub-systems working together in harmony, as illustrated in this UML activity state diagram, which visualises a number of functions of the finished product (with gyroscope enabled - currently on the development plan):

![Start to end UML Activity Diagram](media/whole_activity_uml.svg)

Within the diagram white represents the IoT device, yellow the web application and blue the desktop application.  Once the user starts tracking, the gyroscope immediately enters a loop whereby it looks for incidents.  If one is found then the user has an opportunity, using the MD5 Stick, to report a false-positive and reset the alarm; if the user does not cancel however then via MQTT an _update_ object is sent to both web applications (_emergency-services-view_ and _friend-track-view_ informing them of the incident) - this continues to loop as long as there is power in the device and the incident has not been cancelled.  If the gyroscope does not detect an incident then a location update is sent to _friend-track-view_ only on a periodic basis.  This continues until the user stops tracking at which point they have an option to upload their route data, again via MQTT, to the desktop application where it can be viewed in Processing.  

A rigorous separation of data between these elements by using defined interfaces, e.g. object oriented design, is therefore necessary to manage this system effectively and safely considering the importance that users will place in it.

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

<p align="center">
  <img src="https://github.com/HumphreyCurtis/GuardianCycle/blob/master/portfolio/media/final-ui-desktop.png?raw=true">
</p>
<p align="center">
  Image: Screenshot of final user interface.
</p>

Lastly, we realised we wanted to display more routes to the user and that the most practical way to do this was through the use of buttons to allow the user to scroll through a list of routes. By implementing this, the user could view an effectively unlimited number of routes by scrolling at their leisure.

#### Web Application
In order to create the paper prototype, time was spent comparing a variety of online mapping products - Google Maps, OpenStreetMaps, OS Maps and the What's App Share Location specifically.  Once a representative sample was obtained a prototype was mocked-up of what information the emergency services or a shared contact would wish to see.  A key requirement for this it was felt was a clean interface - neither user would wish to be presented with unnecessary or distracting information; the resulting prototype is shown below:

<p align="center">
  <img src="https://github.com/HumphreyCurtis/GuardianCycle/blob/master/portfolio/media/web-esv-prototype.jpg?raw=true">
</p>

The final version of our website maintained the key features of the paper prototype above. The user interface is minimalist with the key feature, the map, featuring prominently taking up the majority of the space on the page. This is in order to make the incident location as clear as possible for the user.

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
The only data persistence mechanism used in this system is flat file saving in the desktop application. This saves any incoming JSON files to the application computer as .JSON files, with a random string of numbers as the file name. When the application is loaded, the program looks through the data folder and reads every JSON file, creating a route object for each file. In a final application an online database would be used instead of flat files, so the information could be loaded by multiple devices. For this project it was enough to just save flat files as it mimicked the functionality of an online database well. A local database could have been created instead of saving flat files, but the files are fairly simple, only containing two columns for coordinates and time. Therefore it made sense to save it simply as a JSON file and not try and split the information up into tables. 

For the website and M5Stack parts of the system no data persistence was implemented. In a final version of the system it would make sense for both of these sections to have data persistence. Perhaps the website could save every incoming JSON in a similar way to the desktop application, for keeping records about any accidents that occur. In the m5Stack it might be a good design choice to automatically save the coordinate information while the device is recording a ride. If the device ran out of battery while it was tracking the ride, all information would be lost. This is not a huge drawback for the M5Stack part of the system however. In a final version the stack would include a sim card so it would be uploading the information to a server constantly, and would therefore not need to save the coordinate information on board.

### g. Details of web technologies in use (including a rational for your choice)
