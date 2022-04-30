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
            VStack(alignment: .center) {
                TabView() {
                    VStack{}
                     .tabItem {
                         Image(systemName: "timer")
                         Text("Beranda")
                     }.tag(1)
                    VStack{}.tabItem {
                        Image(systemName: "dollarsign.square")
                        Text("Kasir")
                     }.tag(1)
                    VStack{}.tabItem {
                       Image(systemName: "list.bullet")
                       Text("Inventori")
                    }.tag(1).background(.white).padding()
                }.background(.white)
            }.onAppear{
                //ItemDBManager().deleteDatabase()
            }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewDevice("iPad Pro (11-inch) (3rd generation)")
.previewInterfaceOrientation(.landscapeLeft)
    }
}
