//
//  MessagingQueue.h
//  ExploreHRM
//
//  Created by Thomas Eaton on 2013-11-28.
//  Copyright (c) 2013 explorehrm. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CLLocation.h>

@interface MessagingQueue : NSObject <NSURLConnectionDelegate, NSURLConnectionDataDelegate>

@property (strong, atomic) NSMutableDictionary *messageQueue;
@property (strong, atomic) NSMutableDictionary *incompleteMessages;
@property (strong, atomic) NSMutableDictionary *connectionStringToIDDictionary;

+ (MessagingQueue *) getSharedInstance;
- (NSInteger) getDirectionsFromCurrentPosition:(CLLocationCoordinate2D)currentPosition EndPosition:(NSString*)endPosition;
@end
