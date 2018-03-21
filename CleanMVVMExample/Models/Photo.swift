//
//  Photo.swift
//  CleanMVVMExample
//
//  Created by Joe on 2018/3/20.
//  Copyright © 2018年 joe. All rights reserved.
//

import Foundation


struct Photo {
    let name: String
    let imageName: String
    var favorite: Bool = false
    
    init(name: String, imageName: String){
        self.name = name
        self.imageName = imageName
    }
    
    static var defaultPhotos: [Photo] = [Photo(name: "Bern", imageName: "bern.jpg"),
                                         Photo(name: "Ronda", imageName: "ronda.jpg"),
                                         Photo(name: "Cat", imageName: "cat.jpg"),
                                         Photo(name: "Hope", imageName: "hope.jpg"),
                                         Photo(name: "Sunset", imageName: "sunset.jpg"),
                                         Photo(name: "Snowboard", imageName: "snowboard.jpg"),
                                         Photo(name: "Remains", imageName: "remains.jpg"),
                                         Photo(name: "Boy", imageName: "boy.jpg"),
                                         Photo(name: "Bicycle", imageName: "bicycle.jpg"),
                                         Photo(name: "Skateboard", imageName: "skateboard.jpg")]
}
