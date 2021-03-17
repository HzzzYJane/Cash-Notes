//
//  recordsList.swift
//  Cash Notes
//
//  Created by hanzheyu on 3/15/21.
//

import SwiftUI

// Record list for Overview

struct recordsList: View {
    @Environment(\.managedObjectContext) var moc
    @FetchRequest var testRecords: FetchedResults<Record>
    var body: some View {
        ForEach(testRecords) {
            Record in
                NavigationLink(destination: EditView(selectedRecord: Record)) {
                HStack() {
                    Text(Record.title)
                    Spacer()
                    if Record.type == "Spent" {
                        Text("-\(Record.price, specifier: "%.1f")")
                    }
                    else {
                        Text("+\(Record.price, specifier: "%.1f")")
                    }
//                    Text("\(Record.price, specifier: "%.1f")")
                    }
                }
            }
            .onDelete(perform: deleteRecord(at:))
            .edgesIgnoringSafeArea(.all)
            if testRecords.count == 0 {
                Text("No user found")
            }
    }
    
    func deleteRecord(at offsets: IndexSet) {
        for index in offsets {
            let rs = testRecords[index]
            moc.delete(rs)
        }
        try? moc.save()
    }
}

