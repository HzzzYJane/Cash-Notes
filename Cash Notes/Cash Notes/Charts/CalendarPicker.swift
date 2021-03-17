//
//  CalendarPicker.swift
//  Cash Notes
//
//  Created by hanzheyu on 3/13/21.
//
// Date picker in form like March 15, 2021 with style of WheelDatePickerStyle()

import SwiftUI

struct CalendarPicker: View {

    @Binding var showCalendar: Bool
    @Binding var savedDate: Date?
    @State var thisDay: Date = Date()
    
    var body: some View {
            DatePicker("", selection: $thisDay, displayedComponents: .date)
                .datePickerStyle(WheelDatePickerStyle())
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
                    savedDate = thisDay
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
