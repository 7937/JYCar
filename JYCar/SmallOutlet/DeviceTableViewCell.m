//
//  DeviceTableViewCell.m
//  UniversalFramewrok_1
//
//  Created by VKWK on 6/18/15.
//  Copyright (c) 2015 VikingWarlock. All rights reserved.
//

#import "DeviceTableViewCell.h"

@interface DeviceTableViewCell()
{
    UILabel *nameLabel;
    UILabel *statusLabel;
}
@end

@implementation DeviceTableViewCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self=[super initWithStyle:style reuseIdentifier:reuseIdentifier];

    if (self) {
        
        if (nameLabel==nil) {
            nameLabel=[[UILabel alloc]init];
            nameLabel.backgroundColor=[UIColor clearColor];
            nameLabel.textColor=[UIColor blackColor];
            [self.contentView addSubview:nameLabel];
        }
        
        if (statusLabel==nil) {
            statusLabel=[[UILabel alloc]init];
            statusLabel.backgroundColor=[UIColor clearColor];
            statusLabel.textColor=[UIColor blackColor];
            [self.contentView addSubview:statusLabel];
        }
    }
    
    return self;

}

-(void)setFrame:(CGRect)frame
{
    [super setFrame:frame];
    nameLabel.frame=CGRectMake(5.f, 5.f, frame.size.width/2.f-10.f, frame.size.height-10.f);
    statusLabel.frame=CGRectMake(frame.size.width/2.f+5.f, 5.f, frame.size.width/2.f-10.f, frame.size.height-10.f);
}

-(UILabel *)nameLabel
{
    return nameLabel;
}

-(UILabel *)statusLabel
{
    return statusLabel;
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
