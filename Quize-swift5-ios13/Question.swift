//
//  Qurstion.swift
//  Quizzler-iOS13
//
//  Created by Moustafa on 12/15/19.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import Foundation

struct Question {
    let text:String!
    let anser:String!
    init(q:String,a:String) {
        text=q
        anser=a
    }
}
struct cQuestion {
    let text:String!
    let ch:[String]!
    let correctAnswer:String!
    init(q:String,a:[String],correctAnswer:String) {
           text=q
           ch=a
        self.correctAnswer=correctAnswer
       }
}
