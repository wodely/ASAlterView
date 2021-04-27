//
//  ASAlertControllerTool.m
//  hxxdj
//
//  Created by 刘 on 2019/5/17.
//  Copyright © 2019 aisino. All rights reserved.
//

#import "ASAlertControllerTool.h"
static ActionBlock _actionBlock;
static CancelBlock _cancelBlock;
@implementation ASAlertControllerTool
+(void)showAlertViewWithTitle:(nullable NSString *)title message:(NSString *)message alterStytel:(UIAlertControllerStyle)style cancelButtonTitle:(NSString *)cancelButtonTitle otherButtonTitles:(NSArray *)otherButtons onAction:(ActionBlock)actionBlock onCancel:(CancelBlock)cancelBlock{
    _actionBlock = [actionBlock copy];
    _cancelBlock = [cancelBlock copy];
    UIAlertController *alter = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:style];
    NSMutableArray *actinArr= @[].mutableCopy;
    if (otherButtons.count>0) {
        for (NSString *title in otherButtons) {
            UIAlertAction *action = [UIAlertAction actionWithTitle:title style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                for (UIAlertAction *x in actinArr) {
                    if ([x isEqual:action]) {
                        NSInteger index = [actinArr indexOfObject:x];
                        _actionBlock(index);
                    }
                }
            }];

            [actinArr addObject:action];
            [alter addAction:action];
        }
    }
    
    if (cancelButtonTitle.length>0) {
        UIAlertAction *cancalAction = [UIAlertAction actionWithTitle:cancelButtonTitle style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            _cancelBlock();
        }];
        [alter addAction:cancalAction];
    }
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    UIViewController *current = [self currentViewController:window];
    [current presentViewController:alter animated:YES completion:nil];
    
}

+(UIViewController *)currentViewController:(UIWindow*)window
{
    UIViewController *viewController = window.rootViewController;
    while (viewController.presentedViewController) {
        viewController = viewController.presentedViewController;
    }
    return viewController;
}


@end
