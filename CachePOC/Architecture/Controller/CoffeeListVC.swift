//
//  EmployListVC.swift
//  CachePOC
//
//  Created by Harsh Rajput on 01/06/20.
//  Copyright © 2020 Harsh Rajput. All rights reserved.
//

import UIKit

class CoffeeListVC: UIViewController {
    @IBOutlet weak var eTabel:UITableView!
    var elist:Coffees?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerTabelWithCell()
        getFromCashe()
        getFromServer()
        
        
    }
    
    func registerTabelWithCell(){
        self.title = "Coffee list"
        eTabel.register(UINib.init(nibName: "EmployCell", bundle: nil), forCellReuseIdentifier: "EmployCell")
    }
    func getFromServer(){
        CoffeeViewModel.shared.getEmployees { (employ) in
            print(employ)
            self.elist = employ
            self.eTabel.reloadData()
        }
    }
    
    func getFromCashe(){
        if let eData = UserDefaults.standard.value(forKey: "cacheEmploy") as? String{
            do{
            self.elist = try JSONDecoder.decode(eData, to: Coffees.self)
                eTabel.reloadData()
                
            }catch{
                print(error)
            }
        }else{
            
        }
        
    }
    
    
    // Do any additional setup after loading the view.
    
    
    
    
}
extension CoffeeListVC:UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let count = elist?.count{
            return count
            
        }else{
            return 0
        }
    }
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "EmployCell", for: indexPath) as! EmployCell
        cell.setemploy(user: elist![indexPath.row])
        return cell
    }
    
    
    
}
extension CoffeeListVC:UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let VC = storyboard?.instantiateViewController(identifier: "DetailViewVC") as! DetailViewVC
        VC.tList = elist![indexPath.row].coffeeNames
        self.navigationController?.pushViewController(VC, animated: true)
    }
}
