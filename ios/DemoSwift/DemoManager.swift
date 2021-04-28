//
//  DemoManager.swift
//  DemoSwift
//
//  Created by Thanh Ha on 4/27/21.
//

import Alamofire
import TrustKit

@objc(DemoManager)
class DemoManager: NSObject {
  
  override init() {
    //SSL Pining
    TrustKit.setLoggerBlock { (message) in
      print("TrustKit log: \(message)")
    }
    
    let trustKitConfig = [
      kTSKSwizzleNetworkDelegates: false,
      kTSKPinnedDomains: [
        "stg.admin.working-wellness.com": [
          kTSKEnforcePinning: true,
          kTSKIncludeSubdomains: true,
          kTSKPublicKeyHashes: [
            "ZbB2Fwp7HXJ0YTXIR2IqAzkuRFgoDyvyM3pYlBTbUzk=",
            "JSMzqOOrtyOT1kmau6zKhgT676hGgczD5VMdRMyJZFA="
          ],
        ]
      ]
    ] as [String : Any]
    
    ServerTrustManager
    
    TrustKit.initSharedInstance(withConfiguration: trustKitConfig)
  }
  
  
  
  @objc(getData:resolver:rejecter:)
  func getData(title: String,
               resolver:@escaping RCTPromiseResolveBlock,
               rejecter: RCTPromiseRejectBlock) {
    
    let request = AF.request("https://stg.admin.working-wellness.com/api/weather")
    
    request.responseJSON {
      response in switch response.result {
      case .success(let JSON):
        //          print("Success with JSON: \(JSON)")
        //          print("---")
        resolver(JSON)
      case .failure(let err):
        print("Request failed with error: \(err)")
      }
    }
    
  }
  
  
}
