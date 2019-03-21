//
//  ItemVc.swift
//  TAblevc
//
//  Created by PraveenKumarReddy on 21/03/19.
//  Copyright © 2019 praveen. All rights reserved.
//

import UIKit

class ItemVc: UIViewController {
    
    

    @IBOutlet weak var ContentLbl: UILabel!
    
    @IBOutlet var dbjdbvdfh: [UILabel]!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(dbjdbvdfh.count)
 let sdd = dbjdbvdfh[0]
        sdd.backgroundColor = .red
        
        // Do any additional setup after loading the view.
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
