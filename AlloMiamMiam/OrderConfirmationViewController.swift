//
//  OrderConfirmationViewController.swift
//  AlloMiamMiam
//
//  Created by Sélim Chiki on 27/09/2017.
//  Copyright © 2017 Sélim Chiki. All rights reserved.
//

import UIKit

class OrderConfirmationViewController: UIViewController {

    var minutes: Int!
    
    @IBOutlet weak var timeRemainingLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        timeRemainingLabel.text = "Thank You for your order! Your wait time is approximately \(minutes!) minutes."
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
