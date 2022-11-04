//
//  PhotoGridViewController.swift
//  31th IN_SOPT_First_Seminar
//
//  Created by Joon Baek on 2022/10/27.
//

import UIKit

import Then
import SnapKit
import SwiftyColor

//MARK: - PhotoGridViewController

final class PhotoGridViewController: UIViewController {
    
    //MARK: - Lazy Components
    
    private lazy var photoGridCollectionView:UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.isScrollEnabled = true
        collectionView.showsVerticalScrollIndicator = false
        collectionView.backgroundColor = .clear
        return collectionView
    }()
    
    //MARK: - Variables
    
    let photoLists:[String] = [
        "galleryImage1",
        "galleryImage2",
        "galleryImage3",
        "galleryImage4",
        "galleryImage5",
        "galleryImage6",
        "galleryImage7",
        "galleryImage8",
        "galleryImage9",
        "galleryImage10",
        "galleryImage11",
        "galleryImage12",
        "galleryImage13",
        "galleryImage14",
        "galleryImage15",
        "galleryImage16",
        "galleryImage17",
        "galleryImage18",
        "galleryImage19",
        "galleryImage20",
        "galleryImage21",
        "galleryImage22",
        "galleryImage23"
    ]
    
    //MARK: - Constants
    
    final let photoListInset: UIEdgeInsets = UIEdgeInsets(top: 38, left: 0, bottom: 0, right: 0)
    final let photoListLineSpacing: CGFloat = 7
    final let photoListInterItemSpacing: CGFloat = 9
    final let photoCellHeight: CGFloat = 119
    
    
    //MARK: - Life Cycles
    
    override func viewDidLoad() {
        super.viewDidLoad()
        layout()
        register()
        configDelegate()
    }
}

//MARK: - Extensions

extension PhotoGridViewController {
    
    //MARK: - Layout Helpers
    
    private func layout() {
        view.addSubview(photoGridCollectionView)
        
        photoGridCollectionView.snp.makeConstraints {
            $0.top.leading.trailing.equalTo(view.safeAreaLayoutGuide)
            $0.bottom.equalToSuperview()
            $0.height.equalTo(calculateCellHeight())
        }
    }
    
    //MARK: - General Helpers
    
    private func register() {
        photoGridCollectionView.register(PhotoGridCollectionViewCell.self, forCellWithReuseIdentifier: PhotoGridCollectionViewCell.identifier)
    }
    
    private func configDelegate() {
        photoGridCollectionView.delegate = self
        photoGridCollectionView.dataSource = self
    }
    
    private func calculateCellHeight() -> CGFloat {
        let count = CGFloat(photoLists.count)
        let heightCount = count / 3 + count.truncatingRemainder(dividingBy: 3)
        return heightCount * photoCellHeight + (heightCount - 1) * photoListLineSpacing + photoListInset.top + photoListInset.bottom
    }
    
    //MARK: - Action Helpers
    
}

//MARK: - UICollectionViewDelegateFlowLayout

extension PhotoGridViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let screenWidth = UIScreen.main.bounds.width
        let photoCellWidth = screenWidth - photoListInset.left - photoListInset.right - photoListInterItemSpacing * 2
        return CGSize(width: photoCellWidth, height: photoCellWidth)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return photoListLineSpacing
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        photoListInterItemSpacing
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        photoListInset
    }
}

//MARK: - UICollectionViewDataSource

extension PhotoGridViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photoLists.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let photoCell = collectionView.dequeueReusableCell(withReuseIdentifier: PhotoGridCollectionViewCell.identifier, for: indexPath) as? PhotoGridCollectionViewCell else { return UICollectionViewCell() }
        photoCell.dataBind(imageName: photoLists[indexPath.item])
        return photoCell
    }
}
