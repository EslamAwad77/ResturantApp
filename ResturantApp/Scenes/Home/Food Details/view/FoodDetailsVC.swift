//
//  FoodDetailsVC.swift
//  ResturantApp
//
//  Created by eslam awad elsayed awad on 27/10/2022.
//

import UIKit
import Kingfisher
import M13Checkbox

class FoodDetailsVC: UIViewController {
    //MARK: - Variables :
    var productID = 0
    var controller: FoodDetailsController? = FoodDetailsController()
    
    //MARK: - Outlets :
    @IBOutlet weak var imgViewProduct: UIImageView!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblRate: UILabel!
    @IBOutlet weak var lblPrice: UILabel!
    @IBOutlet weak var lblDesc: UILabel!
    @IBOutlet weak var viewCheckBox1: M13Checkbox!
    @IBOutlet weak var viewCheckBox2: M13Checkbox!
    @IBOutlet weak var viewCheckBox3: M13Checkbox!
    @IBOutlet weak var imgViewChart: UIImageView!
    @IBOutlet weak var viewChart: UIView!{
        didSet{
            viewChart.cornerRaduis = 50
        }
    }
    
    //MARK: - Actions :
 
    @IBAction func btnBackPressed(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
}


//MARK: - LifeCycle Of Screen :

extension FoodDetailsVC{
    override func viewDidLoad() {
        super.viewDidLoad()
        getData()
    }
}

extension FoodDetailsVC{
    private func setupUI(){
        imgViewChart.roundedImage()
        let checkbox1 = M13Checkbox(frame: CGRect(x: 0.0, y: 0.0, width: 40.0, height: 40.0))
        viewCheckBox1.addSubview(checkbox1)
        let checkbox2 = M13Checkbox(frame: CGRect(x: 0.0, y: 0.0, width: 40.0, height: 40.0))
        viewCheckBox2.addSubview(checkbox2)
        let checkbox3 = M13Checkbox(frame: CGRect(x: 0.0, y: 0.0, width: 40.0, height: 40.0))
        viewCheckBox3.addSubview(checkbox3)
        
    }
}

extension FoodDetailsVC{
    private func setup(_ Details: ProductModel){
        imgViewProduct.kf.indicatorType = .activity
        if let url = URL(string: Details.thumbnail){
             imgViewProduct.kf.setImage(with: url)
            imgViewProduct.cornerRaduis = 20
         }
        lblTitle.text = Details.title
        lblRate.text = Details.rating.description
        lblDesc.text = Details.description
        lblPrice.text = "$" + Details.price.description
    }
}

extension FoodDetailsVC{
    private func getData(){
        controller?.getData(productId: productID, success: { productModel in
            //if !(productModel.isEmpty){
                self.setup(productModel)
//            } else {
//            }
        }, error: { error in
            DispatchQueue.main.async {
                self.showAlert(message: error)
            }
        })
    }
}
