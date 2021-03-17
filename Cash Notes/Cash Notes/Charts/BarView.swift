//
//  LinePoints.swift
//  Cash Notes
//
//  Created by hanzheyu on 3/11/21.
//
// Various fetch requests with different predicate
// To generate the various bar view for bar charts

import Foundation
import SwiftUI

struct dailyEarnedBar: View {
    var day: Date = Date()
    var body: some View {
        HStack {
        getBar(dailyRecords:
        FetchRequest(
            entity: Record.entity(),
            sortDescriptors: [],
        predicate: NSCompoundPredicate(andPredicateWithSubpredicates: [NSPredicate(format: "type == %@", "Earned"), NSPredicate(format: "day == %@", day.displayDayFormat as CVarArg)])
        ), kind: "earned")
        }
    }
}

struct dailySpentBar: View {
    var day: Date = Date()
    var body: some View {
        HStack {
        getBar(dailyRecords:
        FetchRequest(
            entity: Record.entity(),
            sortDescriptors: [],
        predicate: NSCompoundPredicate(andPredicateWithSubpredicates: [NSPredicate(format: "type == %@", "Spent"), NSPredicate(format: "day == %@", day.displayDayFormat as CVarArg)])
            ), kind: "spent")
        }
    }
}

struct monthlyEarnedBar: View {
    var month: String
    var body: some View {
        HStack {
        getBar(dailyRecords:
        FetchRequest(
            entity: Record.entity(),
            sortDescriptors: [],
        predicate: NSCompoundPredicate(andPredicateWithSubpredicates: [NSPredicate(format: "type == %@", "Earned"), NSPredicate(format: "month == %@", month as CVarArg)])
        ), kind: "earned")
        }
    }
}

struct monthlySpentBar: View {
    var month: String
    var body: some View {
        HStack {
        getBar(dailyRecords:
        FetchRequest(
            entity: Record.entity(),
            sortDescriptors: [],
        predicate: NSCompoundPredicate(andPredicateWithSubpredicates: [NSPredicate(format: "type == %@", "Spent"), NSPredicate(format: "month == %@", month as CVarArg)])
            ), kind: "spent")
        }
    }
}

struct yearlyEarnedBar: View {
    var year: String
    var body: some View {
        HStack {
        getBar(dailyRecords:
        FetchRequest(
            entity: Record.entity(),
            sortDescriptors: [],
        predicate: NSCompoundPredicate(andPredicateWithSubpredicates: [NSPredicate(format: "type == %@", "Earned"), NSPredicate(format: "year == %@", year as CVarArg)])
        ), kind: "earned")
        }
    }
}

struct yearlySpentBar: View {
    var year: String
    var body: some View {
        HStack {
        getBar(dailyRecords:
        FetchRequest(
            entity: Record.entity(),
            sortDescriptors: [],
        predicate: NSCompoundPredicate(andPredicateWithSubpredicates: [NSPredicate(format: "type == %@", "Spent"), NSPredicate(format: "year == %@", year as CVarArg)])
            ), kind: "spent")
        }
    }
}


struct BarView_Previews: PreviewProvider {
    static var previews: some View {
        dailySpentBar(day: Date())
    }
}
