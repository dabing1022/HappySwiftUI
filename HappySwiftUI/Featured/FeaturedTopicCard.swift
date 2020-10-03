//
//  FeaturedTopicCard.swift
//  HappySwiftUI
//
//  Created by ChildhoodAndy on 2020/10/3.
//  Copyright © 2020 HappyCoding. All rights reserved.
//

import SwiftUI

struct Card: Identifiable {
    var id: String {
        prompt + answer
    }
    let prompt: String
    let answer: String
    
    static var example1: Card {
        Card(prompt: "What's your name?", answer: "ChildhoodAndy")
    }
    
    static var example2: Card {
        Card(prompt: "What's app's name?", answer: "HappySwiftUI")
    }
}

struct FeaturedTopicCard: View {
    let card: Card
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 25, style: .continuous)
                .fill(Color.white)
                .shadow(radius: 10)
            
            VStack {
                Text(card.prompt)
                    .font(.largeTitle)
                    .foregroundColor(.black)
                
                Text(card.answer)
                    .font(.title)
                    .foregroundColor(.gray)
            }
            .padding(20)
            .multilineTextAlignment(.center)
        }
    }
}

struct FeaturedTopicCard_Previews: PreviewProvider {
    static var previews: some View {
        FeaturedTopicCard(card: Card.example1)
    }
}
