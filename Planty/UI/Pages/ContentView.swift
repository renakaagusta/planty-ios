//
//  ContentView.swift
//  Planty
//
//  Created by renaka agusta on 28/04/22.
//
import SwiftUI

struct ContentView: View {
    
    init() {
        UITabBar.appearance().backgroundColor = UIColor.white
        UITableView.appearance().backgroundColor = .clear
    }
    
    var body: some View {
        //SignInView()
        OnBoardingView()
        //DashboardView()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewDevice("iPad Pro (11-inch) (3rd generation)")
            .previewInterfaceOrientation(.landscapeLeft)
    }
}
