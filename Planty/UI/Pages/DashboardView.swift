//
//  DashboardView.swift
//  Planty
//
//  Created by renaka agusta on 08/05/22.
//


import SwiftUI

struct DashboardView: View {
    
    init() {
        UITabBar.appearance().backgroundColor = UIColor.white
        UITableView.appearance().backgroundColor = .clear
    }
    
    var body: some View {
            VStack(alignment: .center) {
                TabView() {
                    HomeView()
                        .tabItem {
                            Image(systemName: "homekit")
                            Text("Beranda").foregroundColor(Color.primaryColor)
                        }.tag(1)
                    PlantListView().tabItem {
                        Image(systemName: "leaf")
                        Text("Tanaman")
                    }.tag(1)
                    ProfileView().tabItem {
                        Image(systemName: "person")
                        Text("Profile")
                    }.tag(1)
                }.background(.white).accentColor(Color.primaryColor)
            }.navigationBarBackButtonHidden(true).onAppear{
                //ItemDBManager().deleteDatabase()
            }
    }
}

struct DashboardView_Previews: PreviewProvider {
    static var previews: some View {
        DashboardView()
            .previewDevice("iPad Pro (11-inch) (3rd generation)")
.previewInterfaceOrientation(.landscapeLeft)
    }
}
