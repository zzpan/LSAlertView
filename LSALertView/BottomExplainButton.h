//
//  BottomExplainButton.h
//  iSmile365
//
//  Created by panda zhang on 15/2/28.
//  Copyright (c) 2015年 Wonders. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BottomExplainButton : UIView

@property (nonatomic, strong)UIImageView *imageView;
@property (nonatomic, strong)UILabel *explainLabel;

- (void)addButtonTarget:(id)target Action:(SEL)action;

- (instancetype)initButtonWithImage:(UIImage*)image
                            Explain:(NSString *)explain
                           andFrame:(CGRect)frame;

@end
