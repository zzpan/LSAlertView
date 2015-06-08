//
//  LSAlertView.m
//  LSALertView
//
//  Created by panda zhang on 15/6/8.
//  Copyright (c) 2015年 panda zhang. All rights reserved.
//

#import "LSAlertView.h"

@interface LSAlertView ()
{
    UILabel *_titleLabel;
}

@end

@implementation LSAlertView

- (instancetype)init
{
    if (self = [super init]) {
        [self setAlertView];
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    if (self = [super initWithCoder:aDecoder]) {
        
    }
    return self;
}

+ (instancetype)lsalertWithTitle:(NSString *)title
{
    CGFloat lsScreenWidth = [UIScreen mainScreen].bounds.size.width;
    CGFloat lsScreenHeight = [UIScreen mainScreen].bounds.size.height;
    LSAlertView *alertView = [[self alloc]initWithFrame:CGRectMake(0, 0, lsScreenWidth, lsScreenHeight)];
    if (alertView) {
        alertView.alertTitle = title;
        [alertView setAlertView];
    }
    return alertView;
}

#pragma mark - UI Code

- (void)setAlertView
{
    self.innerAlertSize = CGSizeMake(LSALERTWIDTH, 0);
    self.innerAlertView = [[UIView alloc]initWithFrame:CGRectZero];
    self.innerAlertView.backgroundColor = [UIColor colorWithWhite:0.98 alpha:1.f];
    self.innerAlertView.center = CGPointMake(self.frame.size.width/2, self.frame.size.height/2);
    _innerAlertView.clipsToBounds = YES;
    
    _titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(10, 0,self.innerAlertSize.width-70,44)];
    _titleLabel.font = [UIFont boldSystemFontOfSize:16.f];
    _titleLabel.text = self.alertTitle;
    _titleLabel.textColor = [UIColor colorWithWhite:0.2f alpha:1.f];
    [_innerAlertView addSubview:_titleLabel];
    
    UIButton *cancelButton = [UIButton buttonWithType:UIButtonTypeSystem];
    cancelButton.titleLabel.font = [UIFont systemFontOfSize:14.f];
    [cancelButton setTitle:@"取消" forState:UIControlStateNormal];
    [cancelButton setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [cancelButton addTarget:self action:@selector(hidden) forControlEvents:UIControlEventTouchUpInside];
    cancelButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
    cancelButton.frame = CGRectMake(_titleLabel.frame.size.width, 0, 60, 44);
    
    [_innerAlertView addSubview:cancelButton];
    
    UIView *line = [[UIView alloc]initWithFrame:CGRectMake(0, 44, self.innerAlertSize.width, 1.f)];
    line.backgroundColor = [UIColor colorWithWhite:0.8f alpha:1.f];
    [_innerAlertView addSubview:line];
    
    self.contentView = [[UIView alloc]initWithFrame:CGRectMake(0, 45, 100, 100)];
    _contentView.backgroundColor = [UIColor colorWithWhite:0.f alpha:0.f];
    [_innerAlertView addSubview:_contentView];
    
    [self addSubview:self.innerAlertView];
}

#pragma mark - public
- (void)show
{
    UIWindow *window = [[UIApplication sharedApplication].delegate window];
    [window makeKeyAndVisible];
    
    self.backgroundColor = [UIColor colorWithWhite:0.0 alpha:0.0f];
    [window addSubview:self];
    
    if (self.innerAlertSize.height==0) {
        self.innerAlertSize = CGSizeMake(LSALERTWIDTH, 120);
    }
    self.innerAlertView.alpha = 0.2;
    self.innerAlertView.bounds = CGRectMake(0, 0, self.innerAlertSize.width, self.innerAlertSize.height);
    self.innerAlertView.transform = CGAffineTransformScale(self.innerAlertView.transform, .2f, .2f);
    [UIView animateWithDuration:.4f
                          delay:0
         usingSpringWithDamping:1.0f
          initialSpringVelocity:0.f
                        options:UIViewAnimationOptionCurveEaseOut|UIViewAnimationOptionBeginFromCurrentState|UIViewAnimationOptionAllowUserInteraction
                     animations:^{
                         self.innerAlertView.alpha = 1.f;
                         self.backgroundColor = [UIColor colorWithWhite:0.0 alpha:0.5f];
                         self.innerAlertView.transform = CGAffineTransformScale(self.innerAlertView.transform, 5.f, 5.f);
    }
                     completion:^(BOOL finished) {
        ;
    }];
}

- (void)hidden
{
    [UIView animateWithDuration:0.5f
                          delay:0
         usingSpringWithDamping:1.0f
          initialSpringVelocity:0.f
                        options:UIViewAnimationOptionCurveEaseIn|UIViewAnimationOptionBeginFromCurrentState|UIViewAnimationOptionAllowUserInteraction
                     animations:^{
                         self.backgroundColor = [UIColor colorWithWhite:0.0 alpha:0.0f];
                         self.innerAlertView.transform = CGAffineTransformScale(self.innerAlertView.transform, 0.2, 0.2);
                         self.innerAlertView.alpha = 0.0f;
                     }
                     completion:^(BOOL finished){
                         if (finished) {
                             [self removeFromSuperview];
                         }
                     }
     ];
}

- (void)setInnerAlertSize:(CGSize)innerAlertSize
{
    _innerAlertSize = innerAlertSize;
    self.contentView.frame = CGRectMake(0, 45, innerAlertSize.width, innerAlertSize.height-45);
    
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
