//
//  LSAlertView.h
//  LSALertView
//
//  Created by panda zhang on 15/6/8.
//  Copyright (c) 2015年 panda zhang. All rights reserved.
//

#import <UIKit/UIKit.h>

#define LSALERTWIDTH ([UIScreen mainScreen].bounds.size.width-80)

@interface LSAlertView : UIView

@property (nonatomic, strong)UIView *innerAlertView;
@property (nonatomic, strong)UIView *contentView;
@property (nonatomic, assign)CGSize innerAlertSize;
@property (nonatomic, strong)NSString *alertTitle;

+ (instancetype)lsalertWithTitle:(NSString *)title;

-(void)show;
-(void)hidden;

@end
