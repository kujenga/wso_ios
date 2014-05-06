//
//  WSOFacebookTableViewCell.h
//  WSO
//
//  Created by Aaron Taylor on 5/6/14.
//  Copyright (c) 2014 Williams Students Online. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WSOFacebookTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *profileImage;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *unixLabel;
@property (weak, nonatomic) IBOutlet UILabel *roomLabel;

@end
