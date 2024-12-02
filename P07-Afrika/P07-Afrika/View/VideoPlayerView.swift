//
//  VideoPlayerView.swift
//  P07-Afrika
//
//  Created by Yuriy Gudimov on 02.12.24.
//

import SwiftUI
import AVKit

struct VideoPlayerView: View {
    let videoSelected: String
    let videoTitle: String
    var body: some View {
        VStack {
            VideoPlayer(player: playVideo(fileName: videoSelected, fileExtension: "mp4"))
                .overlay (
                    Image("logo")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 32, height: 32)
                        .padding(.vertical, 6)
                        .padding(.horizontal, 8)
                    , alignment: .topLeading
                )
        }//: VSTACK
        .accentColor(.accent)
        .navigationBarTitle(videoTitle)
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    NavigationView {
        VideoPlayerView(videoSelected: "lion", videoTitle: "Lion")
    }
}
