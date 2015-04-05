//
//  RogueClass.m
//  Knight's Fugue
//
//  Created by Marc Becker on 3/30/15.
//  Copyright (c) 2015 Marc Becker. All rights reserved.
//

#import "RogueClass.h"

@implementation RogueClass

NSString *class;
NSNumber *strengthLvl;
NSNumber *dexterityLvl;
NSNumber *intelligenceLvl;
NSNumber *healthLvl;
NSNumber *hitpointsLvl;
NSNumber *willpowerLvl;
NSNumber *perception;
NSNumber *fatigueLvl;
NSNumber *moveLvl;
NSNumber *speedLvl;

- (instancetype)init{
    self.class = @"rogue";
    self.strengthLvl = @11;
    self.dexterityLvl = @11;
    self.intelligenceLvl = @10;
    self.healthLvl = @12;
    self.hitpointsLvl = @11;
    self.willpowerLvl = @11;
    self.perception = @13;
    self.fatigueLvl = @16;
    self.moveLvl = @6;
    self.speedLvl = @5.75;
    
    return self;
}

@end
