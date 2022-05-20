//
//  OnBoardingView.swift
//  Planty
//
//  Created by renaka agusta on 14/05/22.
//

import SwiftUI

struct OnBoardingView: View {
    
    @State var moveToSignIn = false
    @State var selectedPage = 0
    @State var onBoardPage: [OnBoardCardData] = [OnBoardCardData(
        id: 1,
        title: "Share you planting experience",
        description: "Make a post about your planting stories",
        image: "AppLogo"
    ),OnBoardCardData(
        id: 2,
        title: "Get more knowledge",
        description: "Get detail information about plant",
        image: "AppLogo"
    ),OnBoardCardData(
        id: 3,
        title: "Connect with other planties",
        description: "Make impact to other throuh communities",
        image: "AppLogo"
    )]
    
    init() {
        let users = UserDBManager().getUsers()
        print(users)
    }
    
    var body: some View {
        VStack{
            TabView(selection: $selectedPage)
            {
                ForEach(0..<onBoardPage.count){
                    index in OnBoardingCard(cardData: onBoardPage[index]).tag(index)
                }
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .automatic)).frame( height: 380)
            AppElevatedButton(label: "Start", width: 140, onClick: {
                    moveToSignIn = true
                })
        }.background(
            NavigationLink(
                destination: SignInView(),
                isActive: $moveToSignIn
            ) {
                EmptyView()
            }.hidden()
        )
    }
}

struct OnBoardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnBoardingView()
    }
}
