//
//  monthPicker.swift
//  Cash Notes
//
//  Created by hanzheyu on 3/15/21.
//
// Month picker in form like March 2021

import SwiftUI

struct monthPicker: View {
    
    @Binding var showCalendar: Bool
    @Binding var savedDate: String?
    @State var monthIndex: Int = 0
    @State var yearIndex: Int = 0

    let months = ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"]
    let monthSymbols = Calendar.current.monthSymbols
    let years = Array(Date().year-10..<Date().year+10)
    
    var body: some View {
        GeometryReader{ geometry in
            VStack {
                HStack(spacing: 0) {
                    Picker(selection: self.$monthIndex.onChange(self.monthChanged), label: Text("")) {
                        ForEach(0..<self.monthSymbols.count) { index in
                            Text(self.monthSymbols[index])
                        }
                    }.frame(maxWidth: geometry.size.width / 2).clipped()
                    Picker(selection: self.$yearIndex.onChange(self.yearChanged), label: Text("")) {
                        ForEach(0..<self.years.count) { index in
                            Text(String(self.years[index]))
                        }
                    }.frame(maxWidth: geometry.size.width / 2).clipped()
                    }
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
                        savedDate = self.months[monthIndex] + " " + "\(years[yearIndex])"
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
        }
    
        func monthChanged(_ index: Int) {
            print("\(years[yearIndex]), \(index+1)")
            print("Month: \(monthSymbols[index])")
        }
    
        func yearChanged(_ index: Int) {
            print("\(years[index]), \(monthIndex+1)")
            print("Month: \(monthSymbols[monthIndex])")
        }
    
    }

extension Binding {
    func onChange(_ completion: @escaping (Value) -> Void) -> Binding<Value> {
        .init(get:{ self.wrappedValue }, set:{ self.wrappedValue = $0; completion($0) })
    }
}
    
