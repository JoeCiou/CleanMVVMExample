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
}
