//
//  Plant.swift
//  Planty
//
//  Created by renaka agusta on 14/05/22.
//

import Foundation

struct Plant: Codable, Hashable, Identifiable {
    public var id: Int = 0
    public var name: String = ""
    public var description: String = ""
    public var image: String = ""
    public var humidity: String = ""
    public var temperature: String = ""
    public var category: String = ""
    public var recordId: String = ""
}
