//
//  SchoolListTC.swift
//  AdaptivePopover
//
//  Created by 曹剑楠 on 14/6/8.
//  Copyright (c) 2014年 Cao Jiannan. All rights reserved.
//

import UIKit

class SchoolListTC: UITableViewController, UIPopoverPresentationControllerDelegate {
    
    init(coder aDecoder: NSCoder!) {
        super.init(coder: aDecoder)
        
        // popover settings
        modalPresentationStyle = .Popover
        popoverPresentationController.delegate = self
        
        //cancel button
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .Cancel, target: self, action: "tapCancel:")

    }
    
    func tapCancel(_ : UIBarButtonItem) {
        //tap cancel
        dismissViewControllerAnimated(true, completion:nil);
    }
    
    override func tableView(tableView: UITableView!, didSelectRowAtIndexPath indexPath: NSIndexPath!){
        //select school
        let schoolName = tableView.cellForRowAtIndexPath(indexPath).textLabel.text
        println("did select school: \(schoolName)")
        dismissViewControllerAnimated(true, completion:nil)
    }
    
    // popover settings, adaptive for horizontal compact trait
    // #pragma mark - UIPopoverPresentationControllerDelegate
    
    func adaptivePresentationStyleForPresentationController(_: UIPresentationController!)
         -> UIModalPresentationStyle{
            return .FullScreen
    }
    
    func presentationController(_: UIPresentationController!, viewControllerForAdaptivePresentationStyle _: UIModalPresentationStyle)
         -> UIViewController!{
            return UINavigationController(rootViewController: self)
    }
}