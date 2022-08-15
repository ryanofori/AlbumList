//
//  AlbumCell.swift
//  AlbumList
//
//  Created by Ryan Ofori on 8/12/22.
//

import Foundation
import UIKit
class AlbumCell: UITableViewCell {
    
    @IBOutlet weak var albumArt: UIImageView!
    
    @IBOutlet weak var albumName: UILabel!
    
    //    var albumArt: UIImageView = {
//       let image = UIImageView()
//        image.contentMode = .scaleToFill
//        image.translatesAutoresizingMaskIntoConstraints = false
//        image.backgroundColor = .purple
//        return image
//    }()
    
//    var albumName: UILabel = {
//        let label = UILabel()
//        label.translatesAutoresizingMaskIntoConstraints = false
//        label.backgroundColor = .green
//        return label
//    }()
    
//    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
//        super.init(style: style, reuseIdentifier: reuseIdentifier)
//        [albumArt, albumName].forEach{ contentView.addSubview($0) }
//        albumArt.topAnchor.constraint(equalTo: contentView.layoutMarginsGuide.topAnchor, constant: 5).isActive = true
//        albumArt.leadingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.leadingAnchor, constant: 5).isActive = true
//        albumArt.bottomAnchor.constraint(equalTo: contentView.layoutMarginsGuide.bottomAnchor, constant: 5).isActive = true
//        albumArt.widthAnchor.constraint(equalToConstant: 36).isActive = true
//        albumArt.heightAnchor.constraint(equalToConstant: 36).isActive = true
//        albumArt.backgroundColor = .orange
//
//        albumName.leadingAnchor.constraint(equalTo: albumArt.trailingAnchor, constant: 4).isActive = true
//        albumName.trailingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.trailingAnchor,constant: -5).isActive = true
//    }
    
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
}
