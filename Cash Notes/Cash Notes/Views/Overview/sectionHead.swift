//
//  sectionHead.swift
//  Cash Notes
//
//  Created by hanzheyu on 3/10/21.
//
// Section header for list view

import SwiftUI

struct sectionHead: View {
    var selectedDate: Date = Date()
    var body: some View {
        HStack {
            Text(selectedDate, style:.date)
        }
    }
}

struct sectionHead_Previews: PreviewProvider {
    static var previews: some View {
        sectionHead()
    }
}
