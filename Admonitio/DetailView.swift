//
//  DetailView.swift
//  Admonitio
//
//  Created by Parker Jackman on 3/23/24.
//

import SwiftUI

struct DetailView: View {
    let texts: DailyText
    
    var body: some View {
        List {
            Section(header: Text("Texts for day")) {
                NavigationLink(destination: MessageView(texts: texts)) {
                    Label("Generate Texts", systemImage: "text.bubble")
                        .font(.headline)
                        .foregroundColor(.accentColor)
                }
                
                HStack {
                    Label("Start Time", systemImage: "clock")
                    Spacer()
                    Text("\(texts.startTime ?? "7:00 PM")")
                }
                
                HStack {
                    Label("Theme", systemImage: "paintpalette")
                    Spacer()
                    Text(texts.theme.name)
                        .padding(4)
                        .foregroundColor(texts.theme.accentColor)
                        .background(texts.theme.mainColor)
                        .cornerRadius(4)
                }
            }
            
            Section(header: Text("Appointments")) {
                ForEach(texts.appointments) { appointment in
                    HStack {
                        Label(appointment.name, systemImage: "person")
                        Spacer()
                        Text(appointment.time)
                    }
                }
            }
        }
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(texts: DailyText.sampleData[0])
    }
}

