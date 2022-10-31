//
//  OnBoardingVC.swift
//  ResturantApp
//  Created by eslam awad elsayed awad on 27/10/2022.

import UIKit

class OnBoardingVC: UIViewController{
    //MARK: -Variables :-
    var slides: [OnBoardingSlideModel] = []
    var currentPage = 0 {
        didSet {
            pageControl.currentPage = currentPage
            if currentPage == slides.count - 1{
                //btnGoNext.setTitle("Get Started", for: .normal)
            } else {
                //btnGoNext.setTitle("Next", for: .normal)
            }
        }
    }
    
    //MARK: - Outlets :-
    @IBOutlet weak var collViewSlide: UICollectionView!
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var btnGoNext: UIButton!
    @IBOutlet weak var viewBtnGoNext: UIView!
    
    
    //Actions :-
    @IBAction func btnGoNextPressed(_ sender: UIButton) {
        if currentPage == slides.count - 1{
            goToSignUp()
        } else {
            currentPage += 1
            let indexPath = IndexPath(item: currentPage, section: 0)
            collViewSlide.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
            
        }
    }
    
}
//MARK: - Life Cycle of Screen:
extension OnBoardingVC {
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
}

extension OnBoardingVC {
    func setupUI(){
        viewBtnGoNext.addRoundedCornerToView()
        collViewSlide.delegate = self
        collViewSlide.dataSource = self
        slides = [
            OnBoardingSlideModel(image: #imageLiteral(resourceName: "image1"), title: "Browse your  menu and order directly", description: "Our app can send you everywhere, even space. For only $2.99 per month"),
            OnBoardingSlideModel(image: #imageLiteral(resourceName: "image2"), title: "Even to space with us! Together", description: "Our app can send you everywhere, even space. For only $2.99 per month"),
            OnBoardingSlideModel(image: #imageLiteral(resourceName: "image3"), title: "Pickup delivery at your door", description: "Our app can send you everywhere, even space. For only $2.99 per month")
        ]
        pageControl.numberOfPages = slides.count
    }
}

extension OnBoardingVC{
    func goToSignUp(){
        let storyBoard = UIStoryboard(name: Config.StoryBoards.auth, bundle: nil)
        let registerVC = storyBoard.instantiateViewController(withIdentifier: Config.ViewControllers.register) as! RegisterVC
        registerVC.modalPresentationStyle = .fullScreen
        self.present(registerVC, animated: true)
    }
}












//    //Variables :-
//
//    var imageSlides: [OnBoardingImageModel] = []
//    var titleSlides: [OnBoardingTitleModel] = []
//    var currentPage = 0 {
//        didSet {
//            pageControl.currentPage = currentPage
//            if currentPage == imageSlides.count - 1 && currentPage == titleSlides.count - 1{
//                btnGoNext.setTitle("Get Started", for: .normal)
//            } else {
//                btnGoNext.setTitle("Next", for: .normal)
//            }
//        }
//    }
//
//    //Outlets :-
//    @IBOutlet weak var collViewImageSlide: UICollectionView!
//    @IBOutlet weak var collViewTitleSlide: UICollectionView!
//    @IBOutlet weak var pageControl: UIPageControl!
//    @IBOutlet weak var btnGoNext: UIButton!
//
//Actions :-
//    @IBAction func btnGoNextPressed(_ sender: UIButton) {
//        if currentPage == imageSlides.count - 1 && currentPage == titleSlides.count - 1 {
//            goToSignUp()
//        } else {
//            currentPage += 1
//            let indexPath = IndexPath(item: currentPage, section: 0)
//            collViewImageSlide.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
//            collViewTitleSlide.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
//
//        }
//    }


//Life Cycle of Screen
//extension OnBoardingVC {
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        setupUI()
//    }
//}
//
//extension OnBoardingVC {
//    func setupUI(){
//        collViewImageSlide.delegate = self
//        collViewImageSlide.dataSource = self
//        collViewTitleSlide.delegate = self
//        collViewTitleSlide.dataSource = self
//
//
//        imageSlides = [
//            OnBoardingImageModel(image: #imageLiteral(resourceName: "image1")),
//            OnBoardingImageModel(image: #imageLiteral(resourceName: "image2")),
//            OnBoardingImageModel(image: #imageLiteral(resourceName: "image3"))
//        ]
//
//        titleSlides = [
//            OnBoardingTitleModel(title: "Browse your  menu and order directly", description: "Our app can send you everywhere, even space. For only $2.99 per month"),
//            OnBoardingTitleModel(title: "Even to space with us! Together", description: "Our app can send you everywhere, even space. For only $2.99 per month"),
//            OnBoardingTitleModel(title: "Pickup delivery at your door", description: "Our app can send you everywhere, even space. For only $2.99 per month")
//        ]
//        pageControl.numberOfPages = imageSlides.count
//        pageControl.numberOfPages = titleSlides.count
//    }
//}
//







// MARK: - Constanse
//var slides: [CollSlide] = []
//    var currentPage = 0{
//        didSet {
//            pageController.currentPage = currentPage
//            if currentPage == slides.count - 1 {
//
//            } else {
//
//            }
//        }
//    }

// MARK: - Outlets
//    @IBOutlet weak var pageController: UIPageControl!
//    @IBOutlet weak var scrollView: UIScrollView!{
//        didSet{
//            scrollView.delegate = self
//        }
//    }
//


// override func viewDidLoad() {
//   super.viewDidLoad()
//        slides = createSlides()
//        setupSlideScrollView(slides: slides)
//        pageController.numberOfPages = slides.count
//        pageController.currentPage = 0
//        view.bringSubviewToFront(pageController)
// }


// MARK: - HelperFunctions
//    func createSlides() -> [CollSlide] {
//
//        let slide1: CollSlide = Bundle.main.loadNibNamed("CollSlide", owner: self, options: nil)?.first as! CollSlide
//        slide1.imgViewProduct.image = UIImage(named: "image1")
//        slide1.lblTitle.text = "Browse your  menu and order directly"
//        slide1.lblDesc.text = "Our app can send you everywhere, even space. For only $2.99 per month"
//        slide1.btnGoNext.layer.cornerRadius = slide1.btnGoNext.layer.frame.height / 2
//
//        let slide2: CollSlide = Bundle.main.loadNibNamed("CollSlide", owner: self, options: nil)?.first as! CollSlide
//        slide2.imgViewProduct.image = UIImage(named: "image2")
//        slide2.lblTitle.text = "Even to space with us! Together"
//        slide2.lblDesc.text = "Our app can send you everywhere, even space. For only $2.99 per month"
//        slide2.btnGoNext.layer.cornerRadius = slide1.btnGoNext.layer.frame.height / 2
//
//
//        let slide3: CollSlide = Bundle.main.loadNibNamed("CollSlide", owner: self, options: nil)?.first as! CollSlide
//        slide3.imgViewProduct.image = UIImage(named: "image3")
//        slide3.lblTitle.text = "Pickup delivery at your door"
//        slide3.lblDesc.text = "Our app can send you everywhere, even space. For only $2.99 per month"
//        slide3.btnGoNext.layer.cornerRadius = slide1.btnGoNext.layer.frame.height / 2
//        slide3.btnGoNext.addTapGesture {
//            self.goToSignUp()
//        }
//
//        return [slide1, slide2, slide3]
//    }
//    func setupSlideScrollView(slides : [CollSlide]) {
//        scrollView.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height)
//        scrollView.contentSize = CGSize(width: view.frame.width * CGFloat(slides.count), height: view.frame.height)
//        scrollView.isPagingEnabled = true
//        for i in 0 ..< slides.count {
//            slides[i].frame = CGRect(x: view.frame.width * CGFloat(i), y: 0, width: view.frame.width, height: view.frame.height)
//            scrollView.addSubview(slides[i])
//        }
//    }
// page controller
//    func scrollViewDidScroll(_ scrollView: UIScrollView) {
//        let pageIndex = round(scrollView.contentOffset.x/view.frame.width)
//        pageController.currentPage = Int(pageIndex)
//    }
//        @objc func nextBtn(){
//            setupSlideScrollView(slides: slides)
//        }
