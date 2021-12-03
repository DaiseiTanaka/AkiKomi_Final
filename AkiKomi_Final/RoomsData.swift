//
//  Colors.swift
//  CollectionViewInsideTableViewExample
//
//  Created by John Codeos on 12/21/19.
//  Copyright © 2019 John Codeos. All rights reserved.
//

import Foundation
import UIKit

struct RoomData {
    var objectsArray = [
        // MARK: - South Building
        TableViewCellModel(
            category: "SOUTH BUILDING",
            subcategory: ["Library", "Learning Commons", "Lecture Rooms", "Large Halls", "Labolatories"],
            rooms: [
                // Library
                [CollectionViewCellModel(category: "Library", floorMaps: "map_4th", name: "South Library", imageName: "south_library")],
                // Learning Commons
                [CollectionViewCellModel(category: "Learning Commons", floorMaps: "map_2nd", name: "Learning Commons1", imageName: "learning_commons1"),
                 CollectionViewCellModel(category: "Learning Commons", floorMaps: "map_2nd", name: "Learning Commons2", imageName: "learning_commons2"),
                 CollectionViewCellModel(category: "Learning Commons", floorMaps: "map_3rd", name: "Learning Commons3", imageName: "learning_commons3"),
                 CollectionViewCellModel(category: "Learning Commons", floorMaps: "map_4th", name: "Learning Commons4", imageName: "learning_commons4")],
                // Lecture Rooms
                [CollectionViewCellModel(category: "Lecture Rooms", floorMaps: "map_3rd", name: "S 306", imageName: "s306"),
                 CollectionViewCellModel(category: "Lecture Rooms", floorMaps: "map_3rd", name: "S 307", imageName: "s307"),
                 CollectionViewCellModel(category: "Lecture Rooms", floorMaps: "map_3rd", name: "S 311", imageName: "s311"),
                 CollectionViewCellModel(category: "Lecture Rooms", floorMaps: "map_3rd", name: "S 312", imageName: "s312")],
                // Large Halls
                [CollectionViewCellModel(category: "Halls", floorMaps: "map_1st", name: "Advanced Hall", imageName: "advanced_hall"),
                 CollectionViewCellModel(category: "Halls", floorMaps: "map_1st", name: "Sagano Hall", imageName: "sagano_hall")],
               // Laboratorys
                [CollectionViewCellModel(category: "Laboratorys", floorMaps: "map_1st", name: "Science Praza", imageName: "mws"),
                 CollectionViewCellModel(category: "Laboratorys", floorMaps: "map_4th", name: "Electronic Workshop", imageName: "ews_1")]
            ]),
    ]
}
