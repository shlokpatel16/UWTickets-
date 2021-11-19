Hello, to run our application, clone the repo in Xcode. To run the app:
1. if you do not have Homebrew installed on your machine, refer to https://brew.sh/ to install
2. If you do not have CocoaPods installed on your machine, open a new terminal, and refer to https://formulae.brew.sh/formula/cocoapods
3. after cocoapods is installed, navigate to the project directory for the cloned repository, and on the same level as 'Podfile' run 'pod install' to install the necessary dependencies
  NOTE: you may need to delete the following files from this level in the directory: Podfile.lock, the Pods folder, and Derived Data
4. after the installation is complete, open the UWTickets+.xcworkspace file, and run the application
