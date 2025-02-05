//
//  HomeViewController.swift
//  P17-Viper-Example
//
//  Created by Yuriy Gudimov on 04.02.25.
//

import UIKit

protocol HomeViewInterface: AnyObject {
    func setupView()
    func setTitle(with title: String)
}

class HomeViewController: UIViewController {
    @IBOutlet weak var collectionView: UICollectionView!
    var presenter: HomePresenterInterface?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.notifyViewDidLoad()
    }
}

extension HomeViewController: HomeViewInterface, UICollectionViewDelegate {
    func setupView() {
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(BaseCollectionViewCell.self, forCellWithReuseIdentifier: "baseCell")
        collectionView.setCollectionViewLayout(createLayout(), animated: true)
    }
    func setTitle(with title: String) {
        self.title = title
    }
}

extension HomeViewController {
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
        presenter?.getItemCount ?? 1
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        presenter?.getSectionCount ?? 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "baseCell", for: indexPath) as? BaseCollectionViewCell else {
            return UICollectionViewCell()
        }
        cell.configureLabels(with: presenter?.getDataByIndex(indexPath.row) ?? BaseModel(title: "wrong", description: "wrong"))
        
        return cell
    }
}
