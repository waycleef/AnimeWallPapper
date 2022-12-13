//
//  AnimeModel.swift
//  ParsingFromJSON
//
//  Created by Алишер Маликов on 13.12.2022.
//

struct Waifu: Decodable {
    let image_id: Int
    let source: String
    let is_nsfw: Bool
    let width: Int
    let height: Int
}

struct AnimeImages: Decodable {
    let images: [Waifu]
}
