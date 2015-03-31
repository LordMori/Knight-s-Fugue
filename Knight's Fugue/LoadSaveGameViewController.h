//
//  LoadSaveGameViewController.h
//  Knight's Fugue
//
//  Created by Marc Becker on 3/30/15.
//  Copyright (c) 2015 Marc Becker. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Connector.h"
#import "SavedGameData.h"
#import "Knight.h"

@interface LoadSaveGameViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIBarButtonItem *cancelUI_B;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *loadUI_B;

@end
