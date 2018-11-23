//
//  PasswordView.h
//  JXTTest
//
//  Created by 姜训彤 on 2018/11/9.
//  Copyright © 2018 JXT. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@class PasswordView;

@protocol PasswordViewDelegate<NSObject>

-(void)passWordDidChange:(PasswordView *)password;

-(void)passWordCompleteInput:(PasswordView *)password;

-(void)passWordBeginInput:(PasswordView *)password;

@end
@interface PasswordView : UIView<UIKeyInput>
@property (nonatomic) NSInteger passWordNum;//密码的位数
@property (nonatomic) CGFloat squareWidth;//密码框的大小
@property (nonatomic) CGFloat pointRadius;//黑点半径
@property (nonatomic) UIColor *pointColor;//黑点颜色
@property (nonatomic) UIColor *rectColor;//边框颜色
@property (nonatomic) id<PasswordViewDelegate> delegate;//
@property (nonatomic,readonly,strong) NSMutableString *textStore;//保存密码的字符串
@end

NS_ASSUME_NONNULL_END
