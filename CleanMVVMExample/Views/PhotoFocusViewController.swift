//
//  PhotoFocusViewController.swift
//  CleanMVVMExample
//
//  Created by Joe on 2018/3/20.
//  Copyright © 2018年 joe. All rights reserved.
//

import UIKit

class PhotoFocusViewController: UIViewController, PhotoViewModelDelegate {
    
    var viewModel: PhotoViewModel!
    
    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var photoNameLabel: UILabel!
    @IBOutlet weak var photoFavoriteButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel.delegate = self
        photoImageView.image = UIImage(named: viewModel.imageName)
        photoNameLabel.text = viewModel.name
        let favoriteIcon = UIImage(named: viewModel.favorite ? "ic_favorite": "ic_favorite_border")
        photoFavoriteButton.setImage(favoriteIcon, for: .normal)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        viewModel.delegate = nil
        navigationController?.setNavigationBarHidden(false, animated: true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func handlePhotoFavoriteClick(_ sender: Any) {
        viewModel.switchFavorite()
    }
    
    @IBAction func handleBackClick(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    // MARK: - Photo view model delegate
    
    func didUpdateFavorite() {
        let favoriteIcon = UIImage(named: viewModel.favorite ? "ic_favorite": "ic_favorite_border")
        photoFavoriteButton.setImage(favoriteIcon, for: .normal)
    }
}
