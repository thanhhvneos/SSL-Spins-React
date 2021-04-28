//
//  RCTRequestAPI.m
//  DemoSwift
//
//  Created by Thanh Ha on 4/28/21.
//

#import "RCTRequestAPI.h"

@implementation RCTRequestAPI

RCT_EXPORT_MODULE()

RCT_EXPORT_METHOD(getData:(NSString *)name location:(NSString *)location)
{
  NSLog(@"Hello %@ from %@", name, location);
}

@end

