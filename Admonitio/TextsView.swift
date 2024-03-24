//
//  TextsView.swift
//  Admonitio
//
//  Created by Parker Jackman on 3/23/24.
//

import SwiftUI

struct TextsView: View {
    let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "MM/dd/yyyy"
        return formatter
    }()
    
    let texts: [DailyText]
    
    var body: some View {
        NavigationStack {
            List(texts) { text in
                NavigationLink(destination: DetailView(texts: text)) {
                    CardView(texts: text)
                }
                .listRowBackground(text.theme.mainColor)
                .foregroundColor(text.theme.accentColor)

            }
            .navigationTitle("Text Calendar")
            .toolbar{
                Button(action:{}) {
                    Image(systemName: "plus")
                }
            }
        }
    }
}


struct ScrumsView_Previews: PreviewProvider {
    static var previews: some View {
        TextsView(texts: DailyText.sampleData)
    }
}
