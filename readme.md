# GuardianCycle
<p align="center">
<img src="https://friend-track-view.preciouschicken.now.sh/helmetLogo.png" alt="GuardianCycle Logo" width="150" height="150">
</p>

<p align="center">
<strong style="font-family: 'Charm', cursive;">Protecting heads since 2020!</strong>
</p>

<p align="center">
<img src="/portfolio/media/Advert_1.jpg" alt="GuardianCycle Advert 1" height=400>
<img src="/portfolio/media/advert2.jpg" alt="GuardianCycle Advert 2" height=300>
<img src="/portfolio/media/advert3.jpg" alt="GuardianCycle Advert 3" height=300>
<p align="center">
  <i>
  Future marketing campaigns for the GuardianCycle operating throughout Bristol
  </i>
</p>



#### Team Members: 
Humphrey Curtis dr19500@bristol.ac.uk

J 'Gene' Hackman kq18265@bristol.ac.uk 

Alex Rycroft zw19555@bristol.ac.uk 

Evy Tang yt15896@bristol.ac.uk

Nathan Cubitt ka19493@bristol.ac.uk* (withdrawn from project for more see: [Nathan's departure](portfolio/project-evaluation.md/#nathans-departure))

# Introduction 


## Problem

Data collected by [cycling.org](https://www.cyclinguk.org/blog/road-casualties-2018-vital-statistics-cycle-campaigning) found that in 2018 alone, 17,550 cyclists in the UK suffered injuries on the roads, of which 99 incidents were of a serious nature. Furthermore, [Bristol alone](https://www.bristolpost.co.uk/news/bristol-news/bristol-among-top-five-most-1749111) is considered one of the top five most dangerous places to cycle in the UK. Despite cycling having tremendous benefits to [society](https://www.sustrans.org.uk/our-blog/get-active/2019/everyday-walking-and-cycling/the-benefits-of-cycling-for-children-and-families/), the [environmemt](https://biofriendlyplanet.com/green-alternatives/transportation/environmental-reasons-to-start-riding-your-bicycle-more/) and [cyclists themselves](https://www.betterhealth.vic.gov.au/health/healthyliving/cycling-health-benefits), there is huge gap in the market for products that use technology to make cycling safer. Furthermore during the 2019-20 Coronavirus pandemic, [increasing numbers](https://www.theguardian.com/lifeandstyle/2020/may/09/coronavirus-cycling-boom-makes-a-good-bike-hard-to-find) of people have taken to cycling as a safer, socially distanced means of getting around . The [UK Government has also encouraged it's citizens to cycle](https://www.independent.co.uk/environment/coronavirus-cycling-ebikes-cars-lockdown-uk-walking-air-pollution-leeds-university-a9521451.html) to work if possible so to safely reopen the UK economy, ease congestion on roads and avoid public transport and the transmision of COVID-19. Given this, there is an urgent need for more and better applications to make cycling accessible, more enjoyable and safer. In this spirit, IoT devices and applications must be developed to enhance and improve society.

## Vision

The GuardianCycle has be deliberately designed to meet this problem and offer all cycling users far more safety, accessibility and satisfication. Firstly, provide an adjustable LED indicator to provide optimum clarity of cycling maneuvers to fellow road users. Secondly, utilising GPS tracing - the GuardianCycle enables emergency services and friends or family the ability to trace cyclists on the road and provide immediate assistance for any emergencies or unintended problems. Thirdly, the GuardianCycle makes cycling more fun and interesting by offering users unparallelled accessibility to their cycling data - including calories burned and distance travelled - with the view to share this data, challenge friends and set new personal best goals!

GuardianCycle as a multimodal computer architecture offers so much more than just these initial benefits, which are thoroughly explored within the body of our report. Architecturally, GuardianCycle will operate efficiently across three key stakeholders (1) the cyclist via the IoT device, (2) friends or family via the desktop application (3) emergency services and family via the website. 

#### The IoT device and RGB LED hardware

The GuardianCycle IoT device is clearly prototyped using an M5Stack - it transmits GPS data in JSON files - both route data gathered or emergency notifications and renders an RGB LED matrix to perform manoeuvres. All operable through an easy and optimum user interface. 

#### Desktop application

A desktop application has been developed using Processing, to display GPS data sent from the IoT device. Routes are displayed as a line on a map, and helpful statistics are calculated about the route. 

#### Web application

To cater for two different sets of external stakeholders, two single page applications have been developed using the React framework. Friend-track-view endables the cyclist to share their location with friends and family. Additionally, the emergency-services-view immediately alerts the emergency services to incidents detected by GuardianCycle.

## Advantages

The Guardian Cycle offers a number of key benefits to society and across multiple stakeholders, which are presently unavailable to cyclists within the UK and across the world.

#### Safety 

In short, the GuardianCycle maximises road safety for cyclists as it will help minimise cycling fatalities and accident occurrence on and off road. Through GPS tracing the GuardianCycle can trigger immediate emergency assistance as well as enable friends or family to trace journeys. This benefits a vast array of potential cyclists from cyclists mountain biking solo in the hills to cyclists commuting to work on busy streets. Furthermore, as cycling accidents are most common on the road, we have developed an LED indicator system to clearly notify manoeuvres to fellow road users.

#### Accessible cycling data 

The desktop application explores achievements made by the cyclist day-to-day - dramatically improving their cycling experience. In particular, GuardianCycle data collected focuses on routes gathered, distance travelled and calories burned. Immeasurably improving the cycling experience and inspiring cyclists to get fitter and healthier via setting goals, personal bests and challenging friends. 

#### User focused interfaces

All three interfaces, the M5Stack, desktop application and website offer incredible accessibility to potential stakeholders. The three interfaces have been configured to be as clear and effective as possible. Thus providing a wholesome service for all cyclist users - from novice to veteran cyclists. As noted, within the user stories section GuardianCycle's interface and system even benefits non-cyclists. 

## Learning Experience

As first-year MSc Computer Science students at the University of Bristol, GuardianCycle presented a fantastic opportunity for the team to gain exposure and learn a number of key Software Engineering practices. Most notably: 
* Firstly, coming to grips with agile-software development. Including, utilising Git effectively and cooperating properly whilst developing software. 
* Secondly working under the demands of the multiple different subsystems, which meant entirely different programming practices from OOP development within Processing, website engineering in React to even C++ hardware development utilising an M5Stack and RGB LED matrix. This was coupled with even exposure to MQTT communication protocols to make the systems communicative. 
* Thirdly, the team had to learn to cope with mitigating utterly unforseen circumstances. Notably, the pressures of long-distance agile software-engineering during the global Coronavirus pandemic and the withdrawal of a key team-member. 


## Project outline

### [System design](portfolio/system-design.md)
### [System implementation](portfolio/system-implementation.md)
### [Project evaluation](portfolio/project-evaluation.md)


