//
//  ContentView.swift
//  module-7-github-issues-swiftui
//
//  Created by Andrew Binkowski on 2/22/22.
//

import SwiftUI

struct ContentView: View {
    
    var gitHubIssues: GitHubClient
    
    var body: some View {
        TabView {
            GaugeView()
                .tabItem {
                    Image(systemName: "gauge")
                    Text("Gauge")
                        .font(.system(.title, design: .rounded))
                        .fontWeight(.bold)
                        
                }
            IssueTabView(state: "open", issues: gitHubIssues.openIssues)
                .tabItem  {
                    // (done)TODO: Update the tab icons to appropriate images
                    Image(systemName: "envelope.open")
                    Text("OpenIssues")
                        .font(.system(.title, design: .rounded))
                        .fontWeight(.bold)
                }
            
            IssueTabView(state: "closed", issues: gitHubIssues.closedIssues)
                .tabItem  {
                    Image(systemName: "envelope")
                    Text("ClosedIssues")
                        .font(.system(.title, design: .rounded))
                        .fontWeight(.bold)
                }
            
            // (done)TODO: Add an additional tab (which should be the first to appear) that visually shows information about the issues (eg. open vs. closed, open perecent, etc.). Use a circular Gauge view to show the data. The gauge should occupy the entire screen. Check out this reference: https://sarunw.com/posts/swiftui-gauge/
        }
    }
    
}


#Preview {
    ContentView(gitHubIssues: GitHubClient.shared)
}

#Preview {
    ContentView(gitHubIssues: GitHubClient.shared)
        .environment(\.colorScheme, .dark)
}
