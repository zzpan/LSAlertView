//
//  ViewController.m
//  LSALertView
//
//  Created by panda zhang on 15/6/5.
//  Copyright (c) 2015年 panda zhang. All rights reserved.
//

#import "ViewController.h"
#import "LSAlertView.h"
#import "BottomExplainButton.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (IBAction)showAlertClick:(id)sender {
    LSAlertView *alert = [LSAlertView lsalertWithTitle:@"分享到"];
    
    CGFloat buttonSideLength = LSALERTWIDTH/3;
    NSArray *btnImageArray = @[@"share_sina_",@"share_weixin",@"share_qq_",@"share_zone_",@"share_friend_"];
    NSArray *btnTitleArray = @[@"微博",@"微信",@"QQ",@"空间",@"朋友圈"];
    for (int k = 0; k<5; k++) {
        int row = k/3;
        int line = k%3;
        BottomExplainButton *button = [[BottomExplainButton alloc]initButtonWithImage:[UIImage imageNamed:btnImageArray[k]]
                                                                              Explain:btnTitleArray[k]
                                                                             andFrame:CGRectMake(buttonSideLength*line+5, buttonSideLength*row+20*(row+1), buttonSideLength-10, buttonSideLength-10)];
        button.imageView.contentMode = UIViewContentModeScaleAspectFill;
        [alert.contentView addSubview:button];
    }
    
    alert.innerAlertSize = CGSizeMake(LSALERTWIDTH, 2*buttonSideLength+60+45);
    [alert show];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

@end
