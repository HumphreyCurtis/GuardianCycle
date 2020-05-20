## 3. Project Evaluation
### Contents
-[a. Reflective discussion of the success of the project](#a-reflective-discussion-of-the-success-of-the-project)
-[b. Discussion of future work](#b-discussion-of-future-work-in-terms-of-design-development-and-evaluation)
-[c. Reflect on the working practices of your group](#c-reflect-on-the-working-practices-of-your-group-how-well-they-did-or-did-not-work-eg-management-of-issues-communication-agile-etc)
-[d. This is a chance to reflect on how coronavirus has affected your project ](#d-this-is-a-chance-to-reflect-on-how-coronavirus-has-affected-your-project-remote-working-practices-etc)
### a. Reflective discussion of the success of the project
This project has overall been a success and demonstrated a good proof of concept for an IOT bike safety system. The team worked well together to complete the project ahead of the deadline and continously improve the design and implementation of the system. Although the Covid-19 pandemic meant we were unable to fully test the system, we did implement functionality to partially complete all of our user stories. It is clear that our user stories could be fully completed by the system, if development was to continute after this proof of concept. 

The website fulfilled all relevant user stories in this project. No major changes would be required for it to be used in a final version of this project. The UI was an important focus for the website, and we feel that it is one of the best features of the website, it clearly shows the location of an accident. It's minimal design helps draw attention to the accident and makes it very easy to use. 

In the desktop application, a lot of care was taken to ensure that entries into the database would not be corrupt. Before adding any route JSONs to the database they are checked to contain all the necessary information. This allows easy modification to the database at a later stage. Although Processing files do not act like regular Java classes, the program is split up into logical files which allows easy reading and editing of code. This project structure could be improved however, to more closely fit software architecture standards such as the SOLID principles. 

The project would have benefited from more rigourous testing in all of it's subsystems, especially integration testing. Testing the full system has been difficult to arrange, as due to the coronavirus pandemic all testing has to take place on line. Unit testing could have played a more prominent role, especially in the early stages of development. Unit tests could have been written before coding even began, to ensure that each sub-system is free of bugs and is fully functional. 

The final system communicates between the website application and IOT device, and desktop application and IOT device. Between the website and IOT, very small packets of data are being sent, the JSON files only contain a few parameters for displaying the last know location. With the desktop application the JSON file could become very large, depending on the length of the route, as the system will keep adding coordinate points to the JSON file. To mitigate this issue we used polyline encoding to reduce the size of the coordinates, and transfer them from a JSONArray to an encoded string. 

There are some issues with the system that may not be possible to solve through adding and improving code, one issue is that IOT devices need to be connected to WiFi to operate in this system. For this project this severely limits the effectiveness of the system, especially for sending emergency signals. The IOT devices could be connected to a mobile phone to send data, but this means the IOT devices are redundant for sending an alert or GPS coordinates, as all their functionality could be implemented by the phone. Although, the IOT devices could still be used to trigger the LED lights. This issue could be solved by adding a SIM card to the M5Stack, allowing the device to always be connected to the internet. We also noticed that the battery life was quite short with the Stack, this would be frustrating for users. The only way to solve this might be to choose a new IOT device to use in this system.


### b. Discussion of future work (in terms of design, development and evaluation)

While we believe our project demonstates a strong case for proof of concept, there are areas of improvement and many wider considerations that need to be accounted for in the case this project progresses further.

#### Market Research
While some initial user testing did occur (with the paper prototype) this was minimal and the only testers were computer science students who may not be representative of the general population. Going forwards, conducting more detailed market research with potential user groups to determine the viabiltiy of our product. For example, this might involve focus groups or interviews with cyclists to determine how concerned they are with their safety and whether they would consider purchasing a device that might help them in that regard. This would also be a good opportunity to address any privacy concerns (as the device intends to utilise a GPS tracker).

In this regard, one key future consideration that we did not explore thoroughly is how the emergency services would utilise our website. During the inception phase, it was envisioned that either the ambulance dispatcher or a device within the ambulance itself would have the website running in order to track the incident. The feasability of this was purely speculative and in reality would have to involve a very thorough conversation with the emergency services.

A potential test would be to utilise the device for emergency services staff that were manning a cycling event. This would allow emergency services to test the device & website in a controlled environment to determine it’s suitability for more widespread use.

#### Improved User Customisation
We were keen to add further user customisation into our desktop application but did not have the time to implement this. For example, we envisioned the user having an account (or signing in using either their Gmail or Facebook) that would store all their routes and statistics. They could also view their overrall statistics (aggragated for every route stored). 

The function which calculates calories burned is intended to rely on user data which in our implementation is hardcoded. The ideal implementation of this would involve the user submitting this data upon account creation therefore ensuring the calculation is accurate for that particular user.

Another small feature would be for the user to display distances in Imperial units, rather than metric as certain users would feel more comfortable with this. While this was on the cards for some time, ultimately it was never actioned as it was not a key feature and there were more pressing design concerns (notably creating an optimal UI layout).

#### Implementing Social Networking Features
We discussed the long-term goal of introducing or integrating social networking features. This could involve the ability to upload routes to social media websites such as Facebook or cycling apps such as Strava. This could allow users to share routes with their friends or challenge each other, for example to complete a route in a faster time. Social networking elements could also be integrated within desktop application as well. For example, messaging between riders or leaderboards with who has burned the most calories in that particular month.

#### Hardware Improvements
If the project was to be viable, this would certainly require changes to the prescribed hardware. Paramount is the need for the device to function as a GPS tracker which could be done by adding an external component. This could also be potentially achieved by bluetooth pairing the stack with a mobile device. However, this would then require the user to keep their phone with them at all times during their journey.

While the M5 stick interface achieves it’s basic aims, we believe this could be improved by implementing further functionality. For example, a timer could be displayed after the alarm has been triggered to inform the user of how long they have been waiting for a response.

We had also planned to utilise the in-built gyroscope in some capacity but were not able to do so within the timescales. The idea was for the gyroscope to detect an impact that could have come from a crash or an accident which would then trigger the alert. We still believe this would be a useful feature to implement though further research may be required, in particular into what level to set the gyroscope at to trigger the alert.

### c. Reflect on the working practices of your group, how well they did or did not work, e.g, management of issues, communication, Agile (etc).

#### Agile

The [Agile](https://www.agilemanifesto.org/) software development methodology was chosen for this project.  This proved to have advantages and disadvantages.  The primary strength was Agile's emphasis on working software - we were trying to develop a minimum viable product rather than production ready artefacts which would include extensive testing, documentation, etc.  Consequently each group meet up was primarily orientated around discussion of features built or proposed and "showing the thing" (as defined by the [Government Digital Service](https://gdsengagement.blog.gov.uk/2016/11/04/what-we-mean-when-we-say-show-the-thing/)).  This kept the project focussed on development, rather than becoming too enmeshed in process or administration.

There were however downsides to this approach.  Frequently Agile (which in its purest form is more a statement of principles than a methodology) is used with a framework such as [Scrum](https://www.scrum.org) which brings with it concepts such as sprints and product owners.  These more fine-grained features were more difficult to successfully implement however.  For instance although we attempted to use sprints, whereby effort is focussed on building features within a defined period, followed by review and then selecting new features off the backlog, in practice this proved challenging.  Primarily as deadlines for other assignments could not be fully deconflicted with GuardianCycle sprints, and understandably these took precedence; meaning working on new features was often interrupted by other demands, which is contrary to the sprint ethos where feature development is the over-riding focus in that period.  Also the concept of a Product Owner, who acts as the voice of the business, was not realised.  This was partly due to the nature of the assignment where there was no 'business' and because the product we were building was genuinely a shared concept to which everyone contributed (in start-up terms the entire team were 'founders'). Therefore there was no sole voice who represented the decision maker for domain or business conflicts.  As team members tended, understandably, to be passionate about their elements of the design, it is likely this role would have been useful in prioritisation, and is recommended for future projects.

### d. This is a chance to reflect on how coronavirus has affected your project (remote working practices etc)
The unexpected coronavirus pandemic and subsequent lockdown had a significant effect on our working pratices. The most significant being the inability to engage in regular face-to-face meetings as we had before. We quickly adapted to this new environment however by instead engaging in regular teleconferences via Skype. We also extended our use of the messaging service Slack for communication and shared workspaces such as Google drive in order to track our progress.

