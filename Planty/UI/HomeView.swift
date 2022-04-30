//
//  HomeView.swift
//  Planty
//
//  Created by renaka agusta on 28/04/22.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        HStack{
            Spacer().frame(width: 15)
            VStack(alignment: .leading){
                HStack{
                    Image(systemName: "list.triangle").resizable().frame(width: 30, height: 20).foregroundColor(.gray)
                    Spacer()
                    Image("Logo").resizable().frame(width: 200, height: 50).offset(y:10)
                    Spacer()
                    Image(systemName: "menubar.dock.rectangle").resizable().frame(width: 30, height: 20).foregroundColor(.gray)
                }
                Spacer().frame(height: 20)
                AppTextField()
                Spacer().frame(height: 30)
                HStack{
                    AppElevatedButton()
                    AppFlatButton()                }
                Spacer().frame(height: 30)
                VStack(alignment: .leading) {
                    Text("Tanaman Populer").font(Font.title2.bold())
                    Spacer().frame(height: 30)
                    VStack{
                        HStack{
                            PlantCard()
                            Spacer()
                            PlantCard()
                        }
                        Spacer().frame(height: 30)
                        HStack{
                            PlantCard()
                            Spacer()
                            PlantCard()
                        }
                    }}
                Spacer().frame(height: 30)
                VStack(alignment: .leading) {
                    Text("Artikel Populer").font(Font.title2.bold())
                    Spacer().frame(height: 30)
                    VStack{
                        ArticleCard()
                    }}
            }
            Spacer().frame(width: 15)
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
