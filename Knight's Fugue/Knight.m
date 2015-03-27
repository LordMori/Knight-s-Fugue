//
//  Knight.m
//  Knight's Fugue
//
//  Created by Marc Becker on 3/26/15.
//  Copyright (c) 2015 Marc Becker. All rights reserved.
//

#import "Knight.h"

@implementation Knight

- (id)initWithDictionary:(NSDictionary *)knightDict {
    self = [super init];
    if (self) {
        self.name = knightDict[@"name"];
        self.class = knightDict[@"class"];
        self.dexterityLvl = knightDict[@"dexLvl"];
        self.intelligenceLvl = knightDict[@"intLvl"];
        self.strengthLvl = knightDict[@"strLvl"];
    }
    return self;
}

- (NSDictionary *)toDictionary {
    if(self.name == nil){
        self.name = @"";
    }
    if(self.class == nil){
        self.class = @"";
    }
    if(self.dexterityLvl == nil){
        self.dexterityLvl = @0;
    }
    if(self.strengthLvl == nil){
        self.strengthLvl = @0;
    }
    if(self.intelligenceLvl == nil){
        self.intelligenceLvl = @0;
    }
    
    return @{
             @"name": self.name,
             @"class": self.class,
             @"dexLvl": self.dexterityLvl,
             @"strLvl": self.intelligenceLvl,
             @"intLvl": self.strengthLvl
             };
}

@end
