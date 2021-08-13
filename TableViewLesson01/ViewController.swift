//
//  ViewController.swift
//  TableViewLesson01
//
//  Created by UrataHiroki on 2021/08/13.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    let tableViewContentsArray = ["1","2","3","4","5","6","7","8","9","10"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 63
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
        
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return tableViewContentsArray.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        
        let cellLabel = cell.contentView.viewWithTag(1) as! UILabel
        
        cellLabel.text = tableViewContentsArray[indexPath.row]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let cell = tableView.cellForRow(at: indexPath)
        
        cell?.accessoryView = {() -> UIActivityIndicatorView in
            
            let indicatorView = UIActivityIndicatorView(frame: CGRect(x: (cell?.frame.maxX)! - ((cell?.frame.maxX)! / 4), y: (cell?.frame.minY)! , width: (cell?.frame.size.width)! / 4, height: (cell?.frame.size.height)!))
            
            indicatorView.color = .black
            indicatorView.startAnimating()
            
            return indicatorView
        }()
        
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        
        let cell = tableView.cellForRow(at: indexPath)
        
        cell?.accessoryView = {() -> UIActivityIndicatorView in
            
            let indicatorView = UIActivityIndicatorView()
            
            indicatorView.color = .black
            indicatorView.stopAnimating()
            
            return indicatorView
        }()
        
    }
}

