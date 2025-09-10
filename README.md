# Flash-Assessment
This repository contains an iOS Assessment project for the Flash Group.

### Get Started

1. Clone the project to your local environment using terminal or any git client installed on your computer.
   - URL: https://github.com/Juliaan/BitTracker.git
     - Example: git clone https://github.com/Juliaan/BitTracker.git
> [!NOTE]
> Use the main branch.    

2. After cloning the repo, navigate to the location and open the BitTracker.xcodeproj with Xcode.
3. Ensure that you have selected the appropriate team under Signing and Capabilities
4. PrevPreverably the app on a device otherwise run the app in a Simulator
5. Ensure that your packages is refreshed because the app (project) should include the Firebase Swift Package.
  
### Project Summary

1. Language: Swift and SwiftUI
2. Architecture / Design pattern: MVVM
3. API: Calls are made to https://api.apilayer.com/fixer to retrieve data. Calls to apilayer require a apiKey which is stored in a Firebase Data Store.
4. URLSession is used, no 3rd-party frameworks.

### Final Note

Please email me at juliaan.evenwel@gmail.com to get access to the App via TestFlight!
