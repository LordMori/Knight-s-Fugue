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
        self.morality = knightDict[@"morality"];
        self.dexterityLvl = knightDict[@"dexLvl"];
        self.intelligenceLvl = knightDict[@"intLvl"];
        self.strengthLvl = knightDict[@"strLvl"];
        self.healthLvl = knightDict[@"htLvl"];
        self.hitpointsLvl = knightDict[@"hpLvl"];
        self.willpowerLvl = knightDict[@"willLvl"];
        self.perception = knightDict[@"perLvl"];
        self.fatigueLvl = knightDict[@"fatLvl"];
        self.moveLvl = knightDict[@"moveLvl"];
        self.speedLvl = knightDict[@"spdLvl"];
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
    if(self.morality == nil){
        self.morality = @"";
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
    if(self.healthLvl == nil){
        self.healthLvl = @0;
    }
    if(self.hitpointsLvl == nil){
        self.hitpointsLvl = @0;
    }
    if(self.perception== nil){
        self.perception = @0;
    }
    if(self.moveLvl == nil){
        self.moveLvl = @0;
    }
    if(self.speedLvl == nil){
        self.speedLvl = @0;
    }
    if(self.willpowerLvl == nil){
        self.willpowerLvl = @0;
    }
    if(self.fatigueLvl == nil){
        self.fatigueLvl = @0;
    }
    
    return @{
             @"name": self.name,
             @"class": self.class,
             @"morality": self.morality,
             @"dexLvl": self.dexterityLvl,
             @"strLvl": self.strengthLvl,
             @"intLvl": self.intelligenceLvl,
             @"willLvl": self.willpowerLvl,
             @"htLvl": self.healthLvl,
             @"hpLvl": self.hitpointsLvl,
             @"fatLvl": self.fatigueLvl,
             @"perLvl": self.perception,
             @"moveLvl": self.moveLvl,
             @"spdLvl": self.speedLvl,
             };
}

@end
