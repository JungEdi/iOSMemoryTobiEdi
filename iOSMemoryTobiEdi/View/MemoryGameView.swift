//
//  EmojiMemoryGameView.swift
//  iOSMemoryTobiEdi
//
//  Created by Tobi Wyss on 13.10.22.
//

import SwiftUI

struct MemoryGameView: View {
    @State private var showingSheet = false
    @State private var gameStarted = false
    @ObservedObject var viewModel: EmojiMemoryGameViewModel
    
    var body: some View {
        VStack{
            if !viewModel.gameStarted {
                MenuSheetButton()
            } else {
                ScrollView {
                    LazyVGrid(columns: [GridItem(.adaptive(minimum: 65))]){
                        ForEach(viewModel.cards) { card in
                            CardView(card: card)
                                .aspectRatio(3/4, contentMode: .fit)
                                .onTapGesture {
                                    self.viewModel.choose(card: card)
                                }
                        }
                    }.padding()
                }
            }
        }
    }
    
    fileprivate func MenuSheetButton() -> some View {
        Button("Start game") {
            showingSheet.toggle()
        }
            .sheet(isPresented: $showingSheet) {
                SheetView(viewModel: viewModel)
            }
    }
    
    fileprivate func toggleSheet() -> Void {
        showingSheet.toggle();
        
    }
}



struct CardView: View {
    
    var card: MemoryGameModel<String>.Card
    
    var body: some View {
        GeometryReader{geometry in
            self.body(for: geometry.size)
        }
    }
    
    
    @ViewBuilder
    func body(for size: CGSize) -> some View {
        if card.isFaceUp || !card.isMatched {
            ZStack{
                Pie(startAngle: Angle(degrees: 0-90), endAngle: Angle(degrees: 110-90), clockwise: true)
                    .padding(5)
                    .opacity(0.4)
                Text(card.content)
                    .font(Font.system(size: fontSize(for: size)))
            }.aspectRatio(0.75, contentMode: .fit).cardify(isFaceUp: card.isFaceUp).foregroundColor(.blue)
        }
    }
    
    // MARK: - Drawing Constants

    func fontSize(for size: CGSize) -> CGFloat {
        min(size.width, size.height) * 0.75
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let game = EmojiMemoryGameViewModel()
        game.choose(card: game.cards.first!)

        return MemoryGameView(viewModel: game)
    }
}

