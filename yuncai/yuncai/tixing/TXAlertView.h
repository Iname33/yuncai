//
//  TXAlertView.h
//  芸才
//
//  Created by 伍承标 on 2017/10/15.
//  Copyright © 2017年 伍承标. All rights reserved.
//

#import <UIKit/UIKit.h>

@class TXAlertView;

@protocol TXAlertViewDelegate <NSObject>

- (void)alertView:(TXAlertView *)alertView didClickTitle:(NSString *)title;

@end
@interface TXAlertView : UIView
@property(nonatomic,assign)id<TXAlertViewDelegate>delegate;

- (instancetype)initWithHeadImg:(UIImage *)headImg Msg:(NSString *)msg CancelBtnTitle:(NSString *)cancelBtnTtile OKBtnTitle:(NSString *)okBtnTitle;
-(void)show;
@end
