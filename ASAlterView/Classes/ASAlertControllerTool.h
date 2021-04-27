//
//  ASAlertControllerTool.h
//  hxxdj
//
//  Created by 刘 on 2019/5/17.
//  Copyright © 2019 aisino. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
typedef void (^ActionBlock)(NSInteger buttonIndex);
typedef void (^CancelBlock)();
NS_ASSUME_NONNULL_BEGIN
@interface ASAlertControllerTool : NSObject

+(void)showAlertViewWithTitle:(nullable NSString *) title
                      message:(nullable NSString *) message alterStytel:(UIAlertControllerStyle)style
            cancelButtonTitle:(nullable NSString *) cancelButtonTitle
            otherButtonTitles:(nullable NSArray *) otherButtons
                    onAction:(nullable ActionBlock) actionBlock
                     onCancel:(nullable CancelBlock) cancelBlock; ;
@end

NS_ASSUME_NONNULL_END
