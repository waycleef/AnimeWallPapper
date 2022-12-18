//
//  AnimeModel.swift
//  ParsingFromJSON
//
//  Created by Алишер Маликов on 13.12.2022.
//

struct Waifu: Decodable {
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
}

struct AnimeModel: Decodable {
    let images: [Waifu]
}
