//
//  HomeViewController.swift
//  P17-Viper-Example
//
//  Created by Yuriy Gudimov on 04.02.25.
//

import UIKit

protocol HomeViewProtocol: AnyObject {
    
}

class HomeViewController: UIViewController {
    @IBOutlet weak var collectionView: UICollectionView!
    private var listConfig = UICollectionLayoutListConfiguration(appearance: .insetGrouped)
//    var presenter: HomePresenterInterface?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
}

extension HomeViewController: HomeViewProtocol, UICollectionViewDelegate {
    func setupView() {
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(BaseCollectionViewCell.self, forCellWithReuseIdentifier: "baseCell")
        collectionView.setCollectionViewLayout(createLayout(), animated: true)
        title = "Home"
    }
    
    func createLayout() -> UICollectionViewCompositionalLayout {
        let layout = UICollectionViewCompositionalLayout { index, environment in
            var configuration = UICollectionLayoutListConfiguration(appearance: .insetGrouped)
            configuration.backgroundColor = .secondarySystemBackground
            configuration.headerMode = .none
            return .list(using: configuration, layoutEnvironment: environment)
        }
        return layout
    }
}

extension HomeViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "baseCell", for: indexPath) as? BaseCollectionViewCell else {
            return UICollectionViewCell()
        }
        
        cell.configureTitle(with: "Hello")
        cell.configureText(with: "World")
        
        return cell
    }
}
