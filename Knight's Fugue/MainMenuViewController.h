//
//  ViewController.h
//  Knight's Fugue
//
//  Created by Marc Becker on 3/23/15.
//  Copyright (c) 2015 Marc Becker. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Connector.h"

@interface MainMenuViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIButton *loadGameUI_B;
@property (weak, nonatomic) IBOutlet UILabel *savedGameLabel;

@property (weak, nonatomic) IBOutlet UIButton *gameNewUI_B;


@end

