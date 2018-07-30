//
//  ViewController.swift
//  tableViewSample
//
//  Created by Ryohei Azuma on 2018/07/30.
//  Copyright © 2018年 Ryohei Azuma. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var checkListView:UITableView!
    
    var cellFlg:[Bool] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        for _ in 0..<20{
            cellFlg.append(false)
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func tapToSend(_ sender: AnyObject) {
        //全選択解除
        for i in 0..<checkListView.numberOfRows(inSection: 0) {
            let indexPath = IndexPath(row: i, section: 0)
            let cell = checkListView.cellForRow(at: indexPath)
            cell?.accessoryType = .none
            cellFlg[indexPath.row] = false
            checkListView.deselectRow(at: indexPath, animated: false)
        }
    }

}

extension ViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath)
        cell?.accessoryType = .checkmark
        cellFlg[indexPath.row] = true
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath)
        cell?.accessoryType = .none
        cellFlg[indexPath.row] = false
    }
    
    
    
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // セルを取得する
        let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        cell.textLabel?.text = indexPath.row.description
        
        if(cellFlg[indexPath.row]){
            cell.accessoryType = .checkmark
        }else{
            cell.accessoryType = .none
        }
        
        return cell
    }
    
}
