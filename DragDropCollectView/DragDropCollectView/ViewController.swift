//
//  ViewController.swift
//  DragDropCollectView
//
//  Created by yeonBlue on 2021/05/20.
//


import UIKit

private let reuseIdentifier = "cell"
class ViewController: UIViewController {

    // MARK: - Properties
    fileprivate var imageNames: [UIImageView] = []
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupImages()
        setupCollectionView()
    }
    
    // MARK: - SetUp
    func setupImages() {
        (1...8).forEach { i in
            imageNames.append(UIImageView(image: UIImage(named: "\(i)")))
        }
    }
    
    func setupCollectionView() {
        let collectionView = UICollectionView(frame: view.frame, collectionViewLayout: UICollectionViewFlowLayout())
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        
        collectionView.backgroundColor = .clear
        view.addSubview(collectionView)
    }
}

// MARK: - UICollectionViewDataSource/Delegate
extension ViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imageNames.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath)
        let cellImage = imageNames[indexPath.row]
        cellImage.contentMode = .scaleToFill
        cellImage.clipsToBounds = true
        
        cell.contentView.addSubview(cellImage)
        
        cellImage.translatesAutoresizingMaskIntoConstraints = false
        cellImage.topAnchor.constraint(equalTo: cell.topAnchor, constant: 3).isActive = true
        cellImage.bottomAnchor.constraint(equalTo: cell.bottomAnchor, constant: -3).isActive = true
        cellImage.leadingAnchor.constraint(equalTo: cell.leadingAnchor, constant: 3).isActive = true
        cellImage.trailingAnchor.constraint(equalTo: cell.trailingAnchor, constant: -3).isActive = true
        
        return cell
    }
}

// MARK: - UICollectionViewDelegateFlowLayout
extension ViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.frame.width / 3.0
        return CGSize(width: width, height: width)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}
