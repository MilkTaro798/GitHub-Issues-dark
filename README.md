# GitHub Issues

This iOS application allows users to view open and closed GitHub issues for an open source repository. It uses URLSession to fetch data from the GitHub REST API and displays the issues using SwiftUI.

## Author 

- Name: Yutong Sun
- Email: milktaro798@gmail.com


## Features

- Displays open and closed issues in a selected open source GitHub repository with at least 20 open issues
- Uses a tab view interface with "Overview", "Open", and "Closed" tabs to navigate between issue information and lists
- Fetches issue data asynchronously using URLSession and the GitHub REST API
- Parses JSON data into custom model structs using the Codable protocol
- Shows issue details including title, poster username and avatar, creation date, body, and open/closed state 
- Allows opening the issue on GitHub.com in Safari
- Supports pull-to-refresh to fetch updated issue data
- Customizes navigation bar and tab icon colors based on issue state (red/purple for open, green/yellow for closed) and adapts to light/dark mode
- Uses a circular gauge view to visually represent the proportion of open vs closed issues
- Implements a custom rounded bold font throughout the application


## Setup Instructions

1. Clone the repo 
2. Open the project in Xcode
3. Build and run the app on an iPhone simulator
4. Use the tab bar to switch between the overview, open issues, and closed issues
5. Tap on an issue in the list to view its details
6. Tap the Safari icon to open the issue on github.com
7. Pull down on the issues list to refresh the data

## Acknowledgements 

- GitHub REST API: https://docs.github.com/en/rest
- SwiftUI Gauge: https://sarunw.com/posts/swiftui-gauge/
- Launch Screen with Info.plist: https://sarunw.com/posts/launch-screen-using-plist/
- Apple Documentation on Launch Screens: https://developer.apple.com/documentation/xcode/specifying-your-apps-launch-screen


## Screenshots
Overview
![](https://github.com/MilkTaro798/GitHub-Issues-dark/blob/main/Simulator%20Screenshot-3.png) 
Open Issues List(Dark)
![](https://github.com/MilkTaro798/GitHub-Issues-dark/blob/main/Simulator%20Screenshot-2.png)
Closed Issues List(Dark)
![](https://github.com/MilkTaro798/GitHub-Issues-dark/blob/main/Simulator%20Screenshot-1.png)