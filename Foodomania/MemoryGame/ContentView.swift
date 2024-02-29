//
//  ContentView.swift
//  MemoryGame
//
//  Created by Manvendu Pathak on 28/02/24.
//

import SwiftUI

struct ContentView: View {
    private var fourColumnGrid = [GridItem(.flexible()),
                                  GridItem(.flexible()),
                                  GridItem(.flexible()),
                                  GridItem(.flexible())]
    
    private var sixColumnGrid =  [GridItem(.flexible()),
                                  GridItem(.flexible()),
                                  GridItem(.flexible()),
                                  GridItem(.flexible()),
                                  GridItem(.flexible()),
                                  GridItem(.flexible())]
    
    @State var cards = createCardList().shuffled()
    @State var MatchedCards = [Card]()
    @State var UserChoices = [Card]()
    
    
    var body: some View {
        GeometryReader{ geo in
            VStack{
                Text("Foodomania")
                    .font(.title)
                    .bold()
                
                LazyVGrid(columns:  fourColumnGrid, spacing: 5){
                    ForEach(cards){card in
                        CardView(card: card,
                                 width: Int(geo.size.width/4 - 10),
                                 MatchedCards: $MatchedCards,
                                 UserChoices: $UserChoices)
                        
                    }
                }
                .padding()
                
                VStack{
                    Text("Match these card to win")
                        .bold()
                    LazyVGrid(columns: sixColumnGrid, spacing: 2){
                        ForEach(cardValues, id: \.self){ cardValue in
                            if(!MatchedCards.contains(where: {$0.text  == cardValue})){
                                Text(cardValue)
                                    .font(.system(size: 35))
                                
                            }
                        }
                    }
                    .padding()
                }
            }
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
