//
//  yearPicker.swift
//  Cash Notes
//
//  Created by hanzheyu on 3/15/21.
//
// Year picker in form like 2021

import SwiftUI

struct yearPicker: View {
    @Binding var showCalendar: Bool
    @Binding var savedDate: String?
    @State var thisYear: String = "2021"
    
    var body: some View {
        Picker("", selection: $thisYear) {
                ForEach((2000...2040).map(String.init), id: \.self) { i in
                    Text(i)
                }
            }
            .pickerStyle(InlinePickerStyle())
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
                savedDate = thisYear
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
