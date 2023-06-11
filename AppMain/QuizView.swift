//
//  QuizView.swift
//  TuglaliOruntu
//
//  Created by Furkan Erdoğan on 11.06.2023.
//

import SwiftUI

struct QuizView: View {
    @ObservedObject var gameManagerVM: GameManagerVM
    var body: some View {
        ZStack {
            
            LinearGradient(colors: [Color(hex: "#0575E6"), Color(hex: "#00F260")], startPoint: .topLeading, endPoint: .bottomTrailing)
                .ignoresSafeArea()
            if (gameManagerVM.model.quizCompleted) == "ready" {
                StartView(gameManagerVM: gameManagerVM)
                
                
            } else if (gameManagerVM.model.quizCompleted) == "bitti" {
                QuizCompletedView(gameManagerVM: gameManagerVM)
            } else if (gameManagerVM.model.quizCompleted) == "start" {
                VStack {
                    ReusableText(text: "Örüntü Bulma Oyunu", size: 30)
                        .padding()
                    
                    ReusableText(text: gameManagerVM.model.quizModel.question, size: 25)
                        .lineLimit(3)
                        .frame(width: UIScreen.main.bounds.size.width - 20, height: 60, alignment: .center)
                        .multilineTextAlignment(.center)
                    
                    Image("duvar")
                        .resizable()
                        .padding()
                        .frame(width: 380, height: 300)
                        
                    Spacer()
                    
                    ZStack {
                        ZStack {
                            Circle()
                                .stroke(lineWidth: 15)
                                .foregroundColor(.gray)
                                .opacity(0.3)
                            
                            
                            Circle()
                                .trim(from: 0.0, to: min(CGFloat((Double(gameManagerVM.progress) * Double(gameManagerVM.maxProgress))/100),1.0))
                                .stroke(LinearGradient(colors: [.orange, .red],
                                                       startPoint: .topLeading,
                                                       endPoint: .bottomTrailing),
                                        style: StrokeStyle(lineWidth: 19, lineCap: .round, lineJoin: .round))
                                .rotationEffect(Angle(degrees: 270))
                                .animation(Animation.linear(duration: Double(gameManagerVM.maxProgress)), value: gameManagerVM.progress)
                            
                            ReusableText(text: String(gameManagerVM.progress), size: 30)
                        }.frame(width: 80, height: 80)
                        
                        
                        Spacer()
                        
                        OptionsGridView(gameManagerVM: gameManagerVM)
                    }
                }
            }
        }
    }
}





