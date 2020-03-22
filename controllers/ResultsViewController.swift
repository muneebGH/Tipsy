//
//  ResultsViewController.swift
//  Tipsy
//
//  Created by Muneeb Ur Rehman on 22/03/2020.
//  Copyright © 2020 Muneebs. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {

    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var settingsLabel: UILabel!
    
    var billSplitted:String="0"
    var tip:String="no value"
    var noOfPeople:String="none"
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        totalLabel.text=billSplitted
        settingsLabel.text="Split between "+noOfPeople+"people, with "+tip+"% tip."

    }
    

    @IBAction func recalculatePressed(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
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
