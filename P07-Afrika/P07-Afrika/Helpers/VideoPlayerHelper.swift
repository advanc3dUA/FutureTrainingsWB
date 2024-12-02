//
//  VideoPlayerHelper.swift
//  P07-Afrika
//
//  Created by Yuriy Gudimov on 02.12.24.
//

import Foundation
import AVKit

var videoPlayer: AVPlayer?

func playVideo(fileName: String, fileExtension: String) -> AVPlayer {
    guard let url = Bundle.main.url(forResource: fileName, withExtension: fileExtension) else {
        fatalError("Couldn'e create URL for video \(fileName).\(fileExtension)")
    }
    videoPlayer = AVPlayer(url: url)
    videoPlayer?.play()
    return videoPlayer!
}
