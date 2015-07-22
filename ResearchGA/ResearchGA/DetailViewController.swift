//
//  DetailViewController.swift
//  ResearchGA
//
//  Created by  on 7/22/15.
//  Copyright (c) 2015 Framgia. All rights reserved.
//

import UIKit
import SVProgressHUD

class DetailViewController: UIViewController {

    @IBOutlet weak var detailDescriptionLabel: UILabel!


    var detailItem: AnyObject? {
        didSet {
            // Update the view.
            self.configureView()
        }
    }

    func configureView() {
        // Update the user interface for the detail item.
        if let detail: AnyObject = self.detailItem {
            if let label = self.detailDescriptionLabel {
                label.text = detail.description
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.configureView()
    }

    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(true)
        GaHelper.sendEvent(GaCommon.detailView.rawValue,
            action: GaCommonAction.showViewDetail.rawValue,
            label: GaCommonLabel.masterViewDetail.rawValue)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

