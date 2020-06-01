//
//  DetailViewVC.swift
//  CachePOC
//
//  Created by Harsh Rajput on 02/06/20.
//  Copyright © 2020 Harsh Rajput. All rights reserved.
//

import UIKit

class DetailViewVC: UIViewController {

    var tList:[CoffeeName] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Details"

        // Do any additional setup after loading the view.
    }
    


}
extension DetailViewVC:UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "detailName") as! UITableViewCell
        cell.textLabel?.text = tList[indexPath.row].name
        return cell
    }
}
