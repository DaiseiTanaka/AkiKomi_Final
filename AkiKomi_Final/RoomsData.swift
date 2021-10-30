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
            subcategory: ["Library", "Learning Commons", "Lecture Rooms", "Large Halls", "Laboratorys"],
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
        // MARK: - First Floor

//        TableViewCellModel(
//            category: "First Floor",
//            subcategory: ["Large Hall", "Labratory"],
//            rooms: [
//                // Large Hall
//                [CollectionViewCellModel(floorMaps: "map_1st", name: "Advanced Hall", imageName: "advanced_hall", topic: "topic_advanced", capacity: 168,
//                                         roomDetail: "　This room can be freely used by students and faculty members. Many people have lunch during lunch break and use this room as a study room after school. There are many desks and chairs that can be used freely. At the beginning of each semester, this room is used as medical examinations and selling textbooks. In addition, there are two large windows, from which you can overlook the garden, creating a space with a sense of openness.", desks: 168),
//                 CollectionViewCellModel(floorMaps: "map_1st", name: "Sagano Hall", imageName: "sagano_hall", topic: "topic_sagano", capacity: 360,
//                                         roomDetail: "　This is a hall where meetings such as events and orientations are held. Since one of the wall is made of window glass, you can overlook the courtyard and feel a sense of openness. Additionaly, this hall is the largest hall in the South Building and can accommodate up to 360 people. Also, if the chairs and desks are removed, more than 500 people can enter the room.", desks: 120)],
//                // Labroatory
//                [CollectionViewCellModel(floorMaps: "map_1st", name: "Science Praza", imageName: "mws", topic: "topic_mws", capacity: 40,
//                                         roomDetail: "　Many of the latest machines and 3D printers are installed in this machine workshop. Some experiments and classes dealing with machines are conducted in this room. This workshop holds an annual 3D printer competition. In addition, the 3D printer in this workshop can be used by anyone who has permission to it. Also it is used for many cornerstone projects. To use this workshop, you need to attend the workshop orientation. If you are curious, please contact the student center or the teacher at the workshop.", desks: 40)]
//            ]),
//
//        // MARK: - Second Floor
//
//        TableViewCellModel(
//            category: "Second Floor",
//            subcategory: ["Learning Commons"],
//            rooms: [
//                // Learning Commons
//                [CollectionViewCellModel(floorMaps: "map_2nd", name: "Learning Commons1", imageName: "learning_commons1", topic: "topic_lc1", capacity: 108,
//                                         roomDetail: "　There are in total of four Learning Commons in this South Building. There are desks and chairs that can be used freely by students. This is the place that is designed for interaction with students from other grades and also graduate students. You can also use the air conditioner and whiteboard freely for meetings and self-study.", desks: 40),
//                 CollectionViewCellModel(floorMaps: "map_2nd", name: "Learning Commons2", imageName: "learning_commons2", topic: "topic_lc2", capacity: 82,
//                                         roomDetail: "　There are in total of four Learning Commons in this South Building. There are desks and chairs that can be used freely by students. This is the place that is designed for interaction with students from other grades and also graduate students. You can also use the air conditioner and whiteboard freely for meetings and self-study.", desks: 43)]
//            ]),
//
//        // MARK: - Third Floor
//
//        TableViewCellModel(
//            category: "Third Floor",
//            subcategory: ["Learning Commons", "Lecture Rooms"],
//            rooms: [
//                // Learning Commons
//                [CollectionViewCellModel(floorMaps: "map_3rd", name: "Learning Commons3", imageName: "learning_commons3", topic: "topic_lc3", capacity: 59,
//                                         roomDetail: "　There are in total of four Learning Commons in this South Building. There are desks and chairs that can be used freely by students. This is the place that is designed for interaction with students from other grades and also graduate students. You can also use the air conditioner and whiteboard freely for meetings and self-study.", desks: 22)],
//                // Lecture Rooms
//                [CollectionViewCellModel(floorMaps: "map_3rd", name: "S 306", imageName: "s306", topic: "topic_s306", capacity: 216,
//                                         roomDetail: "  This room is usually used for students in the Faculty of Engineering. There are 3 screens so you can take the same lesson simultaneoulsy as the next room. After school, students are free to remain and study by themselves. The seats are not fixed and each student sits freely every morning. You are allowed to use airconditioner and adjust the temperature. ", desks: 64),
//                 CollectionViewCellModel(floorMaps: "map_3rd", name: "S 307", imageName: "s307", topic: "topic_s307", capacity: 216,
//                                         roomDetail: "  This room is usually used for students in the Faculty of Engineering. There are 3 screens so you can take the same lesson simultaneoulsy as the next room. After school, students are free to remain and study by themselves. The seats are not fixed and each student sits freely every morning. You are allowed to use airconditioner and adjust the temperature. ", desks: 64),
//                 CollectionViewCellModel(floorMaps: "map_3rd", name: "S 311", imageName: "s311", topic: "topic_s311", capacity: 108,
//                                         roomDetail: "  This room is usually used for students in the Faculty of Engineering. There are 3 screens so you can take the same lesson simultaneoulsy as the next room. After school, students are free to remain and study by themselves. The seats are not fixed and each student sits freely every morning. You are allowed to use airconditioner and adjust the temperature. ", desks: 36),
//                 CollectionViewCellModel(floorMaps: "map_3rd", name: "S 312", imageName: "s312", topic: "topic_s312", capacity: 108,
//                                         roomDetail: "  This room is usually used for students in the Faculty of Engineering. There are 3 screens so you can take the same lesson simultaneoulsy as the next room. After school, students are free to remain and study by themselves. The seats are not fixed and each student sits freely every morning. You are allowed to use airconditioner and adjust the temperature. ", desks: 36)]
//            ]),
//
//        // MARK: - Fourth Floor
//
//        TableViewCellModel(
//            category: "Fourth Floor",
//            subcategory: ["Library", "Laboratorys", "Learning Commons"],
//            rooms: [
//                // Library
//                [CollectionViewCellModel(floorMaps: "map_4th", name: "Library", imageName: "south_library", topic: "topic_slibrary", capacity: 70,
//                                         roomDetail: "  This is the library on the 4th floor of the South Building. The library is divided into two levels. There are two projectors on the first floor and various types of tables and chairs. On the first floor you are allowed to work on tasks while talking to your friends. On the 2nd floor, there are many engineering books and you can borrow them freely if you have a student ID card. However, talking is prohibited on the 2nd floor. ", desks: 30)],
//                // Laboratory
//                [CollectionViewCellModel(floorMaps: "map_4th", name: "Electronic Workshop", imageName: "ews_1", topic: "topic_ews", capacity: 25,
//                                         roomDetail: "　This electronic workshop is equipped with many of the latest equipment. It can be used to conducts experiments and classes related to electricity. In addition, the walls on the south and north sides are all covered with glass, creating a very open space. In addition, you can go directly to Learning Commons from this electronic workshop where you can have meals and meetings. It is shared by several Cornerstone projects and used by many project members after school as well as holidays.", desks: 25)],
//                // Learning Commons
//                [CollectionViewCellModel(floorMaps: "map_4th", name: "Learning Commons4", imageName: "learning_commons4", topic: "topic_lc4", capacity: 116,
//                                         roomDetail: "　There are in total of four Learning Commons in this South Building. There are desks and chairs that can be used freely by students. This is the place that is designed for interaction with students from other grades and also graduate students. You can also use the air conditioner and whiteboard freely for meetings and self-study.", desks: 67)]
//            ]),
        
    ]
}

