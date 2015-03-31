//
//  AssassinClass.m
//  Knight's Fugue
//
//  Created by Marc Becker on 3/30/15.
//  Copyright (c) 2015 Marc Becker. All rights reserved.
//

#import "AssassinClass.h"

@implementation AssassinClass

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
    self.class = @"assassin";
    self.strengthLvl = @14;
    self.dexterityLvl = @11;
    self.intelligenceLvl = @9;
    self.healthLvl = @13;
    self.hitpointsLvl = @14;
    self.willpowerLvl = @11;
    self.perception = @10;
    self.fatigueLvl = @16;
    self.moveLvl = @1;
    self.speedLvl = @5;
    
    return self;
}

@end
