//
//  OnBoardCard.swift
//  Planty
//
//  Created by renaka agusta on 14/05/22.
//

import SwiftUI


struct OnBoardingCard: View {
    
    @State var cardData: OnBoardCardData = OnBoardCardData(title: "title", description: "description")
    
    
    var body: some View {
        VStack{
            Image(cardData.image).resizable().frame(width: 350, height: 200)
            Text(cardData.title)
                .font(.system(size: 24))
                .fontWeight(.bold)
            Text(cardData.description)
                .fontWeight(.light)
                .multilineTextAlignment(.center)
                .font(.system(size: 20))
                .frame(height: 100)
                .padding()
            Spacer().frame(height: 50)
        }.padding()
            .offset(x: 0, y: 0)
    }
}

struct OnBoardingCardView_Previews: PreviewProvider {
    static var previews: some View {
        OnBoardingCard()
    }
}
