//
//  EventSectionView.swift
//  Cafe
//
//  Created by HYEONG SIK NAM on 2022/08/09.
//

import SwiftUI

struct EventSectionView: View {
    @Binding var events: [Event]
    
    var body: some View {
        VStack {
            HStack {
                Text("Events")
                    .font(.headline)
                Spacer()
                Button(action: {}) {
                    Text("See all")
                        .font(.subheadline)
                }
            }
            .padding(.horizontal, 16)
            ScrollView(.horizontal, showsIndicators: false) {
                LazyHStack(spacing: 16) {
                    ForEach(events) { event in
                        EventSectionItemView(event: event)
                    }
                }
                .frame(maxWidth: .infinity, minHeight: 220, maxHeight: .infinity)
                .padding(.horizontal, 16)
            }
        }
    }
}

struct EventSectionItemView: View {
    let event: Event
    var body: some View {
        VStack {
            event.image
                .resizable()
                .scaledToFill()
                .frame(height: 150)
                .clipped()
            Text(event.title)
                .frame(maxWidth: .infinity, alignment: .leading)
                .font(.headline)
            Text(event.description)
                .lineLimit(1)
                .frame(maxWidth: .infinity, alignment: .topLeading)
                .font(.subheadline)
        }
        .frame(width: UIScreen.main.bounds.width - 32.0)
    }
}
