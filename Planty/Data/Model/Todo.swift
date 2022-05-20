//
//  Todo.swift
//  Planty
//
//  Created by renaka agusta on 20/05/22.
//

import Foundation

struct Todo: Codable, Hashable, Identifiable {
    public var id: Int = 0
    public var planting: String = ""
    public var user: String = ""
    public var createdAt: Date = NSDate() as Date
    public var recordId: String = ""
}
