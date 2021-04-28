//
//  DemoManagerBridge.m
//  DemoSwift
//
//  Created by Thanh Ha on 4/27/21.
//

#import <Foundation/Foundation.h>
#import <React/RCTBridgeModule.h>

@interface RCT_EXTERN_MODULE(DemoManager, NSObject)

RCT_EXTERN_METHOD(
                  getData:(NSString *)title
                  resolver: (RCTPromiseResolveBlock)resolver
                  rejecter: (RCTPromiseRejectBlock)rejecter
)

@end

