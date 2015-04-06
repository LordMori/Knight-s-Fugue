//
//  Connector.h
//  Knight's Fugue
//
//  Created by Marc Becker on 3/27/15.
//  Copyright (c) 2015 Marc Becker. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "UILabel+ActionSheet.h"
#import "SavedGameData.h"
#import "Knight.h"
#import "BerserkerClass.h"
#import "RogueClass.h"
#import "MageClass.h"
#import "AssassinClass.h"
#import "WarriorClass.h"
#import "TemplarClass.h"

@interface Connector : NSObject

+ (void)customizeBarButton:(UIBarButtonItem*)bbt;
+ (void)createCancelAlertController:(UIViewController*)vc title:(NSString*)title message:(NSString*)message;
+ (void)createCustomAlertController:(UIViewController*)vc title:(NSString*)title message:(NSString*)message actions:(NSArray*)actions;
+ (void)createNameTextAlertController:(UIViewController*)vc title:(NSString*)title message:(NSString*)message;
@end
