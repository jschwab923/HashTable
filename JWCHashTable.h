//
//  JWCHashTable.h
//  HashTable
//
//  Created by Jeff Schwab on 2/26/14.
//  Copyright (c) 2014 Jeff Schwab. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JWCHashTable : NSObject

- (void)setObject:(id)anObject forKey:(NSString *)key;
- (id)objectForKey:(NSString *)key;

@end
