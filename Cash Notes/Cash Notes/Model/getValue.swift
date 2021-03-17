//
//  getValue.swift
//  Cash Notes
//
//  Created by hanzheyu on 3/15/21.
//
// Children views for fetchrequest with FetchedResults<Record> as a variable
// So that we could use selectedDate as a input in different views

import SwiftUI

struct getValue: View {
    @Environment(\.managedObjectContext) var moc
    @FetchRequest var dailyRecords: FetchedResults<Record>
    var body: some View {
        let daily = dailyRecords.map{$0.price}.reduce(0, +)
        Text("\(daily, specifier: "%.1f")")
    }
}

struct getBar: View {
    @Environment(\.managedObjectContext) var moc
    @FetchRequest var dailyRecords: FetchedResults<Record>
    var kind: String
    var body: some View {
        let daily = dailyRecords.map{$0.price}.reduce(0, +)
        HStack {
            if daily > 280 {
                Rectangle()
                    .fill(Color.blue)
                    .frame(width: CGFloat(280), height: 30)
            } else {
                Rectangle()
                    .fill(Color.blue)
                    .frame(width: CGFloat(daily), height: 30)
            }
            if kind == "earned" {
                Text("+ ") + Text("$\(daily, specifier: "%.1f")")
            }
            else {
                Text("- ") + Text("$\(daily, specifier: "%.1f")")
            }
            
                }
    }
}

