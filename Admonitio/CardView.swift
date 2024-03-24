//
//  CardView.swift
//  Admonitio
//
//  Created by Parker Jackman on 3/23/24.
//

import SwiftUI

struct CardView: View {
    let texts: DailyText
    let dateFormatter: DateFormatter = {
            let formatter = DateFormatter()
            formatter.dateFormat = "MM/dd/yyyy"
            return formatter
        }()
    
    var body: some View {
        VStack(alignment: .leading){
            Text(dateFormatter.string(from: texts.date))
                .font(.headline)
            Spacer()
            HStack{
                Label("\(texts.appointments.count)", systemImage: "figure.walk.arrival")
                Spacer()
                Label("\(texts.startTime ?? "7:00")", systemImage: "clock")
                    .padding(.trailing, 20)
            }
            .font(.caption)
        }
        .labelStyle(.trailingIcon)
    }
}

struct CardView_Previews: PreviewProvider {
    static var texts = DailyText.sampleData[0]
    static var previews: some View {
        CardView(texts: texts)
            .background(texts.theme.mainColor)
            .foregroundColor(texts.theme.accentColor)
            .previewLayout(.fixed(width: 400, height: 60))
    }
}
