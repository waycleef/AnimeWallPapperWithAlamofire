//
//  NetworkManager.swift
//  AnimeWallPapperWithAlamofire
//
//  Created by Алишер Маликов on 21.12.2022.
//

import Foundation
import Alamofire

// included_tags maid, waifu, marin-kitagawa, mori-calliope, raiden-shigun, oppai, selfies, uniform
// ass, hentai, milf, oral, paizuri, ecchi, ero
enum Links: String {
    case animeUrl = "https://api.waifu.im/search/?"
    case maid = "&included_tags=maid"
    case waifu = "&included_tags=waifu"
    case marinkitagawa = "&included_tags=marin-kitagawa"
    case moricalliope = "&included_tags=mori-calliope"
    case raidenshigun = "&included_tags=raiden-shigun"
    case oppai = "&included_tags=oppai"
    case selfies = "&included_tags=selfies"
    case uniform = "&included_tags=uniform"
    case ass = "&included_tags=ass"
    case hentai = "&included_tags=hentai"
    case milf = "&included_tags=milf"
    case oral = "&included_tags=oral"
    case paizuri = "&included_tags=paizuri"
    case ecchi = "&included_tags=ero"
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
