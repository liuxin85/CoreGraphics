//
//  ViewController.h
//  CoreGraphic-iphone
//
//  Created by liuxin on 14-7-25.
//  Copyright (c) 2014年 liu xin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
#import "CoreGraphicView.h"

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet CoreGraphicView *myView;
@end
