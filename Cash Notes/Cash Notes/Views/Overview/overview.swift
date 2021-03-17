//
//  overview.swift
//  Cash Notes
//
//  Created by hanzheyu on 3/9/21.
// Overview to show within the tab view


import SwiftUI
import CoreData

struct overview: View {
    @Environment(\.managedObjectContext) var moc
    @State private var showingAddUser = false
    @State var selectedRecord: Record?
    @State var popoverSize = CGSize(width: 420, height: 400)
    @State var showCalendar = false
    @State var savedDate: Date? = Date()

    var body: some View {
        NavigationView {
            VStack {
                HStack()
                {
                    WithPopover(
                        showPopover: $showCalendar,
                        popoverSize: popoverSize,
                        content: {
                            Button(action: { self.showCalendar.toggle() }) {
                                HStack {
                                    Spacer()
                                    Image(systemName: "calendar")
                                        .resizable()
                                        .frame(width: 18.0, height: 18.0)
                                    VStack
                                    {
                                        Text(savedDate!.displayDayFormat)
                                    }
                                }
                            }
                        },
                        popoverContent: {
                            dayPicker(showCalendar: $showCalendar, savedDate: $savedDate)
                        })
                    
                    Divider()
                    VStack {
                        Text("Earned($)")
                            .font(.system(.headline))
                        dailyEarnedFetch(day: savedDate ?? Date())
                            .font(.system(.title))
                    }
                    .frame(maxWidth: .infinity)
                    Divider()
                    VStack {
                        Text("Spent($)")
                            .font(.system(.headline))                        
                        dailySpentFetch(day: savedDate ?? Date())
                            .font(.system(.title))
                    }
                    .frame(maxWidth: .infinity)
                }
                .frame(height: 50, alignment: .center)
                .padding(EdgeInsets(top: 20, leading: 0, bottom: 0, trailing: 0))
                
                List {
                    Section(header: sectionHead(selectedDate: savedDate ?? Date()))
                    {
                        dailyRecordsFetch(day: savedDate ?? Date())
                        
                    }
                }
                .listStyle(InsetGroupedListStyle())
                
                .navigationBarTitle("Overview", displayMode: .inline)
                .navigationBarItems(
                    trailing: Button(
                        action: {self.showingAddUser.toggle()})
                    {Image(systemName: "plus.circle")
                        .resizable()
                        .frame(width: 25.0, height: 25.0)
                    })
                
                .sheet(isPresented: $showingAddUser) {
                    addRecord().environment(\.managedObjectContext,
                                            self.moc)
                }
            }
        }
        }

    func saveContext() {
      do {
        try moc.save()
      } catch {
        print("Error saving managed object context: \(error)")
      }
    }
}



struct overview_Previews: PreviewProvider {
    static var previews: some View {
        overview()
    }
}
