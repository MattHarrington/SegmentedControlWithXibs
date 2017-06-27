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
            displayFirstView()
        case 1:
            displaySecondView()
        default:
            break
        }
    }
    
    override func viewDidLoad() {
        displayFirstView()
    }
    
    private func displayFirstView() {
        if let viewFromXib = Bundle.main.loadNibNamed("FirstView",
                               owner: self, options: nil)?.first as? UIView {
            viewFromXib.tag = 100
            contentView.addSubview(viewFromXib)
            addConstraintsToView(viewFromXib)
        }
    }
    
    private func displaySecondView() {
        if let viewFromXib = Bundle.main.loadNibNamed("SecondView",
                               owner: self, options: nil)?.first as? UIView {
            viewFromXib.tag = 100
            contentView.addSubview(viewFromXib)
            addConstraintsToView(viewFromXib)
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
