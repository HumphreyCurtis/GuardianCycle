
## 2. System Implementation
### Contents
- [a. Breakdown of project into sprints](#a-breakdown-of-project-into-sprints-showing-the-users-stories-implemented-in-each)
- [b. Details of how you evaluated your designs](#b-details-of-how-you-evaluated-your-designs-techniques-used--awareness-of-their-limitations)
- [c. Discussion of Social and Ethical implications of the work](#c-discussion-of-social-and-ethical-implications-of-the-work)

### a. Breakdown of project into sprints (showing the users stories implemented in each).
The development was split into four main sprints. The starts and end times of these sprints align with meetings to discuss how the project was going and what needed to be completed in the next sprint. Most assigned tasks were added to the project Kanban board, although some major tasks are missing on the board. For each sprint we will describe the corresponding tasks on the Kanban board and any other relevant tasks that were completed. 
<p align="center">
<img src="media/Gantt.png" alt="Gantt chart of sprints">
</p>
<p align="center">
  <i>
  Figure ?. Gantt chart of four main sprints.
  </i>
</p>

### Sprint 1 - Design and Research 24th Feb - 9th March
| Website | Desktop Application | IOT Device |
| ------------- | ------------- | ------------- |
| Decide web framework  | Write demo application for displaying routes | Research m5Stack functionality|
| Finalise gui design from paper prototype  |  Use flat files on disc to test basic functionality  | Create demo application - simple gui with group name |

This sprint was about researching the technology stack we wanted to use for development. In this sprint we decided how to split up the work amongst the team members, a lot of time in this sprint was spent getting familiar with the technology they would be using.  

We had a misunderstanding at this point and started developing the desktop application in p5JS, a web framework. Even though this demo was not used in the final product it was still a useful exercise to start designing a GUI for the desktop app. We decided to use React for the web application as it is a very widely used framework and it's easy to get support online. We weren't sure exactly what functionality the m5Stack would have, so in this sprint we researched what role it could possibly play in the product. Our early ideas included using the gyroscope on the device to detect a fall and detecting pollution using an add-on for the stack. 

This sprint focussed on all the user stories we hoped to implement. As this was mainly a design stage, thought went into how the GUI of the system could help support the user stories. 

### Sprint 2 - Basic Implementation 16th March - 30th March
| Website  | Desktop Application | IOT Device |
| ------------- | ------------- | ------------- |
| Developing Emergency Services View | Change from p5js to processing application| Decide m5Stack functionality in the produce - sending JSON coordinates and to trigger lights|
| Integrate HiveMQTT connection | Average speed calculator for journey information  | M5 Stack user interface prototype developed  |
| Display incident information| Calculating distance from JSON co-ordinates | Get M5 stack working on home wifi |
|| Write Calories burned function  ||

In this sprint we changed from using p5JS to Processing for the desktop application, this slowed down development as the new framework had to be learnt and most of the code was not compatible. It wasn't clear at this point how the route information was going to be displayed as there are no mapping libraries available in Processing, but we decided to continue development and in the worst case scenario only use the information from the m5Stack and not display a route map. At the same time the necessary functions for calculating average speed, calories burnt and distance calculation were written in Javascript, these functions were transferred to processing later. Most of the website functionality was completed in this sprint and few changes were made after this point. At this point the emergency services view could receive an incident JSON file from HiveMQTT and display where an indident occured, with information about the person who triggered the incident and at what time it occured. At this time we decided that the m5Stack would be used to trigger a system of lights on the bike helmet, and send a JSON route object once a route had been completed. We could have used a phone instead of the m5Stack to record and send the routes, but we decided that as the stack had to stay with the bike to trigger the lights, it made sense for it to also record and send this information.

We focussed on users stories 1 and 2 in this sprint. These stories are the keen cyclist and the health conscious cyclist. The important elements in these user stories is getting the right information to them about their rides. JS functions were written in this time to calculate calories, average speed and distance from the coordinate and time information. This sprint added functionality for user story 3, as the website is used anytime there is an accident, to display the last known coordinates of the rider.

### Sprint 3 - All implementation completed 6th April - 20th Apil
| Website  | Desktop Application | IOT Device |
| ------------- | ------------- | ------------- |
| Create next-of-kin-view | Convert functions from Javascript to Processing (and merge together) | Integrate M5 Stack user interface with LED and RGB matrix |
|Investigate WebSocket bug within Emergency Services View - Corrected via use of Mosquitto| Integrate google maps static API to display route information | Build test circuit for M5, test circuit with Arduino code|

At this point in the project we had a fully functional system, any further work was to make small changes to user experience such as GUI improvements. For the website a second page was made, called next-of-kin view. This is similar to the emergency services view but is designed for use by a relative or friend to check where the rider is. During this sprint the website had an issue with cross-site scripting while using hiveMQTT, this was solved by using the Mosquitto platform instead. The desktop application was mostly completed by the end of this sprint, with all functions written in javascript converted to processing and routes being displayed with the google maps static api. The m5Stack could trigger LED lights using buttons on the stack after this sprint.

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

The GuardianCycle Project followed the BCS Code of Conduct to ensure the development of good principled software. As such, below we will discuss how the prototype of GuardianCycle was designed with Public Interest in mind, adheres to Professional Competence and Integrity and developed with due diligence to our Relevant Authority and to the IT Profession. 

### Public Interest 

The product was in fact designed with public safety at the forefront of our thinking, most specifically the safety of cyclists. The product is a cycle helmet and so we had to ensure the helmet still performed its primary protective function for the cyclist's head. Incorporated into the helmet for the proposed prototype were light fittings to indicate either a left or right turn signal and an impact detector in the event of a road collision. Upon impact, this sensor would be triggered and in turn send an alert to the designated next of kin as well as emergency services unless the user indicates through the app that they do not require help. In terms of public health, this product sought to add assurance to cyclists on the road should they be involved in a collision. 

The product is accessible to anyone with a bicycle and a smartphone, so it can be accessed by a large proportion of the target audience, whether that be city commuters or long distance cycling enthusiasts. This product is not designed to replace the need for cyclists to indicate their direction or to use bike lights and other safety equipment and practices. This product is only supposed to be an additional safety measure within the geographical areas that their app is registered in. We have considered the impact of our product on disabled cyclists. Many disabled people are capable cyclists so our product may help cyclists with mobility issues, less able to indicate with their arms, to feel more confident and safe on the roads. The location tracking and emergency services feature may be reassuring to all users of our product, but we feel that these features will bring additional comfort to users who may otherwise have additional stresses when cycling. Disabled people have felt as if cycling and the products associated with it often overlook them and therefore we not only want to address the need for inclusive cycling, but to also help disabled cyclists in their efforts to [‘put in place the building blocks for a more inclusive cycling culture’.](https://wheelsforwellbeing.org.uk/campaigning/guide/)

The product collects location data, usernames, email, and contact information for the user and next of kin. However, the device only collects GPS data when it is being actively used which the user has full control over. This product will not track data without the user’s permission via the app. (Need to include gaps in security of prototype and potential for data to be accessed by third parties without permission of the user - I am not totally familiar with the extent to which our project encrypts and stores data in a secure database/ if it does this at all.

### Professional Competence and Integrity:

Throughout the development of this product, we have been aware that as students we are not experts, fully capable of taking a product such as this to market. At each stage of this project our group have collaborated and shared alternative viewpoints in a respectful manner whilst encouraging productive and honest critique to further the development of this project. We have always aimed to do our best to maintain good practice, and as the project has gone on social and ethical implications related to the work have arisen. For example, at the beginning of the project our initial idea to include an emergency message was targeted at a ‘loved one’. However, as we began developing it became clear that not all cyclists may have a ‘loved one’ to include in their use of the product. Therefore, we decided to change ‘loved one’ to ‘next of kin’ so as to not ostracise cyclists who do not consider anyone in their lives a ‘loved one’. This feature would really connect with some users, but we realised early on that it was not an inclusive enough term for the range of users who may want flatmates, friends, family as their emergency contact. Our revised decision took inspiration from Apple’s [‘Find my Friends’](https://en.wikipedia.org/wiki/Find_My_Friends) feature through which shares users’ location with specified trusted contacts, and this seemed more inclusive and less likely to cause offence to any potential users. Potential ethical issues that arose from including this feature were that a more neutral phrasing would make the product more inclusive for everyone, and we reflected and acted swiftly to address this issue.

### Social Implications 

A key potential feature that has not yet been implemented was the triggering of an automatic notification to local emergency services when a collision took place. The ethical implications of this feature were discussed, and we realised that it would require rigorous testing to ensure the reliability of the collision detector on the M5 stack. This is significant as we determined that the possibility of unnecessary alerts being sent to emergency services was too high given the crucial, often time-sensitive nature of their work. Responsibility for emergency responders being called falls on the developers of the product which is a huge ethical issue and something to which we would need to dedicate more time and resources to solve. The idea itself was ambitious, but it would take the input of emergency services and their understanding of their field to ensure this feature did more good than harm to product users and the healthcare system. 

### Reflective Summary

Our team was succesful in implementing the Guardian Cycle system. We developed a system designed to improve public safety, and there is clear scope for either expanding the existing code, or developing a new system with the same functionality to create a marketable product. Through regular meetings and by effectively splitting up the work amoung team members, we completed the project with time to spare. The project was split into four main sprints, this focussed the team to complete the most important parts of the system first, then refine the system later. Although we didn't use a strictly agile approach, we did implement some elements of agile to help us complete the project on time, and with minimal problems during development. We could have done more unit testing but we did consistently check each others work and test the entire system through implementation testing. 
