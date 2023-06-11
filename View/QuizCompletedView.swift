//
//  QuizCompletedView.swift
//  TuglaliOruntu
//
//  Created by Furkan Erdoğan on 11.06.2023.
//

import Foundation
import SwiftUI

struct QuizCompletedView: View {
    var gameManagerVM: GameManagerVM
    var body: some View {
        VStack {
            Image(systemName: "gamecontroller.fill")
                .foregroundColor(Color.yellow)
                .font(.system(size: 60))
                .padding()
            
            ReusableText(text: gameManagerVM.model.quizWinningStatus ?
                         "Çok iyiydin!" :
                            "Oyun Bitti.",
                         size: 30)
                .padding()
            
            ReusableText(text: gameManagerVM.model.quizWinningStatus
                         ? "Oynadığın için teşekkürler!"
                         : "Bir dahaki sefere iyi şanslar.",
                         size: 30)
                .padding()
            
            Button {
                
                gameManagerVM.restartGame()
            } label: {
                HStack {
                    Image(systemName: "play.fill")
                        .foregroundColor(.white)
                        .font(.system(size: 24))
                        .padding()
                    
                    Text("Ana sayfaya dön")
                        .foregroundColor(.white)
                        .font(.system(size: 24, weight: .bold, design: .rounded))
                }
            }.frame(width: 300, height: 60, alignment: .center)
                .background(Color(hex: "#3B83BD"))
                .cornerRadius(30)
                .padding()
            
        }
    }
}
