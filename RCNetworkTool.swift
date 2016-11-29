//
//  RCNetworkTool.swift
//  Swift3对AFN的封装
//
//  Created by 何晓文 on 2016/11/25.
//  Copyright © 2016年 何晓文. All rights reserved.
//

import UIKit
import AFNetworking

enum RCRequestType {
    case GET
    case POST
}

class RCNetworkTool: AFHTTPSessionManager {

  
    static let shareInstance : RCNetworkTool = {
        let tool = RCNetworkTool()
        tool.responseSerializer.acceptableContentTypes?.insert("text/html")
        return tool
        
    }()
        // MARK: - *** 成功或失败 ***
    
    func request(requestType: RCRequestType, url : String, params: [String : Any], success: @escaping([String : Any]?) ->(),failure: @escaping( _ error : Error?) -> ()){
        //成功

        let successBlock = { (task: URLSessionDataTask, responseObj: Any?) in
            success(responseObj as? [String : Any])
        }
        //失败
        let failureBlock = {(task : URLSessionDataTask?,error:Error) in
        failure(error)
        
        }
        
        //GET
        if requestType == .GET{
        get(url, parameters: params, progress: nil, success: successBlock, failure: failureBlock)
            

        }
        //POST
        if requestType == .POST{
            post(url, parameters: params, progress: nil, success: successBlock, failure: failureBlock)
        
        }
        
    
    
    }

}
