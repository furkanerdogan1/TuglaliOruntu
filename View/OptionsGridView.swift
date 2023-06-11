//
//  OptionsGridView.swift
//  TuglaliOruntu
//
//  Created by Furkan Erdoğan on 11.06.2023.
//

import Foundation
import SwiftUI


struct OptionsGridView: View {
    var gameManagerVM: GameManagerVM
    var columns: [GridItem] = Array(repeating: GridItem(.fixed(220), spacing: 0), count: 2)
    var body: some View {
        
        LazyVGrid(columns: columns, spacing: 20) {
            ForEach(gameManagerVM.model.quizModel.optionsList) { quizOption in
                OptionCardView(quizOption: quizOption)
                    .onTapGesture {
                        gameManagerVM.verifyAnswer(selectedOption: quizOption)
                    }
            }
        }
        
    }
    

}

struct OptionCardView : View {
    var quizOption: QuestionOption
    var body: some View {
        VStack {
            if (quizOption.isMatched) && (quizOption.isSelected) {
                OptionStatusImageView(imageName: "checkmark")
            } else if (!(quizOption.isMatched) && (quizOption.isSelected)) {
                OptionStatusImageView(imageName: "xmark")
            } else {
                OptionView(quizOption: quizOption)
            }
        }.frame(width: 100, height: 100)
            .background(setBackgroundColor())
            .cornerRadius(20)
    }
    
    func setBackgroundColor() -> Color {
        if (quizOption.isMatched) && (quizOption.isSelected) {
            return Color.green
        } else if (!(quizOption.isMatched) && (quizOption.isSelected)) {
            return Color.red
        } else {
            return Color.white
        }
    }
}

struct OptionView: View {
    var quizOption: QuestionOption
    var body: some View {
        VStack{
            
            Text(quizOption.option)
                .frame(width: 150, height: 38)
                .font(.system(size: 30, weight: .bold, design: .rounded))
                .foregroundColor(.black)
            
            Text(quizOption.optionId)
                .font(.system(size: 20, weight: .bold, design: .rounded))
                .frame(width: 30, height: 30)
                .background(quizOption.color.opacity(0.8))
                .foregroundColor(.white)
                .cornerRadius(15)
            
            
        }
    }
}

struct OptionStatusImageView: View {
    var imageName: String
    var body: some View {
        Image(systemName: imageName)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .padding(EdgeInsets(top: 40, leading: 40, bottom: 40, trailing: 40))
            .foregroundColor(Color.white)
    }
}
