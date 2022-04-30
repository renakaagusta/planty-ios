//
//  PlantyApp.swift
//  Planty
//
//  Created by renaka agusta on 28/04/22.
//

import SwiftUI

extension Color {
    static let primaryColor = Color(red: 74 / 255, green: 156 / 255, blue: 128 / 255)
    static let secondaryColor = Color(red: 223 / 255, green: 233 / 255, blue: 230 / 255)
    static let lightGray = Color(red: 234 / 255, green: 234 / 255, blue: 234 / 255)
}

@main
struct PlantyApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
