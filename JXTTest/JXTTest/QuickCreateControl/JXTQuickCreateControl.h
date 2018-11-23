//
//  QuickCreateControl.h
//  RailcomExchange
//
//  Created by 姜训彤 on 2018/9/28.
//  Copyright © 2018年 JXT. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface JXTQuickCreateControl : UIView

/**
 快速创建label
 
 @param title <#title description#>
 @param font <#font description#>
 @param textColor <#textColor description#>
 @return <#return value description#>
 */
+ (UILabel *)JXTConvenientControlLabel:(NSString *)title
                                 Font:(UIFont *)font
                            TextColor:(UIColor *)textColor;

/**
 快速创建线Labele

 @return UILabel
 */
+ (UILabel *)JXTConvenientControlLineLabel;


/**
 快速创建button（圆角）
 
 @param title <#title description#>
 @param font <#font description#>
 @param textColor <#textColor description#>
 @param backgroundColor <#backgroundColor description#>
 @return <#return value description#>
 */
+ (UIButton *)JXTConvenientControlButton:(NSString *)title
                                   Font:(UIFont *)font
                              TextColor:(UIColor *)textColor
                        BackgroundColor:(UIColor *)backgroundColor;


/**
 创建UItextfeild
 
 @param placeholder <#placeholder description#>
 @param textFieldfont <#textFieldfont description#>
 @param textColor <#textColor description#>
 @param backgroundColor <#backgroundColor description#>
 @param borderColor <#borderColor description#>
 @return <#return value description#>
 */
+ (UITextField *)JXTConvenientControlTextField:(NSString *)placeholder
                                TextFieldFont:(UIFont *)textFieldfont
                                    TextColor:(UIColor *)textColor
                              BackgroundColor:(UIColor *)backgroundColor
                                  BorderColor:(UIColor *)borderColor;

/**
 富文本使用
 
 @param labelText <#labelText description#>
 @param labelColor <#labelColor description#>
 @param labelFont <#labelFont description#>
 @param labelRange <#labelRange description#>
 @return <#return value description#>
 */
+ (NSMutableAttributedString *)JXTLabelAttributedWithLabeText:(NSString *)labelText
                                                LabelColor:(UIColor *)labelColor
                                                 LabelFont:(UIFont *)labelFont
                                                LabelRange:(NSRange )labelRange;

@end

NS_ASSUME_NONNULL_END
