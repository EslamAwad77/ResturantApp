//
//  HomeVC.swift
//  ResturantApp
//
//  Created by eslam awad elsayed awad on 27/10/2022.
//

import UIKit
import TTSegmentedControl

class HomeVC: UIViewController {
    
    //MARK: - Variables:-
    var products = [ProductModel]()
    var productsFiltered = [ProductModel]()
    var controller: HomeController? = HomeController()
    lazy var homeFilterVC = UIStoryboard(name: Config.StoryBoards.home, bundle: nil).instantiateViewController(withIdentifier: Config.ViewControllers.filter)
    
    //MARK: - Outlets :-
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var collViewFood: UICollectionView!
    @IBOutlet weak var viewReloading: UIView!
    @IBOutlet weak var lblErrorDescr: UILabel!
    @IBOutlet weak var activityLoadingPage: UIActivityIndicatorView!
    @IBOutlet weak var viewSegmented: UIView!{
        didSet{
            viewSegmented.layer.cornerRadius = 30
        }
    }
    
    @IBOutlet weak var segmentedControl: TTSegmentedControl!
    
    
    //MARK: - Actions :-
    @IBAction func btnFilter(_ sender: UIButton) {
        if let sheet = homeFilterVC.sheetPresentationController {
            sheet.detents = [.medium()]
            sheet.prefersScrollingExpandsWhenScrolledToEdge = false
            sheet.prefersGrabberVisible = true
            sheet.preferredCornerRadius = 38
        }
        self.present(homeFilterVC, animated: true, completion: nil)
    }
    
    @IBAction func btnBackTapped(_ sender: UIButton) {
        let alert = UIAlertController(title: "Are You Sure you want To Logout", message: "", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "ok", style: .cancel, handler: { _ in
            self.goToLogin()
        }))
        self.present(alert, animated: true, completion: nil)
        
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
        setupSegmented()
        setupUI()
        getData()
    }
}

extension HomeVC {
    private func setupUI(){
        setupSegmented()
        loadData()
        self.searchBar.delegate = self
        collViewFood.delegate = self
        collViewFood.dataSource = self
        if let layout = collViewFood?.collectionViewLayout as? CollectionLayout {
            layout.delegate = self
        }
    }
}

extension HomeVC {
    private func setupSegmented(){
        segmentedControl.itemTitles = ["Food Item", "Resturent"]
        segmentedControl.allowChangeThumbWidth = false
        segmentedControl.defaultTextColor = UIColor.orange
        segmentedControl.selectedTextColor = UIColor.white
        segmentedControl.thumbGradientColors = [UIColor.orange, UIColor.orange]
        segmentedControl.useShadow = true
        segmentedControl.backgroundColor = .white
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
                self.productsFiltered = productModel
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
                return 100
            }
            let hight = (collectionView.frame.height / 3 ) - 20
            return hight + (indexPath.row % 2 == 0 ? 30 : 90)
        }
}


extension HomeVC: UISearchBarDelegate{
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.endEditing(true)
        self.productsFiltered = self.products
    }
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        print("\(searchText)")
        productsFiltered = []
        if searchText != "" {
            for i in 0 ..< products.count{
                let productObj = products[i]
                if (productObj.title.lowercased().contains(searchText.lowercased())){
                    productsFiltered.append(productObj)
                }
            }
            self.collViewFood.reloadData()
        } else {
            self.productsFiltered = products
            self.collViewFood.reloadData()
        }
        print("filtered products: \(productsFiltered.count)")
    }
}

extension HomeVC{
    private func goToLogin() {
        let loginVC = UIStoryboard.init(name: Config.StoryBoards.auth, bundle: nil).instantiateViewController(withIdentifier: Config.ViewControllers.login) as! LoginVC
        loginVC.modalPresentationStyle = .fullScreen
        self.present(loginVC, animated: true, completion: nil)
    }
}
