//
//  ViewController.swift
//  AlbumList
//
//  Created by Ryan Ofori on 8/12/22.
//

import UIKit

class ViewController: UIViewController {
    
    var albums = [AResult]()
    
    @IBOutlet weak var albumTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        albumTableView.delegate = self
        albumTableView.dataSource = self
        NetworkManager.shared.getJSON(urlString: URLBuilder.album.rawValue) { (result: Result<AllAlbum, NetworkError>) in
            switch result {
            case .success(let searchResults):
                self.albums = searchResults.feed.results
//                albumTableView.reloadData()
            case .failure(let error):
                print(error, error.localizedDescription)
            }
        }
    }
    
    
}


extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = albumTableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        return cell
    }
    
    
}

extension ViewController: UITableViewDelegate {
    
}
