# Web application

A key component of GuardianCycle is a web application, which is comprised of two main deliverables:

- [friend-track-view](friend-track-view).  A web application that lets the cyclists share their current location with other people whilst they are tracking a ride.  This also features a login screen to ensure only authenticated parties have access.  This deliverable is at a higher level of maturity than emergency-services-view as will eventually form part of the GuardianCycle product.

- [emergency-services-view](emergency-services-view).  A web application to demonstrate the functionality of the device in alerting the emergency services should the cyclist have an incident (as detected by GuardianCycles gyro) during their ride.  Ultimately this deliverable is to demonstrate intent only - in reality emergency services are likely to consume GuardianCycle incident data via a feed rather than a web-application; therefore emergency-services-view has deliberately consumed less development time than friend-track-view.

Due to the iterative nature of this product this folder also contains code that was eventually no longer used:

- [guardian-cycle-login-react](guardian-cycle-login-react).  An early prototype of a login screen using the React framework.

- [route-view](route-view).  An early prototype of a web application for the cyclist to review previous routes, prior to moving this functionality to Processing.
