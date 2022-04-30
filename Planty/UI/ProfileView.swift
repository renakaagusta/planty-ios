//
//  ProfileView.swift
//  Planty
//
//  Created by renaka agusta on 30/04/22.
//

import SwiftUI

struct ProfileView: View {
    var body: some View {
        VStack{
            Spacer().frame(height: 20)
            HStack {
                Spacer().frame(width: 20)
                VStack{
                    HStack(){
                        Image("Profile").resizable().frame(width: 90, height: 90).cornerRadius(80)
                        Spacer().frame(width: 20)
                        VStack(alignment:.leading){
                            Text("Emma Phiilips").font(Font.title2.bold())
                            Spacer().frame(height: 10)
                            Text("Fashion Model").font(Font.subheadline).foregroundColor(Color.gray)
                        }
                        Spacer()
                    }
                    Spacer().frame(height: 30)
                    HStack{
                        Spacer().frame(width: 10)
                        Image(systemName: "phone").foregroundColor(Color.gray)
                        Spacer().frame(width: 20)
                        Text("088806875205").font(Font.caption).foregroundColor(Color.gray)
                        Spacer()
                    }
                    Spacer().frame(height: 20)
                    HStack{
                        Spacer().frame(width: 10)
                        Image(systemName: "mail").foregroundColor(Color.gray)
                        Spacer().frame(width: 20)
                        Text("renakaagusta28@gmail.com").font(Font.caption).foregroundColor(Color.gray)
                        Spacer()
                    }
                }
                Spacer().frame(width: 20)
            }
            Spacer().frame(height: 40)
            VStack {
                HStack{
                    HStack{
                        Spacer()
                        VStack {
                            Text("20").font(Font.title2.bold())
                            Spacer().frame(height: 10)
                            Text("Tanaman").font(Font.subheadline.bold()).foregroundColor(Color.gray)
                        }
                        Spacer()
                    }
                    Spacer().frame(width: 1, height: 100).background(Color.lightGray)
                    HStack{
                        Spacer()
                        VStack {
                            Text("3").font(Font.title2.bold())
                            Spacer().frame(height: 10)
                            Text("Artikel").font(Font.subheadline.bold()).foregroundColor(Color.gray)
                        }
                        Spacer()
                    }
                }.frame(width: .infinity, height: 100).border(Color.lightGray, width: 1)
                Spacer().frame(height: 30)
                HStack{
                    Spacer().frame(width: 30)
                    Image(systemName: "heart").resizable().frame(width: 25, height: 25).foregroundColor(Color.primaryColor)
                    Spacer().frame(width: 20)
                    Text("Favoritmu").font(Font.title3.bold())
                    Spacer()
                }
                Spacer().frame(height: 30)
                HStack{
                    Spacer().frame(width: 30)
                    Image(systemName: "info.circle").resizable().frame(width: 25, height: 25).foregroundColor(Color.primaryColor)
                    Spacer().frame(width: 20)
                    Text("Tentang").font(Font.title3.bold())
                    Spacer()
                }
                Spacer().frame(height: 30)
                HStack{
                    Spacer().frame(width: 30)
                    Image(systemName: "gear").resizable().frame(width: 25, height: 25).foregroundColor(Color.primaryColor)
                    Spacer().frame(width: 20)
                    Text("Pengaturan").font(Font.title3.bold())
                    Spacer()
                }
            }
            Spacer()
            HStack{
                Spacer().frame(width: 30)
                Image(systemName: "power").resizable().frame(width: 25, height: 25).foregroundColor(Color.red)
                Spacer().frame(width: 20)
                Text("Keluar").font(Font.title3.bold()).foregroundColor(Color.red)
                Spacer()
            }
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
