//
//  module_7_github_issues_swiftuiApp.swift
//  module-7-github-issues-swiftui
//
//  Created by Andrew Binkowski on 2/22/22.
//

// (done)TODO: Add a solid color Launch Screen to the application. See the following resources: https://sarunw.com/posts/launch-screen-using-plist/ and https://developer.apple.com/documentation/xcode/specifying-your-apps-launch-screen

// (done)TODO: Add custom colors to the navigation bar and the tab icons for the open and closed states: red for open and green for closed.

// (done)TODO: Support 'Dark Mode' with custom colors. For "open" issues, light mode should use a red and it dark mode use a purple color. For "closed" issues, use a green for light mode and a yellow for dark modek. Use the Asset catalog to define the colors. Make sure that all UI elements follow this color scheme, including any icons.

// (done)TODO: Customize the font throughout the entire application to the use the `.rounded` design system font. Use a `.bold` weight for any titles. Make it look pretty.

import SwiftUI

@main

struct module_7_github_issues_swiftuiApp: App {

    private var sharedIssues = GitHubClient.shared

    var body: some Scene {
        
        WindowGroup {
            ContentView(gitHubIssues: GitHubClient.shared)
        }
    }
}
