//
//  ContentView.swift
//  P12-SlotMachine
//
//  Created by Yuriy Gudimov on 10.12.24.
//

import SwiftUI

struct ContentView: View {
    //MARK: - PROPERTIES
    
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
                        Text("100")
                            .scoreNumberStyle()
                            .scoreNumberModifier()
                    }
                    .scoreContainerModifier()
                    
                    Spacer()
                    
                    HStack {
                        Text("200")
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
                        Image("gfx-bell")
                            .resizable()
                            .imageModifier()
                    }
                    
                    HStack(alignment: .center, spacing: 0) {
                        //MARK: - REEL 2
                        ZStack {
                            ReelView()
                            Image("gfx-seven")
                                .resizable()
                                .imageModifier()
                        }
                        
                        Spacer()
                        
                        //MARK: - REEL 3
                        ZStack {
                            ReelView()
                            Image("gfx-cherry")
                                .resizable()
                                .imageModifier()
                        }
                    }
                    .frame(maxWidth: 500)
                    
                    //MARK: - SPIN BUTTON
                    Button {
                        print("spin")
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
                            print("bet")
                        } label: {
                            Text("20")
                                .foregroundStyle(.white)
                                .betNumberModifier()
                        }
                        .betCapsuleModifier()
                        
                        Image("gfx-casino-chips")
                            .resizable()
                            .opacity(0)
                            .casinoChipsModifier()
                    }
                    
                    //MARK: - BET 10
                    HStack(alignment: .center, spacing: 10) {
                        Image("gfx-casino-chips")
                            .resizable()
                            .opacity(1)
                            .casinoChipsModifier()
                        Button {
                            print("bet")
                        } label: {
                            Text("10")
                                .foregroundStyle(.colorYellow)
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
                    print("reset")
                }, label: {
                    Image(systemName: "arrow.2.circlepath.circle")
                })
                .buttonModifier()
                , alignment: .topLeading
            )
            .overlay(
                // INFO
                Button(action: {
                    print("info")
                }, label: {
                    Image(systemName: "info.circle")
                })
                .buttonModifier()
                , alignment: .topTrailing
            )
            .padding()
            .frame(maxWidth: 720)
        } //: ZSTACK
    }
}

//MARK: - PREVIEW

#Preview {
    ContentView()
}
