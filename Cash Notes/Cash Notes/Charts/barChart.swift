//
//  barChart.swift
//  Cash Notes
//
//  Created by hanzheyu on 3/12/21.
//
// Bar chart view with differen selection for the date;
// there are three different date picker in day, month, year format

import SwiftUI

struct barChart: View {
    @State private var pickerSelectedItem = 0
    @State var popoverSize = CGSize(width: 300, height: 270)
    @State var showPicker = false
    @State var chartsDate: Date? = Date()
    @State var monthDate: String? = Date().displayMonthFormat
    @State var yearDate: String? = "2021"
    
    var body: some View {
        
    NavigationView {
    VStack {
        Spacer()
            .frame(height: 30)
        Picker(selection: $pickerSelectedItem, label: Text("")) {
        
            Text("Daily").tag(0)
            Text("Monthly").tag(1)
            Text("Yearly").tag(2)
            }
            .pickerStyle(SegmentedPickerStyle())
            .padding(.horizontal, 8)
        
        Spacer()
            .frame(height: 30)
    
        if pickerSelectedItem == 0 {
            WithPopover(
                showPopover: $showPicker,
                popoverSize: popoverSize,
                content: {
                    Button(action: { self.showPicker.toggle() }) {
                        popContents(dateString: chartsDate!.displayDayFormat)
                    }
                },
                popoverContent: {
                    CalendarPicker(showCalendar: $showPicker, savedDate: $chartsDate)
                })
                .padding(.top)
            Spacer()
                .frame(height: 50)
            VStack(alignment: .leading, spacing: 30) {
                dailySpentBar(day: chartsDate ?? Date())
                dailyEarnedBar(day: chartsDate ?? Date())
            }
            
        } else if pickerSelectedItem == 1 {
            WithPopover(
                showPopover: $showPicker,
                popoverSize: popoverSize,
                content: {
                    Button(action: { self.showPicker.toggle() }) {
                        popContents(dateString: monthDate ?? Date().displayMonthFormat)
                    }
                },
                popoverContent: {
                    monthPicker(showCalendar: $showPicker, savedDate: $monthDate)
                })
                .padding(.top)
                Spacer()
                    .frame(height: 50)
                VStack(alignment: .leading, spacing: 30) {
                    monthlySpentBar(month: monthDate ?? Date().displayMonthFormat)
                    monthlyEarnedBar(month: monthDate ?? Date().displayMonthFormat)
                }
            
        } else  {
            WithPopover(
                showPopover: $showPicker,
                popoverSize: popoverSize,
                content: {
                    Button(action: { self.showPicker.toggle() }) {
                        popContents(dateString: yearDate ?? "2021")
                    }
                },
                popoverContent: {
                    yearPicker(showCalendar: $showPicker, savedDate: $yearDate)
                })
                .padding(.top)
                Spacer()
                    .frame(height: 50)
                VStack(alignment: .leading, spacing: 30) {
                    yearlySpentBar(year: yearDate ?? "2021")
                    yearlyEarnedBar(year: yearDate ?? "2021")
                }
        }
            Spacer()
           }
            .navigationBarTitle("Bar charts", displayMode: .inline)
            .background(Color(UIColor.systemGray6))
        }
    }

}

struct barChart_Previews: PreviewProvider {
    static var previews: some View {
        barChart()
    }
}
