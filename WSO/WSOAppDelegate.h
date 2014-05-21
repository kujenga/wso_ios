//
//  WSOAppDelegate.h
//  WSO
//
//  Created by Aaron Taylor on 5/4/14.
//  Copyright (c) 2014 Williams Students Online. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface WSOAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (strong, atomic) UIColor *WSOPurple;
#define WSO_PURPLE ((WSOAppDelegate*)[UIApplication sharedApplication].delegate).WSOPurple

@end
