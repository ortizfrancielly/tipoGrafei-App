//
//  ResultModalView.swift
//  tipoGrafei
//
//  Created by Marcos Chevis on 01/07/21.
//

import Foundation
import UIKit

class ResultModalView: UIView {
    
    
    lazy var resultsCollectionView: UICollectionView = {
        let collection = UICollectionView(frame: self.frame, collectionViewLayout: UICollectionViewLayout())
        collection.translatesAutoresizingMaskIntoConstraints = false
        collection.backgroundColor = .systemYellow
        
        return collection
    }()
    
    var database: [FontInfo] = FontsDatabase().database
    var formData: FormDataSingleton = .shared
    var filteredDatabase: [FontInfo] = []
    
    var rowIdentifier = "ResultCell"
    

    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(resultsCollectionView)
        
        resultsCollectionView.register(CollectionViewResultCell.self, forCellWithReuseIdentifier: rowIdentifier)
        resultsCollectionView.dataSource = self
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: resultsCollectionView.bounds.width-50, height: resultsCollectionView.bounds.height * 0.45)
        layout.minimumLineSpacing = 15
        resultsCollectionView.collectionViewLayout = layout
        resultsCollectionView.showsVerticalScrollIndicator = false
    
        setupConstraints()

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupConstraints() {
        let constaints: [NSLayoutConstraint] = [
            resultsCollectionView.topAnchor.constraint(equalTo: self.topAnchor),
            resultsCollectionView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            resultsCollectionView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            resultsCollectionView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
        ]
        NSLayoutConstraint.activate(constaints)
    }
    
    func updateCollection() {
        filteredDatabase = filterDatabase(hasSerif: formData.hasSerif, family: formData.fontFamily)
        resultsCollectionView.reloadData()
    }
    
    func filterDatabase(hasSerif: Bool, family: FontFamily) -> [FontInfo] {
        
        var filteredDatabase: [FontInfo] = []
        for font in database {
            
            if font.hasSerif == hasSerif && font.family == family {
                filteredDatabase.append(font)
            }
        }
        return filteredDatabase
    }
}

extension ResultModalView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return filteredDatabase.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let resultCell = collectionView.dequeueReusableCell(withReuseIdentifier: rowIdentifier, for: indexPath) as! CollectionViewResultCell
        let font: FontInfo = filteredDatabase[indexPath.row]
        
        resultCell.letterLabel.font = UIFont(name: font.name, size: 50)
        resultCell.letterLabel.textColor = .white
        
        resultCell.fontNameLabel.text = font.name
        resultCell.fontNameLabel.font = UIFont(name: font.name, size: 25)
        
        resultCell.exampleLabel.font = UIFont(name: font.name, size: 20)
        
        resultCell.exampleTextView.font = UIFont(name: font.name, size: 18)
        
        return resultCell
    }
    
    
}

extension ResultModalView: UICollectionViewDelegate {
    
}
