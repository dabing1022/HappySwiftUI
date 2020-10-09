//
//  FeaturedTopicCard.swift
//  HappySwiftUI
//
//  Created by ChildhoodAndy on 2020/10/3.
//  Copyright © 2020 HappyCoding. All rights reserved.
//

import SwiftUI

struct FeaturedTopicCard: View {
    let card: Featured.FeaturedGroup
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 25, style: .continuous)
                .fill(Color.white)
                .shadow(radius: 10)
            
            VStack {
                Text(card.topic)
                    .font(.title)
                    .foregroundColor(.black)
                
                Text(card.source)
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
            .padding(20)
            .multilineTextAlignment(.center)
        }
    }
}
