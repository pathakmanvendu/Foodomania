//
//  CardView.swift
//  MemoryGame
//
//  Created by Manvendu Pathak on 28/02/24.
//

import SwiftUI

struct CardView: View {
    @ObservedObject var card: Card
    let width: Int
    
     @Binding var MatchedCards: [Card]
     @Binding var UserChoices: [Card] 
    
    var body: some View {
        if card.isFaceUp || MatchedCards.contains(where: {$0.id == card.id}){
            Text(card.text)
                .font(.system(size: 50))
                .padding()
                .frame(width: CGFloat(width), height: CGFloat(width))
                .background(Color(.purple))
                .cornerRadius(15)
                .overlay(
                   RoundedRectangle(cornerRadius: 10)
                    .stroke(Color(.black),lineWidth: 5)
                )
        
        }else {
            Text("?")
                .font(.system(size: 50))
                .padding()
                .frame(width: CGFloat(width), height: CGFloat(width))
                .background(Color(.purple))
                .cornerRadius(15)
                .overlay(
                   RoundedRectangle(cornerRadius: 10)
                    .stroke(Color(.black),lineWidth: 5)
                )
                .onTapGesture {
                    if UserChoices.count  == 0 {
                        card.turnOver()
                        UserChoices.append(card)
                    } else if UserChoices.count == 1{
                        card.turnOver()
                        UserChoices.append(card)
                        withAnimation(Animation.linear.delay(1)){
                            for thisCard in UserChoices {
                                thisCard.turnOver()
                            }
                        }
                        checkForMatch()
                    }
                   
                }
        }
    }
    
    func checkForMatch() {
        if UserChoices[0].text == UserChoices[1].text {
            MatchedCards.append(UserChoices[0])
            MatchedCards.append(UserChoices[1])
        }
        UserChoices.removeAll()
    }
    
    
    
}

