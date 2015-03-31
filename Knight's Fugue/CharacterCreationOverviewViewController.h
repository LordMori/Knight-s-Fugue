//
//  CharacterCreationOverviewViewController.h
//  Knight's Fugue
//
//  Created by Marc Becker on 3/23/15.
//  Copyright (c) 2015 Marc Becker. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Connector.h"
#import "SavedGameData.h"
#import "Knight.h"

@interface CharacterCreationOverviewViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIBarButtonItem *cancelUI_B;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *createUI_B;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *moralityLabel;
@property (weak, nonatomic) IBOutlet UILabel *classLabel;
@property (weak, nonatomic) IBOutlet UILabel *strengthLabel;
@property (weak, nonatomic) IBOutlet UILabel *intelligenceLabel;
@property (weak, nonatomic) IBOutlet UILabel *dexterityLabel;
@property (weak, nonatomic) IBOutlet UILabel *descriptionLabel;

@end
