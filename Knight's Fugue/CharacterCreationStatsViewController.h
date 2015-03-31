//
//  CharacterCreationStatsViewController.h
//  Knight's Fugue
//
//  Created by Marc Becker on 3/30/15.
//  Copyright (c) 2015 Marc Becker. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Connector.h"
#import "SavedGameData.h"
#import "Knight.h"

@interface CharacterCreationStatsViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIBarButtonItem *cancelUI_B;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *createUI_B;

@end
