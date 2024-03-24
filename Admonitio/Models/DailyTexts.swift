//
//  DailyTexts.swift
//  Admonitio
//
//  Created by Parker Jackman on 3/23/24.
//

import Foundation

import Foundation

struct DailyText: Identifiable {
    let id: UUID
    var date: Date
    var appointments: [Appointment]
    var theme: Theme
    
    init(id: UUID = UUID(), date: Date, appointments: [Appointment], theme: Theme) {
        self.id = id
        self.date = date
        self.appointments = appointments.map {Appointment(name: $0.name, time: $0.time)}
        self.theme = theme
    }
    // Computed property to get the earliest appointment time
    var startTime: String? {
        return appointments.map { $0.time }.min()
        
        
    }
}
extension DailyText{
    struct Appointment: Identifiable {
        let id: UUID
        var name: String
        var time: String
        
        init(id: UUID = UUID(), name: String, time: String) {
            self.id = id
            self.name = name
            self.time = time
        }
    }
}

extension DailyText {
    static let sampleData: [DailyText] = {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        
        return [
            DailyText(date: dateFormatter.date(from: "2024-01-04") ?? Date(),
                      appointments: [Appointment(name: "Parker", time: "7:20 PM"), Appointment(name: "Emma", time: "7:40 PM"), Appointment(name: "Jacob", time: "6:00 PM")],
                      theme: .bubblegum),
            DailyText(date: dateFormatter.date(from: "2024-01-02") ?? Date(),
                      appointments: [Appointment(name: "Steve", time: "7:20 PM"), Appointment(name: "Meagan", time: "7:40 PM"), Appointment(name: "Phill", time: "8:00 PM")],
                      theme: .indigo),
            DailyText(date: dateFormatter.date(from: "2024-01-03") ?? Date(),
                      appointments: [Appointment(name: "Chad", time: "7:20 PM"), Appointment(name: "Wallace", time: "7:40 PM"), Appointment(name: "Jack", time: "7:00 PM")],
                      theme: .oxblood)
        ]
    }()
}

