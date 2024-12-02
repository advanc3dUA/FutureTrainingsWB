//
//  VideoListView.swift
//  P07-Afrika
//
//  Created by Yuriy Gudimov on 02.12.24.
//

import SwiftUI

struct VideoListView: View {
    @State private var videos: [Video] = Bundle.main.decode("videos.json")
    private let haptic = UIImpactFeedbackGenerator(style: .medium)
    
    var body: some View {
        NavigationView {
            List {                
                ForEach(videos) { video in
                    NavigationLink(destination: VideoPlayerView(videoSelected: video.id, videoTitle: video.name)) {
                        VideoListItemView(video: video)
                            .padding(.vertical, 8)
                    }
                }//: LOOP
            }//: LIST
            .listStyle(.insetGrouped)
            .navigationBarTitle("Videos")
            .navigationBarTitleDisplayMode(.inline)
        }//: NAVIGATION
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                Button {
                    videos.shuffle()
                    haptic.impactOccurred()
                } label: {
                    Image(systemName: "arrow.2.squarepath")
                }

            }
        }
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    NavigationView {
        VideoListView()
            .padding()
    }
}
