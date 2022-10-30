//
//  HomeVC.swift
//  ResturantApp
//
//  Created by eslam awad elsayed awad on 27/10/2022.
//

import UIKit
import SKRadioButton

class HomeVC: UIViewController {
    
    //MARK: - Variables:-
    var products = [ProductModel]()
    var controller: HomeController? = HomeController()
    
    //MARK: - Outlets :-
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var collViewFood: UICollectionView!
    @IBOutlet weak var viewReloading: UIView!
    @IBOutlet weak var lblErrorDescr: UILabel!
    @IBOutlet weak var activityLoadingPage: UIActivityIndicatorView!
    
    //MARK: - Actions :-
    @IBAction func btnFilter(_ sender: UIButton) {
    }
    
    @IBAction func btnBackTapped(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func btnPageReloadingPressed(_ sender: UIButton) {
        loadData()
        getData()
    }
}

//MARK: - Life Cycle of Screen :-
extension HomeVC {
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        getData()
    }
}

extension HomeVC {
    private func setupUI(){
        loadData()
        //self.pullTorefresh()
        collViewFood.delegate = self
        collViewFood.dataSource = self
        if let layout = collViewFood?.collectionViewLayout as? CollectionLayout {
            layout.delegate = self
        }
    }
}

extension HomeVC {
    func loadData(){
        self.activityLoadingPage.startAnimating()
        self.viewReloading.alpha = 0
        self.collViewFood.alpha = 0
    }
}

extension HomeVC {
    private func getData(){
        controller?.getData(success: { productModel in
            //self.collViewFood.es.stopPullToRefresh()
            //self.collViewFood.es.stopLoadingMore()
            self.hideError()
            if !(productModel.isEmpty){
                self.products = productModel
                self.collViewFood.reloadData()
            } else {
                self.showError()
                self.lblErrorDescr.text = "Can't Loading Data(Cities)"
                
            }
        }, error: { error in
            self.showError()
            self.lblErrorDescr.text = error
            DispatchQueue.main.async {
                self.showAlert(message: error)
            }
        })
    }
}

extension HomeVC {
//    func pullTorefresh(){
//        // if refresh from Top
//        self.collViewFood.es.addPullToRefresh { [weak self] in
//            guard let self = self else{return}
//            self.getData()
//        }
//        // if refresh from Bottom
//        self.collViewFood.es.addInfiniteScrolling { [weak self] in
//            guard let self = self else { return }
//            self.getData()
//        }
//    }
}

extension HomeVC {
    func showError(){
        self.activityLoadingPage.alpha = 0
        self.activityLoadingPage.stopAnimating()
        self.viewReloading.alpha = 1
        self.collViewFood.alpha = 0
    }
}

extension HomeVC {
    func hideError(){
        self.collViewFood.alpha = 1
        self.viewReloading.alpha = 0
        self.activityLoadingPage.stopAnimating()
        self.activityLoadingPage.alpha = 0
    }
}

extension HomeVC: CollectionLayoutDelegate{
    func collectionView(
        _ collectionView: UICollectionView,
        heightForPhotoAtIndexPath indexPath:IndexPath) -> CGFloat {
            if indexPath.row == 0{
                return 70
            }
            let hight = (collectionView.frame.height / 3 ) - 20
            return hight + (indexPath.row % 2 == 0 ? 30 : 90)
        }
}


