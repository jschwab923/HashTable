//
//  JWCHashBucket.h
//  HashTable
//
//  Created by Jeff Schwab on 2/26/14.
//  Copyright (c) 2014 Jeff Schwab. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JWCHashBucket : NSObject

@property (nonatomic) NSString *key;
@property (nonatomic) id object;

@property (nonatomic) JWCHashBucket *next;

@end
