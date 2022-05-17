//
//  CloudKit.swift
//  Planty
//
//  Created by renaka agusta on 14/05/22.
//

import Foundation
import CloudKit

let publicDatabase = CKContainer(identifier: "iCloud.planties").publicCloudDatabase
let predicate = NSPredicate(value: true)
