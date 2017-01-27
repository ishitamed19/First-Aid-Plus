//
//  ViewController.swift
//  Ishita Mediratta
//
//  Created by Ishita Mediratta on 26/04/16.
//  Copyright © 2016 Ishita Mediratta. All rights reserved.
//

import UIKit

private let kTableHeaderHeight: CGFloat = 300.0
private let kTableCutAway: CGFloat = 80.0




class ViewController: UITableViewController{
    
    var headerMaskLayer: CAShapeLayer!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        headerView = tableView.tableHeaderView
        tableView.tableHeaderView = nil
        tableView.addSubview(headerView)
        let effectiveHeight = kTableHeaderHeight-kTableCutAway/6
        tableView.contentInset = UIEdgeInsets(top: effectiveHeight, left: 0, bottom: 0, right: 0)
        tableView.contentOffset = CGPoint(x: 0, y: -effectiveHeight)
        headerMaskLayer = CAShapeLayer()
        headerMaskLayer.fillColor = UIColor.black.cgColor
        headerView.layer.mask = headerMaskLayer
        updateHeaderView()
    
        
    }
    
    override func scrollViewDidScroll(_ scrollView: UIScrollView) {
        updateHeaderView()
    }
    
    func updateHeaderView(){
        let effectiveHeight = kTableHeaderHeight-kTableCutAway/6
        var headerRect = CGRect(x: 0, y: -effectiveHeight, width: tableView.bounds.width, height: kTableHeaderHeight)
        if tableView.contentOffset.y < -effectiveHeight {
                headerRect.origin.y = tableView.contentOffset.y
                headerRect.size.height = -tableView.contentOffset.y + kTableCutAway/6
         }
        headerView.frame = headerRect
        let path = UIBezierPath()
        path.move(to: CGPoint(x: 0,y: 0))
        path.addLine(to: CGPoint(x: headerRect.width,y: 0))
        path.addLine(to: CGPoint(x: headerRect.width, y: headerRect.height))
        path.addLine(to: CGPoint(x: 0,y: headerRect.height-kTableCutAway))
        headerMaskLayer?.path = path.cgPath
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    override var prefersStatusBarHidden : Bool {
        return true
    }

    // MARK: - UITableViewDelegate
      override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    override func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item = items[(indexPath as NSIndexPath).row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! listItemCategory
        cell.listItem = item
        return cell
    }
    
    var valueToPass: Int!
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let row: Int! = (self.tableView.indexPathForSelectedRow! as NSIndexPath).row
        print("row \(row) was selected")
        if let rowNum = row {
        
        switch rowNum {
        case 0:
            valueToPass = 1
        case 1:
            valueToPass = 2
        case 2:
            valueToPass = 3
        case 3:
            valueToPass = 4
        case 4:
            valueToPass = 5
        case 5:
            valueToPass = 6
        case 6:
            valueToPass = 7
        case 7:
            valueToPass = 8
        case 8:
            valueToPass = 9
        case 9:
            valueToPass = 10
        case 10:
            valueToPass = 11
        case 11:
            valueToPass = 12
        case 12:
            valueToPass = 13
        case 13:
            valueToPass = 14
        case 14:
            valueToPass = 15
        case 15:
            valueToPass = 16
            
        case 16:
            valueToPass = 17
       
        default:
            print("err")
            }}
        performSegue(withIdentifier: "sendLBL", sender: self)
        
    }
    
    
    var headerView: UIView!
    
    let items = [
        listitem(category: .allergy),
        listitem(category: .asthmaAttack),
        listitem(category: .bleeding),
        listitem(category: .bruises),
        listitem(category: .burn),
        listitem(category: .choking),
        listitem(category: .cpr),
        listitem(category: .cuts),
        listitem(category: .dogBites),
        listitem(category: .eyeInjury),
        listitem(category: .faintness),
        listitem(category: .fracture),
        listitem(category: .heatStroke),
        listitem(category: .nosebleeds),
        listitem(category: .poisoning),
        listitem(category: .pulledMuscle),
        listitem(category: .snakebite),
        
        ]
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "sendLBL"{
            let controller = segue.destination as! StepsViewController
            controller.passedLabel = valueToPass
            
        }

    }
}

