//
//  SavedGameData.m
//  Knight's Fugue
//
//  Created by Marc Becker on 3/26/15.
//  Copyright (c) 2015 Marc Becker. All rights reserved.
//

#import "SavedGameData.h"

@implementation SavedGameData
@synthesize knight;

- (id)initWithDictionary:(NSDictionary *)sgdDict {
    self = [super init];
    if (self) {
        self.knight = sgdDict[@"knight"];
        self.saveDate = sgdDict[@"saveDate"];
    }
    return self;
}

- (NSDictionary *)toDictionary {
    return @{
             @"knight": self.knight,
             @"saveDate": self.saveDate
             };
}

- (void)resetSaveData{
    self.knight = nil;
    self.saveDate = nil;
}

@end
