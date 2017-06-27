//
//  ViewController.swift
//  SegmentedControlWithXibs
//
//  Created by Matt Harrington on 6/26/17.
//  Copyright © 2017 Matt Harrington. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var contentView: UIView!
    
    @IBAction func segmentedControlClicked(_ sender: UISegmentedControl) {
        contentView.viewWithTag(100)?.removeFromSuperview()
        switch sender.selectedSegmentIndex {
        case 0:
            displayViewFromNibNamed("FirstView")
        case 1:
            displayViewFromNibNamed("SecondView")
        default:
            break
        }
    }
    
    override func viewDidLoad() {
        displayViewFromNibNamed("FirstView")
    }
    
    private func displayViewFromNibNamed (_ nibName: String) {
        if let viewFromNib = Bundle.main.loadNibNamed(nibName,
                                                      owner: self, options: nil)?.first as? UIView {
            viewFromNib.tag = 100
            contentView.addSubview(viewFromNib)
            addConstraintsToView(viewFromNib)
        }
    }
    
    private func addConstraintsToView(_ view: UIView) {
        view.translatesAutoresizingMaskIntoConstraints = false
        view.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        view.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        view.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        view.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
    }
}
