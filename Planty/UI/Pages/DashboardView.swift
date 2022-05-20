//
//  DashboardView.swift
//  Planty
//
//  Created by renaka agusta on 08/05/22.
//


import SwiftUI

struct DashboardView: View {
    
    @State var selection = 1
    
    init() {
    }
    
    var body: some View {
            VStack(alignment: .center) {
                TabView(selection: $selection) {
                    HomeView()
                        .tabItem {
                            Image(systemName: "homekit")
                            Text("Beranda").foregroundColor(Color.primaryColor)
                        }.tag(1)
                    PlantListView().tabItem {
                        Image(systemName: "leaf")
                        Text("Tanaman")
                    }.tag(2)
                    TodoListView().tabItem {
                        Image(systemName: "list.bullet")
                        Text("Todo")
                    }.tag(3)
                    ProfileView().tabItem {
                        Image(systemName: "person")
                        Text("Profil")
                    }.tag(4)
                }.background(.black).accentColor(Color.primaryColor).navigationTitle(selection == 1 ? "Beranda" : (selection == 2 ? "Tanaman" : (selection == 3 ? "Todo" : "Profil")))
            }.navigationBarBackButtonHidden(true)
    }
}

struct DashboardView_Previews: PreviewProvider {
    static var previews: some View {
        DashboardView()
            .previewDevice("iPad Pro (11-inch) (3rd generation)")
.previewInterfaceOrientation(.landscapeLeft)
    }
}
