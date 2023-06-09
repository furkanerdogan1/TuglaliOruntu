//
//  QuestionModel.swift
//  TuglaliOruntu
//
//  Created by Furkan Erdoğan on 9.06.2023.
//

import Foundation
import SwiftUI

struct Question {
    var currentQuestionIndex: Int
    var quizModel: QuestionModel
    var quizCompleted: String = "start"
    var quizWinningStatus: Bool = false
}

struct QuestionModel {
    var question: String
    var answer: String
    var optionsList: [QuestionOption]
}

struct QuestionOption : Identifiable {
    var id: Int
    var optionId: String
    var option: String
    var color: Color
    var isSelected : Bool = false
    var isMatched : Bool = false
}

