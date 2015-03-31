//
//  MageClass.m
//  Knight's Fugue
//
//  Created by Marc Becker on 3/30/15.
//  Copyright (c) 2015 Marc Becker. All rights reserved.
//

#import "MageClass.h"

@implementation MageClass

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
    self.class = @"mage";
    self.strengthLvl = @9;
    self.dexterityLvl = @10;
    self.intelligenceLvl = @13;
    self.healthLvl = @10;
    self.hitpointsLvl = @9;
    self.willpowerLvl = @15;
    self.perception = @13;
    self.fatigueLvl = @18;
    self.moveLvl = @5;
    self.speedLvl = @5;
    
    return self;
}

@end
