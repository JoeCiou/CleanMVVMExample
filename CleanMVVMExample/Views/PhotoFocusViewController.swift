//
//  PhotoFocusViewController.swift
//  CleanMVVMExample
//
//  Created by Joe on 2018/3/20.
//  Copyright © 2018年 joe. All rights reserved.
//

import UIKit

class PhotoFocusViewController: UIViewController, PhotoViewModelDelegate {
    
    var photoViewModel: PhotoViewModelInterface!
    
    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var photoNameLabel: UILabel!
    @IBOutlet weak var photoFavoriteButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        photoViewModel.delegate = self
        photoImageView.image = UIImage(named: photoViewModel.imageName)
        photoNameLabel.text = photoViewModel.name
        let favoriteIcon = UIImage(named: photoViewModel.favorite ? "ic_favorite": "ic_favorite_border")
        photoFavoriteButton.setImage(favoriteIcon, for: .normal)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        photoViewModel.delegate = nil
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func handlePhotoFavoriteClick(_ sender: Any) {
        photoViewModel.switchFavorite()
    }
    
    @IBAction func handleBackClick(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    // MARK: - Photo view model delegate
    
    func photoViewModelDidUpdateFavorite() {
        let favoriteIcon = UIImage(named: photoViewModel.favorite ? "ic_favorite": "ic_favorite_border")
        photoFavoriteButton.setImage(favoriteIcon, for: .normal)
    }
}
