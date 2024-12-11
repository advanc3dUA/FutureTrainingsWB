//
//  ContentView.swift
//  P12-SlotMachine
//
//  Created by Yuriy Gudimov on 10.12.24.
//

import SwiftUI

struct ContentView: View {
    //MARK: - PROPERTIES
    @State private var isShowingSheet = false
    let symbols = ["gfx-bell", "gfx-cherry", "gfx-coin", "gfx-grape", "gfx-seven", "gfx-strawberry"]
    @State private var reels = [0, 1, 2]
    @AppStorage("highScore") private var highScore: Int = 0
    @State private var coins: Int = 100
    @State private var betAmount: Int = 10
    @State private var isActiveBet10 = true
    @State private var isActiveBet20 = false
    @State private var showingModal = false
    @State private var isAnimatingSymbols = false
    @State private var isAnimatingModal = false
    
    //MARK: - FUNCTIONS
    
    private func spinReels() {
        reels = reels.map({ _ in
            Int.random(in: 0...symbols.count - 1)
        })
    }
    
    private func checkWinning() {
        if reels.allSatisfy({ $0 == reels.first }) {
            playerWins()
            
            if coins > highScore {
                newHighScore()
            }
            
        } else {
            playerLooses()
        }
    }
    
    private func playerWins() {
        coins += betAmount * 10
    }
    
    private func newHighScore() {
        highScore = coins
    }
    
    private func playerLooses() {
        coins -= betAmount
    }
    
    private func activateBet20() {
        betAmount = 20
        isActiveBet20 = true
        isActiveBet10 = false
    }
    
    private func activateBet10() {
        betAmount = 10
        isActiveBet10 = true
        isActiveBet20 = false
    }
    
    private func isGameOver() {
        if coins <= 0 {
            showingModal = true
        }
    }
    
    private func resetGame() {
        highScore = 0
        coins = 100
        activateBet10()
    }
    
    //MARK: - BODY
    
    var body: some View {
        ZStack {
            //MARK: - BACKGROUND
            LinearGradient(
                colors: [.colorPink, .colorPurple],
                startPoint: .top,
                endPoint: .bottom
            )
            .edgesIgnoringSafeArea(.all)
            
            //MARK: - INTERFACE
            
            //MARK: - POPUP
            VStack(alignment: .center, spacing: 5) {
                //MARK: - HEADER
                
                LogoView()
                
                Spacer()
                
                //MARK: - SCORE
                
                HStack {
                    HStack {
                        Text("Your\nCoins".uppercased())
                            .scoreLabelStyle()
                            .multilineTextAlignment(.center)
                        Text("\(coins)")
                            .scoreNumberStyle()
                            .scoreNumberModifier()
                    }
                    .scoreContainerModifier()
                    
                    Spacer()
                    
                    HStack {
                        Text("\(highScore)")
                            .scoreNumberStyle()
                            .scoreNumberModifier()
                        Text("High\nScore".uppercased())
                            .scoreLabelStyle()
                            .multilineTextAlignment(.leading)
                    }
                    .scoreContainerModifier()
                }
                //MARK: - SLOT MACHINE
                
                VStack(alignment: .center, spacing: 0) {
                    //MARK: - REEL 1
                    ZStack {
                        ReelView()
                        Image(symbols[reels[0]])
                            .resizable()
                            .imageModifier()
                            .opacity(isAnimatingSymbols ? 1 : 0)
                            .offset(y: isAnimatingSymbols ? 0 : -50)
                            .animation(.easeIn(duration: Double.random(in: 0.5...0.7)), value: isAnimatingSymbols)
                    }
                    .onAppear {
                        isAnimatingSymbols.toggle()
                    }
                    
                    HStack(alignment: .center, spacing: 0) {
                        //MARK: - REEL 2
                        ZStack {
                            ReelView()
                            Image(symbols[reels[1]])
                                .resizable()
                                .imageModifier()
                                .opacity(isAnimatingSymbols ? 1 : 0)
                                .offset(y: isAnimatingSymbols ? 0 : -50)
                                .animation(.easeIn(duration: Double.random(in: 0.7...0.9)), value: isAnimatingSymbols)
                        }
                        .onAppear {
                            isAnimatingSymbols.toggle()
                        }
                        
                        Spacer()
                        
                        //MARK: - REEL 3
                        ZStack {
                            ReelView()
                            Image(symbols[reels[2]])
                                .resizable()
                                .imageModifier()
                                .opacity(isAnimatingSymbols ? 1 : 0)
                                .offset(y: isAnimatingSymbols ? 0 : -50)
                                .animation(.easeIn(duration: Double.random(in: 0.9...1.1)), value: isAnimatingSymbols)
                        }
                        .onAppear {
                            isAnimatingSymbols.toggle()
                        }
                    }
                    .frame(maxWidth: 500)
                    
                    //MARK: - SPIN BUTTON
                    Button {
                        withAnimation {
                            isAnimatingSymbols = false
                        }
                        spinReels()
                        withAnimation {
                            isAnimatingSymbols = true
                        }
                        checkWinning()
                        isGameOver()
                    } label: {
                        Image("gfx-spin")
                            .renderingMode(.original)
                            .resizable()
                            .imageModifier()
                    }

                    
                } //: SLOT MACHINE
                .layoutPriority(2)
                
                //MARK: - FOOTER
                
                Spacer()
                
                HStack {
                    //MARK: - BET 20
                    HStack(alignment: .center, spacing: 10) {
                        Button {
                            activateBet20()
                        } label: {
                            Text("20")
                                .foregroundStyle(isActiveBet20 ? .colorYellow : .white)
                                .betNumberModifier()
                        }
                        .betCapsuleModifier()
                        
                        Image("gfx-casino-chips")
                            .resizable()
                            .offset(x: isActiveBet20 ? 0 : 20)
                            .opacity(isActiveBet20 ? 1 : 0)
                            .animation(.easeOut, value: isActiveBet20)
                            .casinoChipsModifier()
                    }
                    
                    Spacer()
                    
                    //MARK: - BET 10
                    HStack(alignment: .center, spacing: 10) {
                        Image("gfx-casino-chips")
                            .resizable()
                            .offset(x: isActiveBet10 ? 0 : -20)
                            .opacity(isActiveBet10 ? 1 : 0)
                            .animation(.easeOut, value: isActiveBet10)
                            .casinoChipsModifier()
                        Button {
                            activateBet10()
                        } label: {
                            Text("10")
                                .foregroundStyle(isActiveBet10 ? .colorYellow : .white)
                                .betNumberModifier()
                        }
                        .betCapsuleModifier()
                        
                    }
                }
            }
            //MARK: - BUTTONS
            .overlay(
                // RESET
                Button(action: {
                    resetGame()
                }, label: {
                    Image(systemName: "arrow.2.circlepath.circle")
                })
                .buttonModifier()
                , alignment: .topLeading
            )
            .overlay(
                // INFO
                Button(action: {
                    withAnimation {
                        isShowingSheet.toggle()
                    }
                }, label: {
                    Image(systemName: "info.circle")
                })
                .buttonModifier()
                , alignment: .topTrailing
            )
            .padding()
            .frame(maxWidth: 720)
            .blur(radius: $showingModal.wrappedValue ? 5 : 0, opaque: false)
            
            if $showingModal.wrappedValue {
                ZStack {
                    Color.colorTransparentBlack.edgesIgnoringSafeArea(.all)
                    
                    VStack(spacing: 0) {
                        Text("Game Over".uppercased())
                            .font(.system(.title, design: .rounded, weight: .heavy))
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(.colorPink)
                            .foregroundStyle(.white)
                        
                        Spacer()
                        
                        VStack(alignment: .center, spacing: 16) {
                            Image("gfx-seven-reel")
                                .resizable()
                                .scaledToFit()
                                .frame(maxHeight: 72)
                            
                            Text("Bad luck! You lost all of the coins.\nLet's play again!")
                                .font(.system(.body, design: .rounded, weight: .medium))
                                .lineLimit(2)
                                .multilineTextAlignment(.center)
                                .foregroundStyle(.gray)
                                .layoutPriority(1)
                            
                            Button {
                                showingModal = false
                                isAnimatingModal = false
                                activateBet10()
                                coins = 100
                            } label: {
                                Text("New Game".uppercased())
                                    .font(.system(.body, design: .rounded, weight: .semibold))
                                    .tint(.colorPink)
                                    .padding(.horizontal, 12)
                                    .padding(.vertical, 8)
                                    .frame(minWidth: 128)
                                    .background(
                                        Capsule()
                                            .strokeBorder(lineWidth: 1.75)
                                            .tint(.colorPink)
                                    )
                            }
                        }
                        
                        Spacer()
                    }
                    .frame(minWidth: 280, idealWidth: 280, maxWidth: 320, minHeight: 260, idealHeight: 280, maxHeight: 320, alignment: .center)
                    .background(.white)
                    .cornerRadius(20)
                    .shadow(color: .colorTransparentBlack, radius: 6, x: 0, y: 8)
                    .opacity(isAnimatingModal ? 1 : 0)
                    .offset(y: isAnimatingModal ? 0 : -100)
                    .onAppear {
                        withAnimation(.spring(response: 0.6, dampingFraction: 1.0, blendDuration: 1.0)) {
                            isAnimatingModal = true
                        }
                    }
                }
            }
            
        } //: ZSTACK
        .sheet(isPresented: $isShowingSheet) {
            InfoView()
        }
    }
}

//MARK: - PREVIEW

#Preview {
    ContentView()
}
