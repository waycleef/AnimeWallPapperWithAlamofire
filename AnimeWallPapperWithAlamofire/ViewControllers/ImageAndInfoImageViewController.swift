//
//  ImageAndInfoImageViewController.swift
//  AnimeWallPapperWithAlamofire
//
//  Created by Алишер Маликов on 21.12.2022.
//

import UIKit

class ImageAndInfoImageViewController: UIViewController {

    @IBOutlet var animeImage: UIImageView!
    @IBOutlet var animeInfoLabel: UILabel!
    @IBOutlet var activityIndicator: UIActivityIndicatorView!
    
    var links: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        activityIndicator.startAnimating()
        activityIndicator.hidesWhenStopped = true
        
        getAnimeWallPapper { [weak self] model in
            self?.getImage(from: model)
        }
    }

    @IBAction func saveImageAction(_ sender: Any) {
        let shareController = UIActivityViewController(activityItems: [animeImage.image!], applicationActivities: nil)
        present(shareController, animated: true)
    }
    
    @IBAction func refreshAction(_ sender: Any) {
        getAnimeWallPapper { [weak self] model in
            self?.getImage(from: model)
        }
    }
    
    private func getAnimeWallPapper(completion: @escaping(AnimeImage) -> Void) {
        NetworkManager.shared.fetchInfo(from: links) { [weak self] result in
            switch result {
            case .success(let animeInfo):
                guard let animeImage = animeInfo.first else { return }
                self?.animeInfoLabel.text = animeImage.description
                self?.activityIndicator.stopAnimating()
                completion(animeImage)
            case .failure(let error):
                print(error)
            }
        }
    }
    
    private func getImage(from animeURL: AnimeImage) {
        NetworkManager.shared.fetchData(from: animeURL.url) { [weak self] result in
            switch result {
            case .success(let imageData):
                self?.animeImage.image = UIImage(data: imageData)
                print(imageData)
                self?.activityIndicator.stopAnimating()
            case .failure(let error):
                print(error)
            }
        }
    }
}
