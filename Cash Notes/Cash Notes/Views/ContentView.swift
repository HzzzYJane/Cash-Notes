//
//  ContentView.swift
//  Cash Notes
//
//  Created by hanzheyu on 3/9/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            overview()
                .tabItem {
                    Image(systemName: "list.bullet.below.rectangle")
                    Text("Overview")
                }
            barChart()
                .tabItem {
                    Image(systemName: "chart.bar")
                    Text("Charts")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
        
    }
}
