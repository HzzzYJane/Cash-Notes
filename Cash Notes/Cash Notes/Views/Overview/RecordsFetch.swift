//
//  diffFetch.swift
//  Cash Notes
//
//  Created by hanzheyu on 3/15/21.
//

// Fetch records for overview view with different Predicate

import SwiftUI

struct dailyEarnedFetch: View {
    var day: Date = Date()
    var body: some View {
        HStack {
        Text("+")
        getValue(dailyRecords:
        FetchRequest(
            entity: Record.entity(),
            sortDescriptors: [],
        predicate: NSCompoundPredicate(andPredicateWithSubpredicates: [NSPredicate(format: "type == %@", "Earned"), NSPredicate(format: "day == %@", day.displayDayFormat as CVarArg)])
            ))
        }
    }
}

struct dailySpentFetch: View {
    var day: Date = Date()
    var body: some View {
        HStack {
        Text("-")
        getValue(dailyRecords:
        FetchRequest(
            entity: Record.entity(),
            sortDescriptors: [],
        predicate: NSCompoundPredicate(andPredicateWithSubpredicates: [NSPredicate(format: "type == %@", "Spent"), NSPredicate(format: "day == %@", day.displayDayFormat as CVarArg)])
            ))
        }
    }
}

struct dailyRecordsFetch: View {
    var day: Date = Date()
    var body: some View {
        recordsList(testRecords: FetchRequest(
            entity: Record.entity(),
            sortDescriptors: [NSSortDescriptor(keyPath: \Record.date, ascending: true),],
            predicate: NSPredicate(format: "day == %@", day.displayDayFormat as CVarArg)
        ))
    }
}
