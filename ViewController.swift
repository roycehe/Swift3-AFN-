//
//  ViewController.swift
//  Swift3对AFN的封装
//
//  Created by 何晓文 on 2016/11/25.
//  Copyright © 2016年 何晓文. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  let kUrl = "http://apiv2.yangkeduo.com/operation/15/groups"
    let parameters = [
        "opt_type": 1,
        "size" : 5,
        "offset" : 5
    ]
    override func viewDidLoad() {
        super.viewDidLoad()
        RCNetworkTool.shareInstance.request(requestType: .GET, url: kUrl, params: parameters, success: {(responseObj) in
        
       
            guard let dicArray = responseObj?["opt_infos"] as? [[String : Any]] else{
            return
            }
            print(dicArray)
            
            
            
        }) {(error) in
            
            print(error)
            
            
        }
            


        
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

