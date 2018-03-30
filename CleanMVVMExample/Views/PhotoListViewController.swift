//
//  PhotoListViewController.swift
//  CleanMVVMExample
//
//  Created by Joe on 2018/3/20.
//  Copyright © 2018年 joe. All rights reserved.
//

import UIKit

class PhotoListViewController: UITableViewController, PhotoListViewModelDelegate {
    
    var viewModel: PhotoListViewModel = PhotoListViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        tableView.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func handleSeriesChanged(_ sender: UISegmentedControl) {
        viewModel.series = PhotoSeries(rawValue: sender.selectedSegmentIndex)!
    }
    
    // MARK: - Photo list view model delegate
    
    func didUpdateSeries() {
        tableView.reloadData()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.photosNumber
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PhotoCell", for: indexPath) as! PhotoCell
        cell.viewModel = viewModel.photoViewModel(index: indexPath.row)
        
        return cell
    }
    
    // MARK: - Table view delegate
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "FocusSegue", sender: indexPath.row)
    }
    
    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination as? PhotoFocusViewController,
            let index = sender as? Int{
            vc.viewModel = viewModel.photoViewModel(index: index)
        }
    }
}

class PhotoCell: UITableViewCell, PhotoViewModelDelegate {
    
    var viewModel: PhotoViewModel? {
        willSet{
            viewModel?.delegate = nil
        }
        didSet{
            if let viewModel = viewModel {
                viewModel.delegate = self
                photoImageView.image = UIImage(named: viewModel.imageName)
                let favoriteIcon = UIImage(named: viewModel.favorite ? "ic_favorite": "ic_favorite_border")
                photoFavoriteButton.setImage(favoriteIcon, for: .normal)
            }
        }
    }
    
    @IBOutlet var photoImageView: UIImageView!
    @IBOutlet weak var photoFavoriteButton: UIButton!
    
    @IBAction func handlePhotoFavoriteClick(_ sender: Any) {
        viewModel?.switchFavorite()
    }
    
    // MARK: - Photo view model delegate
    
    func didUpdateFavorite() {
        if let viewModel = viewModel {
            let favoriteIcon = UIImage(named: viewModel.favorite ? "ic_favorite": "ic_favorite_border")
            photoFavoriteButton.setImage(favoriteIcon, for: .normal)
        }
    }
}

