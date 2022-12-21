//
//  NetworkManager.swift
//  AnimeWallPapperWithAlamofire
//
//  Created by Алишер Маликов on 21.12.2022.
//

import Foundation
import Alamofire

enum Links: String {
    case animeUrl = "https://api.waifu.im/search/?included_tags=selfies"
}

class NetworkManager {
    static let shared = NetworkManager()
    
    private init() {}
    
    func fetchInfo(from url: String, completion: @escaping(Result<[AnimeImage], AFError>) -> Void) {
        AF.request(url)
            .validate()
            .responseJSON { dataResponse in
                switch dataResponse.result {
                case .success(let data):
                    let animeImage = AnimeImage.getAnimeImages(from: data)
                    completion(.success(animeImage))
                case .failure(let error):
                    completion(.failure(error))
                }
            }
    }
    
    func fetchData(from url: String, completion: @escaping(Result<Data, AFError>) -> Void) {
        AF.request(url)
            .validate()
            .responseData { dataResponse in
                switch dataResponse.result {
                case .success(let imageData):
                    completion(.success(imageData))
                case .failure(let error):
                    completion(.failure(error))
                }
            }
        }
    
}
