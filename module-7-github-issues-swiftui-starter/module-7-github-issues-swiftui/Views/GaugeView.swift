//
//  GaugeView.swift
//  module-7-github-issues-swiftui
//
//  Created by Yutong Sun on 2/20/24.
//

import SwiftUI

struct GaugeView: View {
    let totalIssueNumber = GitHubClient.shared.totalIssues
    let openIssueNumber = GitHubClient.shared.openIssues.count
    let closedIssueNumber = GitHubClient.shared.closedIssues.count
    var openPercentage: Double {
           totalIssueNumber > 0 ? Double(openIssueNumber) / Double(totalIssueNumber) : 0
       }
    

    let openColor = Gradient(colors: [Color("openIssueColor"), Color("closedIssueColor")])
    let closedColor = Gradient(colors: [Color("closedIssueColor"), Color("openIssueColor")])

    var body: some View {
        VStack {
                // 1
            Label("Open Issue", systemImage: "envelope.open")
                .foregroundColor(Color("openIssueColor"))
                .font(.system(.title, design: .rounded))
                .fontWeight(.bold)
            Gauge(value: Double(openIssueNumber), in: 0...Double(totalIssueNumber)) {
                
            } currentValueLabel: {
                Text(Double(openIssueNumber), format: .number)
                    .foregroundColor(Color("openIssueColor"))
                    .font(.system(.body, design: .rounded))
            } minimumValueLabel: {
                Text("0")
                    .foregroundColor(Color("openIssueColor"))
                    .font(.system(.body, design: .rounded))
            } maximumValueLabel: {
                Text(String(totalIssueNumber))
                    .foregroundColor(Color("openIssueColor"))
                    .font(.system(.body, design: .rounded))
            }
            .tint(openColor)
            .gaugeStyle(.accessoryCircular)
            
            Spacer()
            Label("Closed Issue", systemImage: "envelope")
                .foregroundColor(Color("closedIssueColor"))
                .font(.system(.title, design: .rounded))
                .fontWeight(.bold)
            Gauge(value: Double(closedIssueNumber), in: 0...Double(totalIssueNumber)) {
                
            } currentValueLabel: {
                Text(Double(closedIssueNumber), format: .number)
                    .foregroundColor(Color("closedIssueColor"))
                    .font(.system(.body, design: .rounded))
            } minimumValueLabel: {
                Text("0")
                    .foregroundColor(Color("closedIssueColor"))
                    .font(.system(.body, design: .rounded))
            } maximumValueLabel: {
                Text(String(totalIssueNumber))
                    .foregroundColor(Color("closedIssueColor"))
                    .font(.system(.body, design: .rounded))
            }
            .tint(closedColor)
            .gaugeStyle(.accessoryCircular)
            Spacer()
            Label("Open Issue", systemImage: "envelope")
                .foregroundColor(Color("openIssueColor"))
                .font(.system(.title, design: .rounded))
                .fontWeight(.bold)
            Gauge(value: Double(openIssueNumber), in: 0...Double(totalIssueNumber)) {
                
            } currentValueLabel: {
                Text(String(openPercentage*100) + "%")
                    .foregroundColor(Color("openIssueColor"))
                    .font(.system(.body, design: .rounded))
            }
            .tint(Color("openIssueColor"))
            .gaugeStyle(.accessoryCircularCapacity)
            Spacer()
            
            Label("Closed Issue", systemImage: "envelope")
                .foregroundColor(Color("closedIssueColor"))
                .font(.system(.title, design: .rounded))
                .fontWeight(.bold)
            Gauge(value: Double(closedIssueNumber), in: 0...Double(totalIssueNumber)) {
                
            } currentValueLabel: {
                Text(String((1 - openPercentage) * 100) + "%")
                    .foregroundColor(Color("closedIssueColor"))
                    .font(.system(.body, design: .rounded))
            }
            .tint(Color("closedIssueColor"))
            .gaugeStyle(.accessoryCircularCapacity)
            

        }
        
        
        
    }
}


#Preview {
    GaugeView()
}
