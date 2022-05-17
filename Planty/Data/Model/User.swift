//
//  User.swift
//  Planty
//
//  Created by renaka agusta on 07/05/22.
//

import Foundation

struct User: Codable, Hashable, Identifiable {
    public var id: Int = 0
    public var userId: String = ""
    public var username: String = ""
    public var firstname: String = ""
    public var lastname: String = ""
    public var email: String = ""
    public var phoneNumber: String = ""
    public var photo: String = "https://www.apple.com/ac/structured-data/images/knowledge_graph_logo.png?202205102348"
    public var recordId: String = ""
}

