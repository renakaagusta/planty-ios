//
//  Post.swift
//  Planty
//
//  Created by renaka agusta on 14/05/22.
//

import Foundation

struct Planting: Codable, Hashable, Identifiable {
    public var id: Int = 0
    public var user: String = ""
    public var plant: String = ""
    public var quantity: Int = 0
    public var createdAt: Date = Date.now
    public var recordId: String = ""
}
