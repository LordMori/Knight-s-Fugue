//
//  Connector.m
//  Knight's Fugue
//
//  Created by Marc Becker on 3/27/15.
//  Copyright (c) 2015 Marc Becker. All rights reserved.
//

#import "Connector.h"

@implementation Connector

+ (void)customizeBarButton:(UIBarButtonItem*)bbt{
    NSDictionary* barButtonItemAttributes =
    @{NSFontAttributeName:
          [UIFont fontWithName:@"Planewalker" size:20.0f],
      NSForegroundColorAttributeName:
          [UIColor whiteColor]
      };
    [bbt setTitleTextAttributes:barButtonItemAttributes forState:UIControlStateNormal];
}

@end
