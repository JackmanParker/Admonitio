//
//  ContentView.swift
//  Admonitio
//
//  Created by Parker Jackman on 3/23/24.
//

import SwiftUI

struct MessageView: View {
    let texts: DailyText
    
    var body: some View {
        List {
            Section(header: Text("Appointments")) {
                ForEach(texts.appointments) { appointment in
                    HStack {
                        Label(appointment.name, systemImage: "person")
                        Spacer()
                        Text(appointment.time)
                    }
                    Text("Hi \(appointment.name) This is the ward executive secretary Parker, I just wanted to remind you about your appointment with Bishop at \(appointment.time). ")
                }
            }
        }
    }
}

    struct MeetingView_Previews: PreviewProvider {
        static var previews: some View {
            MessageView(texts: DailyText.sampleData[0])
        }
    }
