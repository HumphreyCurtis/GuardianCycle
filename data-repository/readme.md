# Data repository

This folder is for code relating to how core business data is made persistent.  

Only one component of GuardianCycle currently stores data in a persistent form: the [desktop application](https://github.com/HumphreyCurtis/GuardianCycle/tree/master/desktop-application).  Any incoming JSON files are stored locally on the desktop running the application, using a random string of numbers as the file name, an example of which is [1.6313063.json](1.6313063.json).  On application start up any existing JSON files that were saved previously are read into memory and a route object is created for each file.

This flat-file solution is adequate to demonstrate functionality in a minimum viable product, but would not be suitable for a final product.  This would require an online data repository so that a user can access their data from different devices (including potentially mobile).  Likewise the other components, for instance [web application](https://github.com/HumphreyCurtis/GuardianCycle/tree/master/web-application), would also require some form of persistence to enable features such as user authentication and the storing of contacts users wish to share tracking location with.  The IoT device could also benefit from local persistent storage, again for setup purposes but also to potentially to ensure information is stored if unable to upload or batteries fail - in the final product this might be enabled with some form of SIM card. 

