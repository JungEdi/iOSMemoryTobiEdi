//
//  StartGameView.swift
//  iOSMemoryTobiEdi
//
//  Created by Edi Jung on 02.11.22.
//

import SwiftUI

struct StartGameView: View {
    @ObservedObject
    var viewModel = StartGameViewModel()
    @State private var showingSheet = false
    
    var test = "Test"
    var body: some View {
        NavigationView {
            VStack{
                Spacer()
                Text("Modus: \(viewModel.gameType.rawValue)")
                Text("Schwierigkeit: \(viewModel.difficulty.rawValue)")
                Spacer()
                MenuSheetButton()
                Spacer()
                    NavigationLink(destination: Game()){
                        Text("Start Game")
                    }
                Spacer()
            }
        }
    }
    
    private func Game() -> some View {
        
            MemoryGameView(viewModel: EmojiMemoryGameViewModel())
    }
    
    
    fileprivate func MenuSheetButton() -> some View {
        Button("Change Settings") {
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

struct StartGameView_Previews: PreviewProvider {
    static var previews: some View {
        StartGameView()
    }
}
