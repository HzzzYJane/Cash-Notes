//
//  EditView.swift
//  Cash Notes
//
//  Created by hanzheyu on 3/12/21.
//

// The Navigation link for each record
// then user could add record to the core data and they can see it on the overview view

import SwiftUI

struct EditView: View {
    @Environment(\.managedObjectContext) private var viewContext
    @Environment (\.presentationMode) var presentationMode
    
    @State var selectedRecord: Record
    @State private var recordTitle = ""
    @State private var recordAmount = ""
    @State private var recordDate: Date = Date()
    @State private var selectedType = 0
    @State private var isAlert = false
    private let kind = ["Earned", "Spent"]
    
    var body: some View {
            List {
                Section(header: Text("Type")) {
                    Picker(selection: $selectedType, label: Text("")) {
                        ForEach(0..<kind.count) {
                            Text(self.kind[$0])
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }
                Section(header: Text("Title")) {
                    TextField("\(selectedRecord.title)", text: $recordTitle)
                        .font(.system(.subheadline))
                        .disableAutocorrection(true)
                }
                Section(header: Text("Amount")) {
                    TextField("\(selectedRecord.price, specifier: "%.1f")", text: $recordAmount)
                        .font(.system(.subheadline))
                }
               
                Section(header: Text("Date")) {
                    DatePicker("\(selectedRecord.day)", selection: $recordDate, in: Calendar.dateClosedRange, displayedComponents: .date)
                        .transition(.opacity)
                        .labelsHidden()
                }
                HStack {
                    Spacer()
                    Button(action: {
                    if self.recordTitle == "" ||
                        self.recordAmount == "" {
                        self.isAlert = true
                        return
                    }
                    
                    selectedRecord.date = self.recordDate
                    selectedRecord.price = Double(self.recordAmount)!
                    selectedRecord.title = self.recordTitle
                    selectedRecord.type = self.kind[selectedType]
                    selectedRecord.day = self.recordDate.displayDayFormat
                    selectedRecord.month = self.recordDate.displayMonthFormat
                    selectedRecord.year = self.recordDate.displayYearFormat
                    do {
                        try viewContext.save()
                        print("Record saved.")
                        presentationMode.wrappedValue.dismiss()
                    } catch {
                        print(error.localizedDescription)
                    }
                }) {
                    Text("Done")
                }
                .alert(isPresented: $isAlert) { () -> Alert in
                    Alert(title: Text("Alert"), message: Text("No text field should be empty"),
                          dismissButton: .default(Text("Ok")))
                }
                    Spacer()
                
                }
            }
            .listStyle(GroupedListStyle())
        
    }
}
