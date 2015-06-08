//
//  BottomExplainButton.m
//  iSmile365
//
//  Created by panda zhang on 15/2/28.
//  Copyright (c) 2015年 Wonders. All rights reserved.
//

#import "BottomExplainButton.h"

@interface BottomExplainButton ()

@property (nonatomic, strong)UITapGestureRecognizer *tapRecognizer;

@end

@implementation BottomExplainButton

- (instancetype)initButtonWithImage:(UIImage*)image
                    Explain:(NSString *)explain
                   andFrame:(CGRect)frame
{
    if ([super initWithFrame:frame]) {
        //图片
        self.imageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, frame.size.height-20, frame.size.height-20)];
        self.imageView.center = CGPointMake(frame.size.width/2, frame.size.height/2-12);
        self.imageView.contentMode = UIViewContentModeBottom;
        self.imageView.image = image;
        
        //文字描述
        self.explainLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, frame.size.height-20, frame.size.width, 20)];
        self.explainLabel.text = explain;
        self.explainLabel.font = [UIFont systemFontOfSize:14.f];
        self.explainLabel.textColor = [UIColor darkGrayColor];
        self.explainLabel.textAlignment = NSTextAlignmentCenter;
        
        [self addSubview:self.imageView];
        [self addSubview:self.explainLabel];
        
        self.userInteractionEnabled = YES;
        self.tapRecognizer = [[UITapGestureRecognizer alloc]init];
        [self addGestureRecognizer:self.tapRecognizer];
    }
    
    return self;
}


- (void)addButtonTarget:(id)target Action:(SEL)action
{
    [self.tapRecognizer addTarget:target action:action];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
