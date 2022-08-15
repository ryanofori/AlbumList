//
//  ViewController.swift
//  AlbumList
//
//  Created by Ryan Ofori on 8/12/22.
//

import UIKit

class ViewController: UIViewController {
    
    
    var albumViewModel = AlbumViewModel()
    
    @IBOutlet weak var albumTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Top Albums"
        
        albumTableView.delegate = self
        albumTableView.dataSource = self
        
        NetworkManager.shared.getJSON(urlString: URLBuilder.album.rawValue) { (result: Result<AllAlbum, NetworkError>) in
            
            switch result {
            case .success(let searchResults):
                self.albumViewModel.albums = searchResults.feed.results
                DispatchQueue.main.async {
                    self.albumTableView.reloadData()
                }
                
            case .failure(let error):
                NSLog(error.localizedDescription)
            }
        }
        
    }
    
    
}


extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return albumViewModel.albums.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = albumTableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? AlbumCell
        cell?.albumName.text = albumViewModel.albums[indexPath.row].artistName
        cell?.albumArt.image = albumViewModel.albums[indexPath.row].artworkUrl100.toImage
        return cell ?? UITableViewCell()
        
    }
}

extension ViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        albumViewModel.passedIndex = indexPath.row
    }
    
}
