//
//  ContentView.swift
//  CustomCarrouselView
//
//  Created by Marco Alonso on 10/06/24.
//

import SwiftUI

struct ContentView: View {
    let places: [Place] = [
        Place(name: "Morelia", image: "morelia1"),
        Place(name: "Morelia", image: "morelia2"),
        Place(name: "Morelia", image: "morelia3"),
        Place(name: "Morelia", image: "morelia4"),
        Place(name: "Morelia", image: "morelia5"),
        Place(name: "Morelia", image: "morelia6"),
        Place(name: "Morelia", image: "morelia7"),
        Place(name: "Morelia", image: "california1"),
        Place(name: "Morelia", image: "california2"),
        Place(name: "Morelia", image: "california3"),
        Place(name: "Morelia", image: "california4")
    ]
    var body: some View {
        VStack(alignment: .leading) {
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(places) { place in
                        Image(place.image)
                            .resizable()
                            .cornerRadius(12)
                            .frame(width: 300, height: 200)
                            .shadow(radius: 10, y: 10)
                            .scrollTransition(topLeading: .interactive, bottomTrailing: .interactive) { effect, phase in
                                effect
                                    .scaleEffect(1 - abs (phase.value))
                                    .opacity(1 - abs (phase.value))
                                    .rotation3DEffect(.degrees(phase.value * 90), axis: (x: 0, y: 1, z: 0))
                            }
                            // .containerRelativeFrame(.horizontal)
                    }
                }
                .scrollTargetLayout()
            }
            .frame(height: 200)
            .safeAreaPadding(.horizontal, 16)
            .scrollClipDisabled()
            .scrollTargetBehavior(.viewAligned)
            
            
            
            Spacer()
        }
    }
}

#Preview {
    ContentView()
}

struct Place: Identifiable {
    let id = UUID().uuidString
    let name: String
    let image: String
}
