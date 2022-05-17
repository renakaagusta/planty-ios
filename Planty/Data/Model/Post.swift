//
//  Post.swift
//  Planty
//
//  Created by renaka agusta on 14/05/22.
//

import Foundation

struct Post: Codable, Hashable, Identifiable {
    public var id: Int = 0
    public var writer: String = ""
    public var title: String = ""
    public var description: String = ""
    public var content: String = ""
    public var image: String = ""
    public var category: [String] = []
    public var createdAt: Date = Date.now
    public var recordId: String = ""
}
