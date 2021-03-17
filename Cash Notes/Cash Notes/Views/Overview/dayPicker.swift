//
//  datePicker.swift
//  Cash Notes
//
//  Created by hanzheyu on 3/13/21.
//
// Day picker with GraphicalDatePickerStyle()

import SwiftUI

struct dayPicker: View {
    @Binding var showCalendar: Bool
    @Binding var savedDate: Date?
    @State var selectedDate: Date = Date()
    
    var body: some View {
        DatePicker("", selection: $selectedDate, displayedComponents: .date)
            .datePickerStyle(GraphicalDatePickerStyle())
        HStack {
            Spacer()
                .frame(width: 30)
            Button(action: {
                showCalendar = false
                }, label: {
                    Text("Cancel".uppercased())
                        .bold()
                })
            Spacer()
            Button(action: {
                savedDate = selectedDate
                showCalendar = false
            }, label: {
                Text("Save".uppercased())
                    .bold()
            })
            Spacer()
                .frame(width: 30)
        }
    }
}
