//
//  StartView.swift
//  TuglaliOruntu
//
//  Created by Furkan Erdoğan on 10.06.2023.
//

import Foundation
import SwiftUI

struct StartView: View {
    var gameManagerVM: GameManagerVM
    var body: some View {
        VStack {
            
           
            ZStack {
                Image("duvar")
                    .resizable()
                    .padding()
                    .frame(width: 380, height: 300)
                    .padding(.top, -80)
                    
                LottieView()
                    .frame(width: 275, height: 275)
                    .padding(.top, 120)
                    .padding(.leading, 80)
            }
            
            ReusableText(text: gameManagerVM.model.quizWinningStatus ?
                         "Oyuna Başla" :
                            "Oyuna Başla",
                         size: 30)
            
            ReusableText(text: gameManagerVM.model.quizWinningStatus
                         ? "İşçilerimiz bir duvar örüyorlar ve bu duvarı örerken bir örüntü izliyorlar. Onlar 3. örüntüye kadar geldiler ve diğer örüntüler için senden bazı tahminler yapmanı istiyorlar. Tahmin etmeye başlayalım mı?"
                         : "İşçilerimiz bir duvar örüyorlar ve bu duvarı örerken bir örüntü izliyorlar. Onlar 3. örüntüye kadar geldiler ve diğer örüntüler için senden bazı tahminler yapmanı istiyorlar. Tahmin etmeye başlayalım mı?",
                         size: 17)
                .padding()
            Spacer()
            
            Button {
                gameManagerVM.startQuiz()
            } label: {
                HStack {
                    Image(systemName: "play.fill")
                        .foregroundColor(.white)
                        .font(.system(size: 24))
                        .padding()
                    
                    Text("Başla")
                        .foregroundColor(.white)
                        .font(.system(size: 24, weight: .bold, design: .rounded))
                }
            }.frame(width: 300, height: 60, alignment: .center)
                .background(Color(hex: "#3B83BD"))
                .cornerRadius(30)
                .padding()
            Spacer()
            
        }
        
    }
    
}
