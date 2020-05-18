
## 2. System Implementation

### a. Breakdown of project into sprints (showing the users stories implemented in each).
The development was split into four main sprints. The starts and end times for these sprints align with meetings that were held to discuss how the project was going and what needed to be completed in the next sprint. Most assigned tasks were added to the project Kanban board, although some major tasks are missing on the board. For each sprint we will describe the corresponding tasks on the Kanban board for each element of the project and any other relevant tasks that were completed. 
### Sprint 1 - Design and Research 24th Feb - 9th March
| Website | Desktop Application | IOT Device |
| ------------- | ------------- | ------------- |
| Decide web framework  | Write demo application for displaying routes | Research m5Stack functionality|
| Finalise gui design from paper prototype  |  Use flat files on disc to test basic functionality  | Create demo application - simple gui with group name |

Overall this sprint was about researching the technology stack we wanted to use for development. In this sprint we decided how to split up the work amongst the team members and a lot of the work completed involved members of team just getting familiar with the technology they would be using.  

We had a misunderstanding at this point and started developing the desktop application in p5JS, a web framework. Even though this demo was not used in the final product it was still a useful exercise to start designing a GUI for the desktop app. We decided to use React for the web application as it is a very widely used framework and it's easy to get support online. We weren't sure exactly what functionality the m5Stack would have so in this sprint we researched what role it could possibly play in the product. Our early ideas included using the gyroscope on the device to detect a fall and detecting pollution using an add-on for the stack. 

This sprint focussed on all the user stories we hoped to implement. As this was mainly a design stage, thought went into how the GUI of the system could help support the user stories. 

### Sprint 2 - Basic Implementation 16th March - 30th March
| Website  | Desktop Application | IOT Device |
| ------------- | ------------- | ------------- |
| Developing Emergency Services View | Change from p5js to processing application| Decide m5Stack functionality in the produce - sending JSON coordinates and to trigger lights|
| Integrate HiveMQTT connection | Average speed calculator for journey information  | M5 Stack user interface prototype developed  |
| Display incident information| Calculating distance from JSON co-ordinates | Get M5 stack working on home wifi |
|| Write Calories burned function  ||

In this sprint we changed from using p5JS to Processing for the desktop application, this slowed down development as the new framework had to be learnt and most of the code is not compatible. It wasn't clear at this point how the route information was going to be displayed as there are no available mapping libraries in Processing, but we decided to continue development and in the worst case scenario only use the information from the m5Stack and not display a route map. At the same time the necessary functions for calculating average speed, calories burnt and distance calculation were written in javascript, these functions were transferred to processing later. Most of the website functionality was completed in this sprint and few changes were made after this point. At this time we decided that the m5Stack would be used to trigger a system of lights on the bike helmet, and send a JSON route object once a route had been completed. We could have used a phone instead of the m5Stack to record and send the routes, but we decided that as the stack had to stay with the bike to trigger the lights, it made sense for it to also record and send this information.

We focussed on users stories 1 and 2 in this sprint. These stories are the keen cyclist and the weight watcher cyclist. The important elements in these user stories is getting the right information to them about their rides. JS functions were written in this time to calculate calories, average speed and distance from the coordinate and time information. This sprint added functionality for user story 3, as the website is used anytime there is an accident, to display the last known coordinates of the rider.

### Sprint 3 - All implementation completed 6th April - 20th Apil
| Website  | Desktop Application | IOT Device |
| ------------- | ------------- | ------------- |
| Create next-of-kin-view | Convert functions from Javascript to Processing (and merge together) | Integrate M5 Stack user interface with LED and RGB matrix |
|Investigate WebSocket bug within Emergency Services View - Corrected via use of Mosquitto| Integrate google maps static API to display route information | Build test circuit for M5, test circuit with Arduino code|

At this point in the project we had a fully functional system, any further work on the systems was to make small changes to user experience and to make GUI improvements. For the website a second page was made, called next-of-kin view. This is similar to the emergency services view but is designed for use by a relative or friend to check where the rider is. During this sprint the website had an issue with cross-site scripting while using hiveMQTT, this was solved by using Mosquitto instead. The desktop application was mostly completed by the end of this sprint, with all functions written in javascript converted to processing and routes being displayed with the google maps static api. The m5Stack could trigger LED lights using buttons on the stack after this sprint.

This sprint implemented functionality for user story 4, the concerned next of kin. At this stage in development we implemented a next-of-kin view in the website application, which can be used to track the location of a friends or relative while they are cycling. We also wrote code to control the LED lights for the M5Stack, this helped fulfil user stories 1 and 2 i.e. people who ride regularly in a city environment.

### Sprint 4 - Finalise and Polish  27th April - 11th May
| Website  | Desktop Application | IOT Device |
| ------------- | ------------- | ------------- |
| Create login screen for website  | Implement loading and saving flat route information files | Write code for m5Stick to trigger distress signal |

The final sprint of the project mostly involved tidying up code and completing any last minute alterations to the systems. A login splash screen was designed for the website, there are no user accounts for the system so this was more of a GUI design exercise than a task which added functionality to the system. In the desktop application route files are now saved to the machine running the application, these are reloaded everytime the application is started. If development had continued past this point it would have been beneficial to send these to a web server, so they could be accessed on multiple devices and shared with friends and family. Code for the m5Stick was written at this point. This sent a JSON file to the next-of-kin/emergency services view website to trigger an alert if a fall had occurred. 

In this sprint user story 3 was completed, with code written for the m5Stick. This user wanted to feel safe while cycling alone in the mountains. This functionality allows them to call for help if they have an accident while cycling. The other user stories were also focussed on at this time to ensure that they were all fulfilled. 
### b. Details of how you evaluated your designs (techniques used & awareness of their limitations)
### Verification
### Unit Testing

Unit testing was conducted in an ad-hoc manner by individual developers. This was mostly to sanity check individual functions in the code. It was difficult to test the complete operation of the system as this would require each team member using M5Stack to send JSON messages to hiveMQTT. While the ad-hoc method of writing unit tests was fast and allowed developers to quickly prototype code, they were not complete enough to say for certain that the code runs without bugs. To ensure that the code was working properly, more unit tests should have been written by team members. Tests should have been written by team members not directly writing the code to spot any bugs or edge cases that cause problems that the main developers had not thought of.

### Integration Testing

At multiple times throughout the development process multiple parts of the system were tested together. For example, we tested the website and the desktop application while they were both running, by manually copying and pasting json coordinates into hiveMQTT. This found some bugs were the desktop application was trying to use JSON files that were meant for the website application. This was easily solved by adding a parsing function to check that the incoming JSON was for the desktop application and contained the necessary information. Towards the end of development we tested the entire system with the M5Stack and the M5stick, this was conducted over a video call. Although testing the integration manually doe not guarantee the system is free of bugs and works 100% of the time, it is the only way to check the integration of the entire system. These tests could be improved by running automatic scripts on the M5stack that can be triggered at any time to send multiple JSON files to the server.  

### Validation

### User stories

We wrote user stories at the start of the development process and continually checked that we were fulfilling them. They were also modified during development to align more closely with the type of product we wanted to make. 

### User Talk-throughs

In the initial design stages user talk-throughs were completed with other students in the class and the paper prototype version of our system. This was helpful for deciding which parts of the UI were unnecessary and what we needed to add to create a GUI that was intuitive and easy to use. User talk-throughs were conducted with members of the team who weren't directly involved in the development of a section of the project. For example, team members who were developing the M5Stack functionality were asked to try and use the website and desktop application while talking through their thought process. Other team members are not the ideal user for testing as they will have some idea about what the product does, this may influence how they use a user interface. We would have liked to run tests on users who had never seen the system before, but were unable to complete this due to the lockdown situation.

### What we could have done differently

Unit testing should have been centralised and more closely tied to the development process. It may have been helpful to write the unit tests before any development started, and agree on these as a team. This is difficult when it's not clear how the system will work, so this approach requires a well designed UML/Class diagram so everyone understands exactly what needs to be tested. The ad-hoc nature of unit testing means that bugs may still be present in the code.

It would have been beneficial to do a lot more testing with potential users of the system, especially formal writeups such as interviews and questionnares. It's not clear at the end of the project if this system is actually helpful or is wanted by anyone. To mitigate this problem we asked members of the group who cycle regularly what they would like from a system like this. Although this is not as effective as asking a large user base the same questions it does justify somewhat the final implementation of the system.

### c. Discussion of Social and Ethical implications of the work

