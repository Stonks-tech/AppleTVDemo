//
//  ShowsRepository.swift
//  AppleTVDemo
//
//  Created by Jakub Neukirch on 29/11/2023.
//

import Foundation

class ShowsRepository {
    private static let videoUrl = "https://storage.googleapis.com/video-streaming-tests/demo-video.mp4"
    private let _shows: [ShowDataModel] = [
        ShowDataModel(
            id: "1",
            title: "The Witcher",
            imageUrl: "https://www.themoviedb.org/t/p/w1066_and_h600_bestv2/foGkPxpw9h8zln81j63mix5B7m8.jpg",
            videoUrl: videoUrl
        ),
        ShowDataModel(
            id: "2",
            title: "Breaking Bad",
            imageUrl: "https://www.themoviedb.org/t/p/w1066_and_h600_bestv2/9faGSFi5jam6pDWGNd0p8JcJgXQ.jpg",
            videoUrl: videoUrl
        ),
        ShowDataModel(
            id: "3",
            title: "Bojack Horseman",
            imageUrl: "https://www.themoviedb.org/t/p/w1066_and_h600_bestv2/qFYDJUIFh8zgEDy3EvnHwhgOl0S.jpg",
            videoUrl: videoUrl
        ),
        ShowDataModel(
            id: "4",
            title: "Outlander",
            imageUrl: "https://www.themoviedb.org/t/p/w1066_and_h600_bestv2/nf3Vlxm3C9U1aKUUQHmKFZmxPSc.jpg",
            videoUrl: videoUrl
        )
    ]
    private let _movies: [ShowDataModel] = [
        ShowDataModel(
            id: "5",
            title: "Gladiator",
            imageUrl: "https://www.themoviedb.org/t/p/w1066_and_h600_bestv2/7PBXKqTDCsSZb3GATn94DfXoAGx.jpg",
            videoUrl: videoUrl
        ),
        ShowDataModel(
            id: "6",
            title: "BraveHeart",
            imageUrl: "https://www.themoviedb.org/t/p/w1066_and_h600_bestv2/vXhTr0cN54R0TbSD9iG5cuAEWcT.jpg",
            videoUrl: videoUrl
        )
    ]
    
    init(){}
    
    func getShows() -> [ShowDataModel] {
        return _shows
    }
    func getMovies() -> [ShowDataModel] {
        return _movies
    }
    
    func get(id: String) -> ShowDataModel {
        let all : [ShowDataModel] = _shows + _movies
        return all.first (where: { show in
            return show.id == id
        })!
    }
}
