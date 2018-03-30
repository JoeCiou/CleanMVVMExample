//
//  PhotoManager.swift
//  CleanMVVMExample
//
//  Created by Joe on 2018/3/30.
//  Copyright © 2018年 joe. All rights reserved.
//

import Foundation

enum PhotoSeries: Int {
    case first = 0
    case second
}

class PhotoManager {
    
    static let shared: PhotoManager = PhotoManager()

    private var seriesPhotos: [PhotoSeries: [Photo]] = [
        .first: [Photo(name: "Bern", imageName: "bern.jpg"),
                 Photo(name: "Ronda", imageName: "ronda.jpg"),
                 Photo(name: "Cat", imageName: "cat.jpg"),
                 Photo(name: "Hope", imageName: "hope.jpg"),
                 Photo(name: "Sunset", imageName: "sunset.jpg")],
        .second: [Photo(name: "Snowboard", imageName: "snowboard.jpg"),
                  Photo(name: "Remains", imageName: "remains.jpg"),
                  Photo(name: "Boy", imageName: "boy.jpg"),
                  Photo(name: "Bicycle", imageName: "bicycle.jpg"),
                  Photo(name: "Skateboard", imageName: "skateboard.jpg")]
    ]
    
    func photos(series: PhotoSeries) -> [Photo] {
        return seriesPhotos[series]!
    }
    
    func photo(series: PhotoSeries, index: Int) -> Photo {
        return seriesPhotos[series]![index]
    }
    
    func switchFavorite(series: PhotoSeries, index: Int) {
        if let favorite = seriesPhotos[series]?[index].favorite {
            seriesPhotos[series]?[index].favorite = !favorite
        }
    }
}
