//
//  AnimeWallPapperModel.swift
//  AnimeWallPapperWithAlamofire
//
//  Created by Алишер Маликов on 21.12.2022.
//

import Foundation

struct AnimeImage: Decodable {
    let imageId: Int
    let source: String
    let url: String
    let isNsfw: Bool
    let width: Int
    let height: Int
    
    var description: String {
        """
        Image ID: \(imageId)
        Source: \(source)
        Is NSFW: \(isNsfw)
        Width: \(width)
        Height: \(height)
        """
    }
    
    init(wallPapperInfo: [String: Any]) {
        imageId = wallPapperInfo["image_id"] as? Int ?? 0
        source = wallPapperInfo["source"] as? String ?? ""
        url = wallPapperInfo["url"] as? String ?? ""
        isNsfw = wallPapperInfo["is_nsfw"] as? Bool ?? false
        width = wallPapperInfo["width"] as? Int ?? 0
        height = wallPapperInfo["height"] as? Int ?? 0
    }
    
    init(imageId: Int, source: String, url: String, isNsfw: Bool, width: Int, height: Int) {
        self.imageId = imageId
        self.source = source
        self.url = url
        self.isNsfw = isNsfw
        self.width = width
        self.height = height
    }
    
    static func getAnimeImages(from value: Any) -> [AnimeImage] {
        guard let value = value as? [String : Any] else { return [] }
        guard let images = value["images"] as? [[String: Any]] else { return [] }
        return images.compactMap { AnimeImage(wallPapperInfo: $0)}
    }
}

//struct AnimeModel: Decodable {
//    let images: [AnimeImage]
//
//    init(animeInfo: [String: Any]) {
//        images = animeInfo["images"] as? [AnimeImage] ?? []
//    }
//
//    init(images: [AnimeImage]) {
//        self.images = images
//    }
//}
