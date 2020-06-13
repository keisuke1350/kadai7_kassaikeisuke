//
//  DescriptionViewController.swift
//  collectionview2
//
//  Created by 葛西　佳祐 on 2020/06/13.
//  Copyright © 2020 葛西　佳祐. All rights reserved.
//

import UIKit

class DescriptionViewController: UIViewController {

    
    @IBOutlet weak var descriptionImage: UIImageView!
    @IBOutlet weak var descriptionTitle: UILabel!
    @IBOutlet weak var descriptionDesc: UILabel!
    
    var sdgsinfo: SdgsInfo?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
            guard let sdgsInfo = sdgsinfo else { return }
            descriptionImage.image = UIImage(named: sdgsInfo.iconName)
    }

    
//

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
