//
//  ImageAndInfoViewController.swift
//  ParsingFromJSON
//
//  Created by Алишер Маликов on 16.12.2022.
//

import UIKit

class ImageAndInfoViewController: UIViewController {
    
    @IBOutlet var animeImage: UIImageView!
    @IBOutlet var animeInfoLabel: UILabel!
    @IBOutlet var activityIndicator: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        activityIndicator.startAnimating()
        activityIndicator.hidesWhenStopped = true
        
        getAnimeWallPapper { [weak self] model in
            self?.getImage(from: model)
        }
    }
    
    private func getAnimeWallPapper(completion: @escaping(Waifu) -> Void) {
        NetworkManager.shared.fetch(AnimeModel.self, from: animeUrl) { [weak self] result in
            switch result {
            case .success(let animeInfo):
                guard let firstImage = animeInfo.images.first else { return }
                self?.animeInfoLabel.text = firstImage.description
                completion(firstImage)
            case .failure(let error):
                print(error)
            }
        }
    }
    
    private func getImage(from animeURL: Waifu) {
        NetworkManager.shared.fetchImage(from: animeURL.url) { [weak self] result in
            switch result {
            case .success(let imageData):
                self?.animeImage.image = UIImage(data: imageData)
                self?.activityIndicator.stopAnimating()
            case .failure(let error):
                print(error)
            }
        }
    }
    
}
