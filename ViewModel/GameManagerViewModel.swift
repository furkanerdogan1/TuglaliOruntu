//
//  GameManagerViewModel.swift
//  TuglaliOruntu
//
//  Created by Furkan Erdoğan on 10.06.2023.
//

import Foundation
import SwiftUI

class GameManagerVM : ObservableObject {

    static var currentIndex = 0
    
    static func createGameModel(i:Int) -> Question {
        return Question(currentQuestionIndex: i, quizModel: quizData[i])
    }
    
    @Published var model = GameManagerVM.createGameModel(i: GameManagerVM.currentIndex)
    
    
    var timer = Timer()
    var maxProgress = 75
    @Published var progress = 0
    
    init() {
        self.model.quizCompleted = "ready"
    }
    
    func verifyAnswer(selectedOption: QuestionOption) {
        for index in model.quizModel.optionsList.indices {
            model.quizModel.optionsList[index].isMatched = false
            model.quizModel.optionsList[index].isSelected = false
            
        }
        if let index = model.quizModel.optionsList.firstIndex(where: {$0.optionId == selectedOption.optionId}) {
            if selectedOption.optionId ==  model.quizModel.answer {
                model.quizModel.optionsList[index].isMatched = true
                model.quizModel.optionsList[index].isSelected = true
                
                print("buradayım")
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                    if (GameManagerVM.currentIndex < 4) {
                        GameManagerVM.currentIndex = GameManagerVM.currentIndex + 1
                        self.model = GameManagerVM.createGameModel(i: GameManagerVM.currentIndex)
                    } else {
                        self.model.quizCompleted = "bitti"
                        self.model.quizWinningStatus = true
                        self.reset()
                    }
                }
            } else {
                model.quizModel.optionsList[index].isMatched = false
                model.quizModel.optionsList[index].isSelected = true
            }

        }
    }
    
    func restartGame() {
        self.model.quizCompleted = "ready"
        
    }
    
    func startQuiz() {
        self.model.quizCompleted = "start"
        GameManagerVM.currentIndex = 0
        model = GameManagerVM.createGameModel(i: GameManagerVM.currentIndex)
        self.start()
    }
    
    func start() {
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats:true, block: { time in
            if self.progress == self.maxProgress {
                self.model.quizCompleted = "bitti"
                self.model.quizWinningStatus = false
                self.reset()
            } else {
                self.progress += 1
            }
        })
    }
                                     
    func reset () {
        timer.invalidate()
        self.progress = 0
    }
    
                                     
                                     
                                     
                                

}

extension GameManagerVM
{
    static var quizData: [QuestionModel] {
        [
            QuestionModel(question: "4 numaralı örüntü de kaç tane sarı kare olacak?",
                      answer: "B",
                      optionsList: [QuestionOption(id: 11, optionId: "A", option: "3", color: Color.yellow),
                                    QuestionOption(id: 12,optionId: "B", option: "4", color: Color.red),
                                    QuestionOption(id: 13,optionId: "C", option: "5", color: Color.green),
                                    QuestionOption(id: 14,optionId: "D", option: "6", color: Color.purple)]),
            
            QuestionModel(question: "4 numaralı örüntü de kaç tane mavi kare olacak?",
                      answer: "A",
                      optionsList: [QuestionOption(id: 21,optionId: "A", option: "5", color: Color.yellow),
                                    QuestionOption(id: 22,optionId: "B", option: "4", color: Color.red),
                                    QuestionOption(id: 23,optionId: "C", option: "7", color: Color.green),
                                    QuestionOption(id: 24,optionId: "D", option: "8", color: Color.purple)]),
            
            QuestionModel(question: "10 numaralı örüntü de kaç tane sarı kare olacak?",
                      answer: "C",
                      optionsList: [QuestionOption(id: 31,optionId: "A", option: "8", color: Color.yellow),
                                    QuestionOption(id: 32,optionId: "B", option: "9", color: Color.red),
                                    QuestionOption(id: 33,optionId: "C", option: "10", color: Color.green),
                                    QuestionOption(id: 34,optionId: "D", option: "11", color: Color.purple)]),
            QuestionModel(question: "50 numaralı örüntü de kaç tane mavi kare olacak?",
                      answer: "B",
                      optionsList: [QuestionOption(id: 31,optionId: "A", option: "41", color: Color.yellow),
                                    QuestionOption(id: 32,optionId: "B", option: "51", color: Color.red),
                                    QuestionOption(id: 33,optionId: "C", option: "61", color: Color.green),
                                    QuestionOption(id: 34,optionId: "D", option: "81", color: Color.purple)]),
            QuestionModel(question: "100 numaralı örüntüde toplam kaç kare olacak?",
                      answer: "D",
                      optionsList: [QuestionOption(id: 31,optionId: "A", option: "301", color: Color.yellow),
                                    QuestionOption(id: 32,optionId: "B", option: "202", color: Color.red),
                                    QuestionOption(id: 33,optionId: "C", option: "251", color: Color.green),
                                    QuestionOption(id: 34,optionId: "D", option: "201", color: Color.purple)])
        ]
    }
}
