//
//  Knight.h
//  Knight's Fugue
//
//  Created by Marc Becker on 3/26/15.
//  Copyright (c) 2015 Marc Becker. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Knight : NSObject

@property NSString *name;
@property NSString *class;
@property NSNumber *strengthLvl;
@property NSNumber *dexterityLvl;
@property NSNumber *intelligenceLvl;

- (id)initWithDictionary:(NSDictionary *)sgdDict;
- (NSDictionary *)toDictionary;

@end
