//
//  WelcomeController.swift
//  Team
//
//  Created by Jonathan on 11/25/18.
//  Copyright © 2018 Jonathan. All rights reserved.
//

import UIKit
import Pastel

class WelcomeController: UIViewController {
    
    let cellId = "cellId"
    
    var pageCollection:UICollectionView?
    
    let pages = [
        WelcomePage(image: #imageLiteral(resourceName: "image1"), mainTitle: "Team Is Power For An Organization", subTitle: "At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi and topic hopefully going."),
        WelcomePage(image: #imageLiteral(resourceName: "image2"), mainTitle: "Manage Your Team In The Best Way", subTitle: "At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi and topic hopefully going."),
        WelcomePage(image: #imageLiteral(resourceName: "image3"), mainTitle: "Teamwork Begins By Building Trust", subTitle: "At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi and topic hopefully going.")
    ]
    
    
    let pageNav:UIPageControl = {
        let nav = UIPageControl()
        nav.translatesAutoresizingMaskIntoConstraints = false
        nav.numberOfPages = 3
        nav.currentPage = 0
        return nav
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNav()
        setupUIElements()
        setupNavControls()
        setCollectionDelegates()
    }
    
    func setupNav() {
        view.backgroundColor = .white
        self.navigationController?.navigationBar.barTintColor = .white
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationItem.backBarButtonItem = UIBarButtonItem(customView: UIView())
        self.navigationItem.backBarButtonItem?.tintColor = .white
    }
    
    func setupUIElements() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        pageCollection = UICollectionView(frame: view.frame, collectionViewLayout: layout)
        pageCollection?.isPagingEnabled = true
        pageCollection?.backgroundColor = .white
        pageCollection?.delegate = self
        pageCollection?.dataSource = self
        pageCollection?.register(WelcomeCell.self, forCellWithReuseIdentifier: cellId)
        guard let safeCollectionView = pageCollection else { return }
        view.addSubview(safeCollectionView)
        NSLayoutConstraint.activate([
            safeCollectionView.topAnchor.constraint(equalTo: view.topAnchor),
            safeCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            safeCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            safeCollectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
            ])
    }
    
    func setupNavControls() {
        let navContainer:PastelView = {
            let container = PastelView()
            container.translatesAutoresizingMaskIntoConstraints = false
            container.startPastelPoint = .left
            container.endPastelPoint = .right
            container.animationDuration = 2
            container.setColors([UIColor("1C66FF"),UIColor("4D87FF")])
            return container
        }()
        navContainer.startAnimation()
        view.addSubview(navContainer)
        NSLayoutConstraint.activate([
            navContainer.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            navContainer.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0),
            navContainer.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            navContainer.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.4/4)
            ])
        
        let skipBtn:UIButton = {
            let text = UIButton(type: .system)
            text.setTitle("Skip", for: .normal)
            text.setTitleColor(.white, for: .normal)
            text.titleLabel?.font = .systemFont(ofSize: 13)
            text.translatesAutoresizingMaskIntoConstraints = false
//            text.backgroundColor = .darkGray
            return text
        }()
        
        navContainer.addSubview(skipBtn)
        skipBtn.addTarget(self, action: #selector(handleSkip), for: .touchUpInside)
        NSLayoutConstraint.activate([
            skipBtn.centerYAnchor.constraint(equalTo: navContainer.centerYAnchor, constant: -10),
            skipBtn.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25),
            skipBtn.widthAnchor.constraint(equalToConstant: 60),
            skipBtn.heightAnchor.constraint(equalToConstant: 50)
            ])
        
        let nextBtn:UIButton = {
            let text = UIButton(type: .system)
            text.setTitle("Next", for: .normal)
            text.setTitleColor(.white, for: .normal)
            text.titleLabel?.font = .systemFont(ofSize: 13)
            text.translatesAutoresizingMaskIntoConstraints = false
//            text.backgroundColor = .darkGray
            return text
        }()
        
        navContainer.addSubview(nextBtn)
        nextBtn.addTarget(self, action: #selector(nextPage), for: .touchUpInside)
        NSLayoutConstraint.activate([
            nextBtn.centerYAnchor.constraint(equalTo: skipBtn.centerYAnchor),
            nextBtn.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -25),
            nextBtn.widthAnchor.constraint(equalToConstant: 60),
            nextBtn.heightAnchor.constraint(equalToConstant: 50)
            ])
        
        navContainer.addSubview(pageNav)
        NSLayoutConstraint.activate([
            pageNav.centerYAnchor.constraint(equalTo: nextBtn.centerYAnchor, constant: 0),
            pageNav.centerXAnchor.constraint(equalTo: navContainer.centerXAnchor),
            pageNav.heightAnchor.constraint(equalToConstant: 16),
            pageNav.widthAnchor.constraint(equalToConstant: 50)
            ])
    }
    
    @objc func nextPage() {
        if pageNav.currentPage < 2 {
            let nextIndex = pageNav.currentPage + 1
            let indexPath = IndexPath(item: nextIndex, section: 0)
            pageCollection?.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
            pageNav.currentPage = nextIndex
        } else {
            handleSkip()
        }
    }
    
    @objc func handleSkip() {
        let signUp = SignUpController()
        self.navigationController?.pushViewController(signUp, animated: true)
    }
    
}

extension WelcomeController:UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! WelcomeCell
        cell.pageData = pages[indexPath.item]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: view.frame.height-125)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        let x = targetContentOffset.pointee.x
        let target = Int(x / view.frame.width)
        pageNav.currentPage = target
    }
    
    func setCollectionDelegates() {
        pageCollection?.delegate = self
        pageCollection?.dataSource = self
        pageCollection?.register(WelcomeCell.self, forCellWithReuseIdentifier: cellId)
    }
}
