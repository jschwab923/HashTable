//
//  JWCHashTable.m
//  HashTable
//
//  Created by Jeff Schwab on 2/26/14.
//  Copyright (c) 2014 Jeff Schwab. All rights reserved.
//

#import "JWCHashTable.h"
#import "JWCHashBucket.h"

@interface JWCHashTable ()

@property (nonatomic) NSMutableArray *tableArray;
@property (nonatomic) NSUInteger tableSize;

@property (nonatomic) NSUInteger numberOfObjects;

@end

@implementation JWCHashTable

- (id)init
{
    if (self = [super init]) {
        self.tableSize = 100;
        self.tableArray = [NSMutableArray new];
        
        for (int i = 0; i < 100; i++) {
            JWCHashBucket *bucket = [JWCHashBucket new];
            [self.tableArray addObject:bucket];
        }
    }
    return self;
}

- (NSUInteger)hash:(NSString *)key
{
    NSUInteger total = 0;
    for (int i = 0; i < key.length; i++) {
        total += [key characterAtIndex:i];
    }
    return total % self.tableSize;
}

- (void)setObject:(id)anObject forKey:(NSString *)key
{
    JWCHashBucket *bucket = [JWCHashBucket new];
    NSUInteger index = [self hash:key];
    
    bucket.object = anObject;
    bucket.key = key;
    
    JWCHashBucket *currentBucket = self.tableArray[index];
    bucket.next = currentBucket;
    
    self.tableArray[index] = bucket;

    self.numberOfObjects++;
}

- (id)objectForKey:(NSString *)key
{
    NSUInteger index = [self hash:key];
    JWCHashBucket *bucket = (JWCHashBucket *)self.tableArray[index];
    
    while (bucket) {
        if ([bucket.key isEqualToString:key]) {
            return bucket.object;
        } else {
            bucket = bucket.next;
        }
    }
    
    return nil;
}

- (void)removeObjectForKey:(NSString *)key
{
    NSUInteger index = [self hash:key];
    JWCHashBucket *previousBucket = nil;
    JWCHashBucket *bucket = self.tableArray[index];
    
    while (bucket) {
        if ([bucket.key isEqualToString:key]) {
            if (!previousBucket) {
                JWCHashBucket *nextBucket = bucket.next;
                self.tableArray[index] = nextBucket;
            } else {
                previousBucket.next = bucket.next;
            }
            self.numberOfObjects--;
            return;
        }
        previousBucket = bucket;
        bucket = bucket.next;
    }
}

@end
