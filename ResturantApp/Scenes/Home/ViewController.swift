//
//  ViewController.swift
//  ResturantApp
//
//  Created by eslam awad elsayed awad on 31/10/2022.
//

import UIKit
import TTSegmentedControl

class ViewController: UIViewController {

    @IBOutlet weak var segmentedControl: TTSegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupSegmented()
    }
    
    func setupSegmented(){
        segmentedControl.itemTitles = ["Food Item", "Resturent"]
        segmentedControl.allowChangeThumbWidth = false
        segmentedControl.defaultTextColor = UIColor.orange
        segmentedControl.selectedTextColor = UIColor.white
        segmentedControl.thumbGradientColors = [UIColor.yellow, UIColor.red]
        segmentedControl.useShadow = true
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
