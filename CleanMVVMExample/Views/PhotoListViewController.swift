//
//  PhotoListViewController.swift
//  CleanMVVMExample
//
//  Created by Joe on 2018/3/20.
//  Copyright © 2018年 joe. All rights reserved.
//

import UIKit

class PhotoListViewController: UITableViewController, PhotoListViewModelDelegate, PhotoCellDelegate {
    
    var photoListViewModel: PhotoListViewModelInterface = PhotoListViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.contentInset = UIEdgeInsets(top: -UIApplication.shared.statusBarFrame.height, left: 0, bottom: 0, right: 0)
        photoListViewModel.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        tableView.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Photo list view model delegate
    
    func photoListViewModelDidUpdateFavorite() {
        tableView.reloadData()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return photoListViewModel.photoViewModels.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let photoViewModel = photoListViewModel[indexPath.row]
        let favoriteIcon = UIImage(named: photoViewModel.favorite ? "ic_favorite": "ic_favorite_border")
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "PhotoCell", for: indexPath) as! PhotoCell
        cell.delegate = self
        cell.photoImageView.image = UIImage(named: photoViewModel.imageName)
        cell.photoFavoriteButton.setImage(favoriteIcon, for: .normal)
        
        return cell
    }
    
    // MARK: - Table view delegate
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "FocusSegue", sender: indexPath.row)
    }
    
    // MARK: - Photo cell delegate
    
    func photoCellFavoriteButtonDidClick(cell: PhotoCell) {
        let index = tableView.indexPath(for: cell)!.row
        photoListViewModel.switchFavorite(at: index)
    }
    
    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination as? PhotoFocusViewController,
            let index = sender as? Int{
            vc.photoViewModel = photoListViewModel[index]
        }
    }
}

@objc protocol PhotoCellDelegate {
    
    func photoCellFavoriteButtonDidClick(cell: PhotoCell)
    
}

class PhotoCell: UITableViewCell {
    
    weak var delegate: PhotoCellDelegate?
    
    @IBOutlet var photoImageView: UIImageView!
    @IBOutlet weak var photoFavoriteButton: UIButton!
    
    @IBAction func handlePhotoFavoriteClick(_ sender: Any) {
        delegate?.photoCellFavoriteButtonDidClick(cell: self)
    }
}

