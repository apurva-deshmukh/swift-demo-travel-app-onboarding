//
//  ViewController.swift
//  onboarding-travel-app
//
//  Created by Apurva Deshmukh on 7/31/20.
//  Copyright © 2020 Apurva Deshmukh. All rights reserved.
//

import UIKit

class OnboardingController: UIViewController {

    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var detailLabel: UILabel!
    @IBOutlet weak var bgImageView: UIImageView!
    @IBOutlet weak var darkView: UIView!
    
    private var items: [OnboardingItem] = []
    private var currentPage: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupPlaceholderItems()
        setupPageControl()
        setupScreen(index: currentPage)
        updateBackgroundImage(index: currentPage)
        setupGestures()
        setupViews()
    }
    
    private func setupPlaceholderItems() {
        items = OnboardingItem.placeholderItems
    }

    private func setupPageControl() {
        pageControl.numberOfPages = items.count
    }
    
    private func setupScreen(index: Int) {
        titleLabel.text = items[index].title
        detailLabel.text = items[index].detail
        pageControl.currentPage = index
        titleLabel.alpha = 1.0
        detailLabel.alpha = 1.0
        titleLabel.transform = .identity
        detailLabel.transform = .identity
    }
    
    private func setupViews() {
        darkView.backgroundColor = UIColor.init(white: 0.1, alpha: 0.5)
    }
    
    private func updateBackgroundImage(index: Int) {
        let image = items[index].bgImage
        UIView.transition(with: bgImageView,
                          duration: 0.5,
                          options: .transitionCrossDissolve,
                          animations: { self.bgImageView.image = image },
                          completion: nil)
    }
    
    private func setupGestures() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTapAnimation))
        view.addGestureRecognizer(tapGesture)
    }
    
    @objc private func handleTapAnimation() {
        
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.5, options: .curveEaseInOut, animations: {
            self.titleLabel.alpha = 0.8
            self.titleLabel.transform = CGAffineTransform(translationX: -30, y: 0)
        }) { _ in
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.5, options: .curveEaseInOut, animations: {
                self.titleLabel.alpha = 0
                self.titleLabel.transform = CGAffineTransform(translationX: 0, y: -550)
            }, completion: nil)
        }
        
        UIView.animate(withDuration: 0.5, delay: 0.5, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.5, options: .curveEaseInOut, animations: {
            self.detailLabel.alpha = 0.8
            self.detailLabel.transform = CGAffineTransform(translationX: -30, y: 0)
        }) { _ in
            if self.currentPage < self.items.count - 1 {
                self.updateBackgroundImage(index: self.currentPage + 1)
            }
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.5, options: .curveEaseInOut, animations: {
                self.detailLabel.alpha = 0
                self.detailLabel.transform = CGAffineTransform(translationX: 0, y: -550)
            }) { _ in
                self.currentPage += 1
                if self.isOverLastItem() {
                    self.showMainApp()
                } else {
                    self.setupScreen(index: self.currentPage)
                }
            }
        }
    }
    
    private func isOverLastItem() -> Bool {
        return currentPage == self.items.count
    }
    
    private func showMainApp() {
        let mainVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "MainAppViewController")
        if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
            let sceneDelegate = windowScene.delegate as? SceneDelegate,
            let window = sceneDelegate.window {
            window.rootViewController = mainVC
            UIView.transition(with: window,
                              duration: 0.25,
                              options: .transitionCrossDissolve,
                              animations: nil,
                              completion: nil)
        }
    }
}

