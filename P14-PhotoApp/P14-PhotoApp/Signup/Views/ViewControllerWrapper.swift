//
//  ViewControllerWrapper.swift
//  P14-PhotoApp
//
//  Created by Yuriy Gudimov on 21.01.25.
//

import SwiftUI

struct ViewControllerWrapper: UIViewControllerRepresentable {
    let storyboardName: String
    let viewControllerIdentifier: String
    
    func makeUIViewController(context: Context) -> UIViewController {
        let storyboard = UIStoryboard(name: storyboardName, bundle: nil)
        return storyboard.instantiateViewController(withIdentifier: viewControllerIdentifier)
    }
    
    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {
        
    }
    
}
