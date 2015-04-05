//
//  SavedGameData.h
//  Knight's Fugue
//
//  Created by Marc Becker on 3/26/15.
//  Copyright (c) 2015 Marc Becker. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Knight.h"

@interface SavedGameData : NSObject

@property NSString* saveDate;
@property NSDictionary* knight;

- (id)initWithDictionary:(NSDictionary *)sgdDict;
- (NSDictionary *)toDictionary;

- (void)resetSaveData;

@end
