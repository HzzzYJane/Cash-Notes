//
//  addRecord.swift
//  Cash Notes
//
//  Created by hanzheyu on 3/9/21.
//
// The present view of overview
// then user could add record to the core data and they can see it on the overview view

import SwiftUI

struct addRecord: View {
    @Environment(\.managedObjectContext) private var viewContext
    @Environment (\.presentationMode) var presentationMode
    
    @State private var recordTitle = ""
    @State private var recordAmount = ""
    @State private var recordDate: Date = Date()
    @State private var selectedType = 0
    @State private var isAlert = false
    private let kind = ["Earned", "Spent"]

    var body: some View {
        NavigationView {
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
                    TextField("Title", text: $recordTitle)
                        .font(.system(.subheadline))
                        .disableAutocorrection(true)
                }
                Section(header: Text("Amount")) {
                    TextField("Amount", text: $recordAmount)
                        .font(.system(.subheadline))
                        .padding([ .top, .bottom ], 8)
                }
               
                Section(header: Text("Date")) {
                    DatePicker("", selection: $recordDate, in: Calendar.dateClosedRange, displayedComponents: .date)
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
                    
                    let newRecord = Record(context: viewContext)
                    newRecord.date = self.recordDate
                    newRecord.price = Double(self.recordAmount)!
                    newRecord.title = self.recordTitle
                    newRecord.type = self.kind[selectedType]
                    newRecord.day = self.recordDate.displayDayFormat
                    newRecord.month = self.recordDate.displayMonthFormat
                    newRecord.year = self.recordDate.displayYearFormat
                    newRecord.id = UUID()
                    do {
                        try viewContext.save()
                        print("Record saved.")
                        presentationMode.wrappedValue.dismiss()
                    } catch {
                        print(error.localizedDescription)
                    }
                }) {
                    Text("Add Record")
                }
                .alert(isPresented: $isAlert) { () -> Alert in
                    Alert(title: Text("Alert"), message: Text("No text field should be empty"), dismissButton: .default(Text("Ok")))
                }
                    Spacer()
                }
            }
            .listStyle(GroupedListStyle())
            .navigationBarTitle("Add Record", displayMode: .inline)
            .navigationBarItems(trailing: cancelButton)
        }
    }
    
    private var cancelButton: some View {
        Button(action: {
            self.presentationMode.wrappedValue.dismiss()
        }) {
            Text("Cancel")
        }
    }
}

struct addRecord_Previews: PreviewProvider {
    static var previews: some View {
        addRecord()
    }
}
