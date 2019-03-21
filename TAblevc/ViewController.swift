//
//  ViewController.swift
//  TAblevc
//
//  Created by PraveenKumarReddy on 21/03/19.
//  Copyright © 2019 praveen. All rights reserved.
//

import UIKit

protocol CustomTableDelegate:class {
    func didSelectItem(item:String)

}



class selectedCell: UICollectionViewCell {

    @IBOutlet weak var arradate: UILabel!
}


class CustomTable: UITableViewCell ,UICollectionViewDataSource,UICollectionViewDelegate{
    
    let arra = ["red","blue","yellow","orange","green","grey"]
    
//    typealias completionHandler = (String) -> ()
     var closure:((String) -> ())?
    var delegate:CustomTableDelegate?
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return arra.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell  = collectionView.dequeueReusableCell(withReuseIdentifier: "selectedCell", for: indexPath) as! selectedCell
        cell.arradate.text = arra[indexPath.row]
        return cell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        delegate?.didSelectItem(item: arra[indexPath.item])
//        closure!(arra[indexPath.item])
    }
   
    
    
    
}

class ViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CustomTable") as! CustomTable
        cell.delegate = self
        
        
        cell.closure = { [unowned self] item in

            let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ItemVc") as! ItemVc
                    vc.title = item
            self.navigationController?.pushViewController(vc, animated: true)
//            self.present(vc, animated: true, completion: nil)


        }
        return cell
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    



}

extension ViewController:CustomTableDelegate{
    func didSelectItem(item: String) {
        
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ItemVc") as! ItemVc
        vc.title = item
        self.navigationController?.pushViewController(vc, animated: true)
        
    }
    
    
}
