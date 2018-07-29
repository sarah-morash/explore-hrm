//
//  MessagingQueue.m
//  ExploreHRM
//
//  Created by Thomas Eaton on 2013-11-28.
//  Copyright (c) 2013 explorehrm. All rights reserved.
//

#import "MessagingQueue.h"

@implementation MessagingQueue 

int messageID;

+ (MessagingQueue *)getSharedInstance {
    static MessagingQueue *sharedInstance;
    
    if(!sharedInstance) {
        sharedInstance = [[MessagingQueue alloc] init];
    }
    return sharedInstance;
}

- (id)init
{
    self = [super init];
    if (self) {
        _messageQueue = [[NSMutableDictionary alloc] init];
        _connectionStringToIDDictionary = [[NSMutableDictionary alloc] init];
        _incompleteMessages = [[NSMutableDictionary alloc] init];
    }
    return self;
}

- (NSInteger) getDirectionsFromCurrentPosition:(CLLocationCoordinate2D)currentPosition EndPosition:(NSString*)endPosition {
    
    messageID++;
    
    endPosition = [endPosition stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
    while([endPosition rangeOfString:@"  "].location != NSNotFound) {
        endPosition = [endPosition stringByReplacingOccurrencesOfString:@"  " withString:@" "];
    }
    endPosition = [endPosition stringByReplacingOccurrencesOfString:@" " withString:@"+"];
    endPosition = [NSString stringWithFormat:@"%@%@",endPosition,@",+Halifax,+Nova+Scotia"];

    NSString *connectionString = [NSString stringWithFormat:@"http://maps.googleapis.com/maps/api/directions/json?origin=%f,%f&destination=%@&mode=walking&sensor=true", currentPosition.latitude, currentPosition.longitude, endPosition];
    
    NSURLRequest *request = [[NSURLRequest alloc] initWithURL:[[NSURL alloc] initWithString:connectionString]];
    NSURLConnection *connection = [[NSURLConnection alloc] initWithRequest:request delegate:self startImmediately:YES];
    
    [self.connectionStringToIDDictionary setValue:[NSNumber numberWithInt:messageID] forKey:connectionString];
    return messageID;
}

- (void) connection:(NSURLConnection *)connection didReceiveData:(NSData *)data {
    
    NSString  *serverText = [[NSString alloc] initWithBytes:data.bytes
                                                     length:data.length
                                                   encoding:NSASCIIStringEncoding];
    
    if([_incompleteMessages objectForKey:connection.originalRequest.URL.absoluteString]) {
        serverText = [NSString stringWithFormat:@"%@%@",[_incompleteMessages objectForKey:connection.originalRequest.URL.absoluteString],serverText];
    }
    
    NSLog(@"------\n------\n------\n%@", serverText);
    
    NSError *error;
    NSDictionary *dataObject = [NSJSONSerialization JSONObjectWithData:[serverText dataUsingEncoding:NSUTF8StringEncoding] options:NSJSONReadingMutableContainers error:&error];
    
    if(error == nil) {
        [_incompleteMessages removeObjectForKey:connection.originalRequest.URL.path];
        [self.messageQueue setValue:dataObject forKey:[_connectionStringToIDDictionary objectForKey:connection.originalRequest.URL.absoluteString]];
    }
    else {
        // The message has not fully arrived yet (Hopefully)
        [_incompleteMessages setValue:serverText forKey:connection.originalRequest.URL.absoluteString];
    }
}
@end
