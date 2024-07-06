//
//  GithubClient.swift
//  module-7-github-issues-swiftui
//
//  Created by Andrew Binkowski on 2/22/22.
//

import Foundation

@Observable class GitHubClient {
    
    let url = "https://api.github.com/repos/apache/hadoop-ozone/issues?state=all"
    
    /// Store open issues from fetch
    var openIssues: [GitHubIssue] = []
    /// Store closed issues from fetch
    var closedIssues: [GitHubIssue] = []

    // (done)TODO: Create a property to determine the total number of issues (both open and closed). This will be useful for your custom gaauge.
    var totalIssues: Int {
            openIssues.count + closedIssues.count
        }
    // Singleton implementation
    static let shared = GitHubClient()

    //
    // MARK: - Initialization
    //
    fileprivate init() {
        // `Task` allows async task to run in initializer `init()` function
        Task {
            do {
                try await self.fetchIssues()
            } catch {
                print("Error", error)
            }
        }
    }
    func refreshData() async {
        do {
            try await self.fetchIssues()
        } catch {
            print("Error", error)
        }
    }
    
    
    //
    // MARK: - Networking
    //
    
    func fetchIssues() async throws {
        guard let url = URL(string: url) else {
            fatalError("Missing URL")
        }
        let urlRequest = URLRequest(url: url)
        let (data, response) = try await URLSession.shared.data(for: urlRequest)
        guard (response as? HTTPURLResponse)?.statusCode == 200 else { fatalError("Error while fetching data") }
        
        // Parse the JSON
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        var issues = try decoder.decode([GitHubIssue].self, from: data)
        
        issues = issues.map { issue -> GitHubIssue in
            var modifiedIssue = issue
            modifiedIssue.formattedDate = self.formatDate(date: issue.createdAt ?? "")
            return modifiedIssue
        }
        
        
        // Split issues and put into appropriate collections
        openIssues = issues.filter({ $0.state == "open" })
        closedIssues = issues.filter({ $0.state == "closed" })
    }
    
    func formatDate(date: String) -> String? {
        let dateFormatterGet = DateFormatter()
        dateFormatterGet.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        
        let dateFormatterPrint = DateFormatter()
        dateFormatterPrint.dateFormat = "MMM dd,yyyy"
        
        if let curdate = dateFormatterGet.date(from: date) {
            return dateFormatterPrint.string(from: curdate)
        } else {
            return nil
        }
    }
    
}

// (done)TODO: Refactor this code so that it is part of the GitHubClient class
func formatDate(date: String) -> String? {
    let dateFormatterGet = DateFormatter()
    dateFormatterGet.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
    
    let dateFormatterPrint = DateFormatter()
    dateFormatterPrint.dateFormat = "MMM dd,yyyy"
    
    if let curdate = dateFormatterGet.date(from: date) {
        return dateFormatterPrint.string(from: curdate)
    } else {
        return nil
    }
}

