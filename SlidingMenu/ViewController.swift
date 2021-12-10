//
//  ViewController.swift
//  Basic Sliding Menu
//
//  Created by Jan Coolen on 10/12/2021.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var menuLeadingConstraint: NSLayoutConstraint!
    @IBOutlet weak var menuWidthConstraint: NSLayoutConstraint!
    @IBOutlet weak var vwMenu: UIView!
    
    @IBAction func btnMenuTapped(_ sender: Any) {
        menuExpanded = !menuExpanded
    }
    @IBAction func btnItem1Tapped(_ sender: Any) {
            print("Menu item 1 tapped")
    }
    
    @IBAction func btnItem2Tapped(_ sender: Any) {
        print("Menu item 2 tapped")
    }
    
    @IBAction func btnItem3Tapped(_ sender: Any) {
        print("Menu item 3 tapped")
    }
    
    let menuWidth = 140.0
    
    var menuExpanded = false {
        didSet {
            menuLeadingConstraint.constant = menuExpanded ? 0 : -menuWidth
            UIView.animate(withDuration: 0.3, delay: 0.0, options: .curveEaseIn, animations: {self.view.layoutIfNeeded()}) { _ in print("Animation finished") }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupMenu()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        menuExpanded = false
    }
    
    @objc func dismissMenu() {
        menuExpanded = false
    }
    
    func setupMenu() {
        menuLeadingConstraint.constant = -menuWidth
        menuWidthConstraint.constant = menuWidth
        view.bringSubviewToFront(vwMenu)
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissMenu))
        vwMenu.addGestureRecognizer(tapGestureRecognizer)
        
    }

}

