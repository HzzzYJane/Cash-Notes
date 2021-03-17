//
//  popContents.swift
//  Cash Notes
//
//  Created by hanzheyu on 3/15/21.
//
// popover view contents including icon and selected date 
import SwiftUI

struct popContents: View {
    var dateString: String
    var body: some View {
        HStack {
            Spacer()
                .frame(width: 20)
            Image(systemName: "calendar")
                .resizable()
                .frame(width: 18.0, height: 18.0)
            Text(dateString)
            Spacer()
        }
    }
}

struct popContents_Previews: PreviewProvider {
    static var previews: some View {
        popContents(dateString: Date().displayYearFormat)
    }
}
