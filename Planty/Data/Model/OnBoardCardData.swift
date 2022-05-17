//
//  OnBoardCardData.swift
//  Planty
//
//  Created by renaka agusta on 14/05/22.
//

import Foundation

struct OnBoardCardData: Codable, Hashable, Identifiable {
    public var id: Int = 0
    public var title: String = ""
    public var description: String = ""
    public var image: String = ""
}
