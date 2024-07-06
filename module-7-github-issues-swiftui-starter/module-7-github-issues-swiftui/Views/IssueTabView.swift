//
//  IssueTabView.swift
//  module-7-github-issues-swiftui
//
//  Created by Andrew Binkowski on 2/22/22.
//

import SwiftUI

// (done)TODO: Implement 'Pull to Refresh' behavior on the lists using `.refreshable`. This may require you to reconfigure the GithubClient.swift code.

struct IssueTabView: View {
    let state: String
    let issues: [GitHubIssue]
    
    var body: some View {
        NavigationStack {
            List (issues) { item in
                NavigationLink(value: item) {
                    GithubIssueRow(issue: item)
                }
            }
            .refreshable {
                await GitHubClient.shared.refreshData()
            }
            .navigationDestination(for: GitHubIssue.self) { item in
                IssueDetailView(issue: item)
            }
            .navigationBarTitle(state == "open" ? "Open Issues" : "Closed Issues")
            // (done)TODO: Customize the color of the `toolbarBackground` to match the state: red for open, green for closed
            .toolbarBackground(state == "open" ? Color("openIssueColor") : Color("closedIssueColor"), for: .navigationBar, .tabBar)
            .toolbarBackground(.visible, for: .navigationBar)
        }
    }
}

#Preview {
    let issues = GitHubClient.shared
    return IssueTabView(state: "open", issues: issues.openIssues)
}
