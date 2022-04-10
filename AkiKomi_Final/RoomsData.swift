//
//  Colors.swift
//  CollectionViewInsideTableViewExample
//
//  Created by John Codeos on 12/21/19.
//  Copyright © 2019 John Codeos. All rights reserved.
//

import Foundation
import UIKit
import CocoaMQTT

struct RoomData {
    var objectsArray = [
        // MARK: - South Building
        TableViewCellModel(
            category: "SOUTH BUILDING",
            subcategory: ["Library", "Lecture Rooms", "Support rooms"], //["Library", "Learning Commons", "Lecture Rooms", "Large Halls", "Labolatories"],
            rooms: [
                // Library
                [CollectionViewCellModel(category: "Library", floorMaps: "map_4th", name: "South Library", topic: "topic/slibrary", imageName: "south_library", roomDetail: "  This is the library on the 4th floor of the South Building. The library is divided into two levels. There are two projectors on the first floor and various types of tables and chairs. On the first floor you are allowed to work on tasks while talking to your friends. On the 2nd floor, there are many engineering books and you can borrow them freely if you have a student ID card. However, talking is prohibited on the 2nd floor. ", capacity: 70, desks: 30, monitors: 2),
//                 CollectionViewCellModel(category: "Library", floorMaps: "map_5th", name: "South Library 5F", topic: "topic/slibrary/5f", imageName: "slibrary_2f_5", roomDetail: "  This is the library and study space on the 5th floor of the South Building. There are many engineering books and you can borrow them freely if you have a student ID card. However, talking is prohibited on the 2nd floor. It is mandatory to be quiet on this floor and you can study in a quiet environment. In addition, a monitor is installed on each desk, and you can use it freely.", capacity: 45, desks: 40, monitors: 80)
                ],
                // Learning Commons
//                [CollectionViewCellModel(category: "Learning Commons", floorMaps: "map_2nd", name: "Learning Commons1", topic: "topic_lc1", imageName: "learning_commons1", roomDetail: "　There are in total of four Learning Commons in this South Building. There are desks and chairs that can be used freely by students. This is the place that is designed for interaction with students from other grades and also graduate students. You can also use the air conditioner and whiteboard freely for meetings and self-study.",capacity: 108, desks: 40, monitors: 2),
//                 CollectionViewCellModel(category: "Learning Commons", floorMaps: "map_2nd", name: "Learning Commons2", topic: "topic_lc2", imageName: "learning_commons2", roomDetail: "　There are in total of four Learning Commons in this South Building. There are desks and chairs that can be used freely by students. This is the place that is designed for interaction with students from other grades and also graduate students. You can also use the air conditioner and whiteboard freely for meetings and self-study.", capacity: 82, desks: 43, monitors: 2),
//                 CollectionViewCellModel(category: "Learning Commons", floorMaps: "map_3rd", name: "Learning Commons3", topic: "topic_lc3", imageName: "learning_commons3", roomDetail: "　There are in total of four Learning Commons in this South Building. There are desks and chairs that can be used freely by students. This is the place that is designed for interaction with students from other grades and also graduate students. You can also use the air conditioner and whiteboard freely for meetings and self-study.", capacity: 59, desks: 22, monitors: 2),
//                 CollectionViewCellModel(category: "Learning Commons", floorMaps: "map_4th", name: "Learning Commons4", topic: "topic_lc4", imageName: "learning_commons4", roomDetail: "　There are in total of four Learning Commons in this South Building. There are desks and chairs that can be used freely by students. This is the place that is designed for interaction with students from other grades and also graduate students. You can also use the air conditioner and whiteboard freely for meetings and self-study.", capacity: 116, desks: 67, monitors: 2)],
                
                // Lecture Rooms
//                [CollectionViewCellModel(category: "Lecture Rooms", floorMaps: "map_3rd", name: "S 306", imageName: "s306", roomDetail: "  This room is usually used for students in the Faculty of Engineering. There are 3 screens so you can take the same lesson simultaneoulsy as the next room. After school, students are free to remain and study by themselves. The seats are not fixed and each student sits freely every morning. You are allowed to use airconditioner and adjust the temperature. ", capacity: 216, desks: 64, monitors: 3),
//                 CollectionViewCellModel(category: "Lecture Rooms", floorMaps: "map_3rd", name: "S 307", imageName: "s307", roomDetail: "  This room is usually used for students in the Faculty of Engineering. There are 3 screens so you can take the same lesson simultaneoulsy as the next room. After school, students are free to remain and study by themselves. The seats are not fixed and each student sits freely every morning. You are allowed to use airconditioner and adjust the temperature. ", capacity: 216, desks: 64, monitors: 3),
                [CollectionViewCellModel(category: "Lecture Rooms", floorMaps: "map_3rd", name: "S 311", topic: "topic/s311", imageName: "s311", roomDetail: "  This room is usually used for students in the Faculty of Engineering. There are 3 screens so you can take the same lesson simultaneoulsy as the next room. After school, students are free to remain and study by themselves. The seats are not fixed and each student sits freely every morning. You are allowed to use airconditioner and adjust the temperature. ", capacity: 108, desks: 36, monitors: 2),
                CollectionViewCellModel(category: "Lecture Rooms", floorMaps: "map_3rd", name: "S 312", topic: "topic/s312", imageName: "s312", roomDetail: "  This room is usually used for students in the Faculty of Engineering. There are 3 screens so you can take the same lesson simultaneoulsy as the next room. After school, students are free to remain and study by themselves. The seats are not fixed and each student sits freely every morning. You are allowed to use airconditioner and adjust the temperature. ", capacity: 108, desks: 36, monitors: 2)],
                
                
                // Large Halls
//                [CollectionViewCellModel(category: "Halls", floorMaps: "map_1st", name: "Advanced Hall", topic: "topic_advanced", imageName: "advanced_hall", roomDetail: "　This room can be freely used by students and faculty members. Many people have lunch during lunch break and use this room as a study room after school. There are many desks and chairs that can be used freely. At the beginning of each semester, this room is used as medical examinations and selling textbooks. In addition, there are two large windows, from which you can overlook the garden, creating a space with a sense of openness.", capacity: 168, desks: 30, monitors: 1),
//                 CollectionViewCellModel(category: "Halls", floorMaps: "map_1st", name: "Sagano Hall", topic: "topic_sagano", imageName: "sagano_hall", roomDetail: "　This is a hall where meetings such as events and orientations are held. Since one of the wall is made of window glass, you can overlook the courtyard and feel a sense of openness. Additionaly, this hall is the largest hall in the South Building and can accommodate up to 360 people. Also, if the chairs and desks are removed, more than 500 people can enter the room.", capacity: 360, desks: 120, monitors: 3)],
                
//               // Laboratorys
//                [CollectionViewCellModel(category: "Laboratorys", floorMaps: "map_1st", name: "Science Praza", imageName: "mws", roomDetail: "　Many of the latest machines and 3D printers are installed in this machine workshop. Some experiments and classes dealing with machines are conducted in this room. This workshop holds an annual 3D printer competition. In addition, the 3D printer in this workshop can be used by anyone who has permission to it. Also it is used for many cornerstone projects. To use this workshop, you need to attend the workshop orientation. If you are curious, please contact the student center or the teacher at the workshop.", capacity: 40, desks: 30, monitors: 1),
//                 CollectionViewCellModel(category: "Laboratorys", floorMaps: "map_4th", name: "Electronic Workshop", imageName: "ews_1", roomDetail: "　This electronic workshop is equipped with many of the latest equipment. It can be used to conducts experiments and classes related to electricity. In addition, the walls on the south and north sides are all covered with glass, creating a very open space. In addition, you can go directly to Learning Commons from this electronic workshop where you can have meals and meetings. It is shared by several Cornerstone projects and used by many project members after school as well as holidays.", capacity: 25, desks: 20, monitors: 2)]
                
                //Others
                [CollectionViewCellModel(category: "Support room ", floorMaps: "map_3rd", name: "Support room ", topic: "topic/lsr", imageName: "lsr", roomDetail: " This room always has a Student Assistant, so many students come to ask study questions after school. If you don't understand the content of the lesson or feel uneasy about the test, you may want to visit this room.", capacity: 20, desks: 0, monitors: 0),
                CollectionViewCellModel(category: "S4S Room", floorMaps: "map_3rd", name: "S4S Room", topic: "topic/s4s", imageName: "s4s", roomDetail: "  This room is for new students to consult and ask questions. Senior students will be available for your consultation here. If you are worried about your new life and would like to talk to your seniors, please visit this room. It will be a good opportunity to interact with your seniors, and they will answer things that are difficult to say to your teacher.s are free to remain and study by themselves. The seats are not fixed and each student sits freely every morning. You are allowed to use airconditioner and adjust the temperature. ", capacity: 25, desks: 20, monitors: 0)]
            ]

        ),
    ]
}
