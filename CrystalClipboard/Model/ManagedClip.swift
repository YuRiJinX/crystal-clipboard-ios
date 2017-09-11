//
//  ManagedClip.swift
//  CrystalClipboard
//
//  Created by Justin Mazzocchi on 8/20/17.
//  Copyright © 2017 Justin Mazzocchi. All rights reserved.
//

import CoreData

class ManagedClip: NSManagedObject, ClipType {
    @NSManaged private(set) var id: Int
    @NSManaged private(set) var text: String
    @NSManaged private(set) var createdAt: Date
    
    @discardableResult
    convenience init(from clip: Clip, context: NSManagedObjectContext) {
        self.init(context: context)
        id = clip.id
        text = clip.text
        createdAt = clip.createdAt
    }
    
}

extension ManagedClip {
    override class func fetchRequest() -> NSFetchRequest<NSFetchRequestResult> {
        return NSFetchRequest<NSFetchRequestResult>(entityName: "ManagedClip")
    }
}
