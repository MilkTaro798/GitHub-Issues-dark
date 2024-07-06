//
//  GithubIssueRow.swift
//  module-7-github-issues-swiftui
//
//  Created by Andrew Binkowski on 2/22/22.
//

import SwiftUI


struct GithubIssueRow: View {
    let issue: GitHubIssue
    
    var body: some View {
        HStack {
            Image(systemName: issue.state == "open" ? "envelope.open" : "envelope")
                .resizable()
                .frame(width: 40, height: 40)
                .foregroundColor(issue.state == "open" ? Color("openIssueColor") : Color("closedIssueColor"))
            Spacer()
            VStack (alignment: .leading)  {
                Text(issue.title ?? "")
                    .font(.system(.headline, design: .rounded))
                Text("@" + issue.user.login)
                    .font(.system(.body, design: .rounded))
            }
            .padding(.leading, 10)
        }
        .padding(10)
    }
}

#Preview {
    //(done)TODO: Update this preview to use the first open issue from a real network call instead of this mock data
//    let issue =  GitHubIssue(title: "title1",
//                             id: 1234,
//                             createdAt: "createdAt",
//                             body: "body",
//                             state: "closed",
//                             user: GitHubUser(login: "login",
//                                              avatarUrl: "https://avatars.githubusercontent.com/u/5821159?v=4"),
//                             htmlUrl: "ddddd")
    
    let issue = GitHubClient.shared.openIssues.first!
    return GithubIssueRow(issue: issue)
        .previewLayout(.fixed(width: 400, height: 80))
}

