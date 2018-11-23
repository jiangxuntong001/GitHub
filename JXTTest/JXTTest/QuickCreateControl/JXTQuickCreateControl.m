//
//  QuickCreateControl.m
//  RailcomExchange
//
//  Created by 姜训彤 on 2018/9/28.
//  Copyright © 2018年 JXT. All rights reserved.
//

#import "JXTQuickCreateControl.h"

@implementation JXTQuickCreateControl

+ (UILabel *)JXTConvenientControlLabel:(NSString *)title
                                 Font:(UIFont *)font
                            TextColor:(UIColor *)textColor{
    UILabel *myLabel = [UILabel new];
    myLabel.font = font;
    myLabel.text = title;
    myLabel.textColor = textColor;
    myLabel.numberOfLines = 0;
    myLabel.textAlignment = NSTextAlignmentLeft;
    return myLabel;
}

+ (UILabel *)JXTConvenientControlLineLabel{
    UILabel *myLineLabel = [UILabel new];
    return myLineLabel;
}




+ (UIButton *)JXTConvenientControlButton:(NSString *)title
                                   Font:(UIFont *)font
                              TextColor:(UIColor *)textColor
                        BackgroundColor:(UIColor *)backgroundColor{
    UIButton *myButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [myButton setTitle:title forState:0];
    //    [myButton addTarget:self action:@selector(submintOnClick:) forControlEvents:UIControlEventTouchUpInside];
    [myButton setBackgroundColor:backgroundColor];
    myButton.layer.cornerRadius = 5.0;
    myButton.layer.masksToBounds = YES;
    myButton.titleLabel.font = font;
    [myButton setTitleColor:textColor forState:0];
    return myButton;
}

+ (UITextField *)JXTConvenientControlTextField:(NSString *)placeholder
                                TextFieldFont:(UIFont *)textFieldfont
                                    TextColor:(UIColor *)textColor
                              BackgroundColor:(UIColor *)backgroundColor
                                  BorderColor:(UIColor *)borderColor{
    UITextField *myTextField = [UITextField new];
    //当输入框没有内容时，水印提示 提示内容为password
    myTextField.placeholder = placeholder;
    // 只设置字体大小
    myTextField.font = textFieldfont;
    //设置字体颜色
    myTextField.textColor = textColor;
    
    myTextField.leftView = [[UIView alloc]initWithFrame:CGRectMake(10, 1, 7, 26)];
    
    myTextField.leftViewMode = UITextFieldViewModeAlways;
    
    
    [myTextField.layer setMasksToBounds:YES];
    [myTextField.layer setCornerRadius:3.0]; //设置矩形四个圆角半径
    //边框宽度
    [myTextField.layer setBorderWidth:0.5f];
    myTextField.layer.borderColor = borderColor.CGColor;
    return myTextField;
}







+ (NSMutableAttributedString *)JXTLabelAttributedWithLabeText:(NSString *)labelText
                                                LabelColor:(UIColor *)labelColor
                                                 LabelFont:(UIFont *)labelFont
                                                LabelRange:(NSRange )labelRange{
    NSMutableAttributedString *AttributedStr = [[NSMutableAttributedString alloc]initWithString:labelText];
    
    [AttributedStr addAttribute:NSFontAttributeName
                          value:labelFont
                          range:labelRange];
    [AttributedStr addAttribute:NSForegroundColorAttributeName
                          value:labelColor
                          range:labelRange];
    return AttributedStr;
}


@end
