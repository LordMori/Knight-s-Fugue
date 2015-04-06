//
//  CharacterCreationStatsViewController.h
//  Knight's Fugue
//
//  Created by Marc Becker on 4/6/15.
//  Copyright (c) 2015 Marc Becker. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Connector.h"

@interface CharacterCreationStatsViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *strengthLabel;
@property (weak, nonatomic) IBOutlet UILabel *dexterityLabel;
@property (weak, nonatomic) IBOutlet UILabel *intelligenceLabel;
@property (weak, nonatomic) IBOutlet UILabel *healthLabel;
@property (weak, nonatomic) IBOutlet UILabel *willpowerLabel;
@property (weak, nonatomic) IBOutlet UILabel *perceptionLabel;
@property (weak, nonatomic) IBOutlet UILabel *hitPointsLabel;
@property (weak, nonatomic) IBOutlet UILabel *fatiguePointsLabel;
@property (weak, nonatomic) IBOutlet UILabel *basicSpeedLabel;
@property (weak, nonatomic) IBOutlet UILabel *basicMoveLabel;

@property (weak, nonatomic) IBOutlet UILabel *descriptionLabel;

@end
