//
//  IssueDetailView.swift
//  module-7-github-issues-swiftui
//
//  Created by Andrew Binkowski on 2/22/22.
//

import SwiftUI

//(done)TODO: Add a Guage view so show the number of open vs. closed issues

struct IssueDetailView: View {
    let issue: GitHubIssue
    
    var body: some View {
        
        VStack (alignment: .leading) {
            Text(issue.title ?? "")
                .font(.system(.title, design: .rounded))
                .fontWeight(.bold)
            HStack {
                // (done)TODO: Implement the `AsyncImage()` function to download the user's avatar and display it promimantely on the screen. Make sure to include a placeholder image in case their is no image available.
                AsyncImage(url: URL(string: issue.user.avatarUrl ?? "")) { phase in
                    switch phase {
                        case .empty:
                            Image(systemName: "person.crop.circle.badge.questionmark")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 50, height: 50)
                                .padding(.trailing, 10)
                        case .success(let image):
                            image
                                .resizable()
                                .scaledToFit()
                                .frame(width: 50, height: 50)
                                .padding(.trailing, 10)
                        case .failure:
                            Image(systemName: "exclamationmark.icloud")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 50, height: 50)
                                .padding(.trailing, 10)
                        @unknown default:
                            EmptyView()
                    }
                }                
                Text("User: ")
                    .font(.system(.body, design: .rounded))
                Text("@" + issue.user.login)
                    .font(.system(.body, design: .rounded))
            }
            
            HStack {
                // (done)TODO: Add formatted date here
                Text("Date: ")
                    .font(.system(.title, design: .rounded))
                    .fontWeight(.bold)
                Text(issue.formattedDate!)
                    .font(.system(.body, design: .rounded))
                
                Image(systemName: issue.state == "open" ? "envelope.open" : "envelope")
                    .resizable()
                    .frame(width: 50, height: 50)
                    .foregroundColor(issue.state == "open" ? Color("openIssueColor") : Color("closedIssueColor"))
                    .padding(.bottom, 20)
            }
            
            Text("Description")
                .font(.system(.largeTitle, design: .rounded))
                .fontWeight(.bold)
            ScrollView {
                Text(issue.body!)
                    .font(.system(.body, design: .rounded))
            }
            
            
        }
        .padding(20)
        // (done)TODO: Add a .toolbar button that shows the safari icon to launch diretly to the issue in Safari
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing){
                if let url = URL(string: issue.htmlUrl), UIApplication.shared.canOpenURL(url) {
                    Link(destination: url) {
                        Image(systemName: "safari")
                    }
                }
            }
        }
    }
}

#Preview {
    let ghi = GitHubClient.shared.openIssues.first!
    return IssueDetailView(issue: ghi)
}

