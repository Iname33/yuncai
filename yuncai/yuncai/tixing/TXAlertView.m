//
//  TXAlertView.m
//  芸才
//
//  Created by 伍承标 on 2017/10/15.
//  Copyright © 2017年 伍承标. All rights reserved.
//

#import "TXAlertView.h"
#define CANCELCOLOR [UIColor colorWithRed:35/255.f green:135/255.f blue:255/255.f alpha:1]
#define OKCOLOR [UIColor colorWithRed:108/255.f green:217/255.f blue:105/255.f alpha:1]
@interface TXAlertView ()

@property (nonatomic, strong)UIImage        *headImg;
@property (nonatomic, retain)NSString       *msg;
@property (nonatomic, retain)NSString       *cancelBtnTitle;
@property (nonatomic, retain)NSString       *okBtnTitle;

@property (nonatomic, strong)UIImageView    *lblHeadImg;
@property (nonatomic, strong)UILabel        *lblMsg;
@property (nonatomic, strong)UIButton       *btnCancel;
@property (nonatomic, strong)UIButton       *btnOK;


@property (strong, nonatomic) UIView        *backgroundView;

@end

@implementation TXAlertView

-(instancetype)initWithHeadImg:(UIImage *)headImg Msg:(NSString *)msg CancelBtnTitle:(NSString *)cancelBtnTtile OKBtnTitle:(NSString *)okBtnTitle{
    if (self==[super init]) {
        _headImg=headImg;
        _msg=msg;
        _cancelBtnTitle=cancelBtnTtile;
        _okBtnTitle=okBtnTitle;
        
        self.backgroundColor=[UIColor whiteColor];
        
        _lblHeadImg=[[UIImageView alloc]init];
        _lblHeadImg.image=headImg;
        _lblHeadImg.contentMode = UIViewContentModeScaleAspectFit;
        [self addSubview:_lblHeadImg];
        
        _lblMsg = [[UILabel alloc]init];
        _lblMsg.textColor = [UIColor grayColor];
        _lblMsg.textAlignment = NSTextAlignmentCenter;
        _lblMsg.font = [UIFont systemFontOfSize:13];
        _lblMsg.text = _msg;
        _lblMsg.numberOfLines = 0;
        [self addSubview:_lblMsg];
        
        _btnCancel = [[UIButton alloc]init];
        UIImage*rightImage=[UIImage imageNamed:@"弹框关闭@2x"];
        [_btnCancel setBackgroundImage:rightImage forState:(UIControlStateNormal)];        [_btnCancel addTarget:self action:@selector(clickBtn:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:_btnCancel];
        
        _btnOK = [[UIButton alloc]init];
        _btnOK.backgroundColor = OKCOLOR;
        [_btnOK setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_btnOK setTitle:_okBtnTitle forState:UIControlStateNormal];
        [_btnOK addTarget:self action:@selector(clickBtn:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:_btnOK];
        
        [self.backgroundView addSubview:self];
    }
    return self;
}
- (UIView *)backgroundView
{
    if (_backgroundView == nil)
    {
       _backgroundView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height)];
        _backgroundView.backgroundColor=[UIColor colorWithWhite:0 alpha:0];
        _backgroundView.layer.masksToBounds=YES;
    }
    
    return _backgroundView;
}
- (void)layoutSubviews{
    CGFloat alertViewWidth = 290;
    CGFloat alertHeight = 238;
    
    CGRect headimgRect = CGRectZero;
    CGRect msgRect = CGRectZero;
    CGRect cancelRect = CGRectZero;
    CGRect okRect = CGRectZero;
    
    if (_headImg!=nil) {
        headimgRect = CGRectMake(128, 24.5, 35, 32);
    }
    msgRect = CGRectMake(0, CGRectGetMaxY(headimgRect)+15, alertViewWidth, 40);
    
    cancelRect = CGRectMake(273, 6, 11, 11);
 
    okRect = CGRectMake(40, CGRectGetMaxY(msgRect) + 15, alertViewWidth - (40 * 2), 36);
    
    _lblHeadImg.frame=headimgRect;
    _lblMsg.frame=msgRect;
    _btnCancel.frame=cancelRect;
    
    self.frame=CGRectMake((_backgroundView.frame.size.width-alertViewWidth)/2, 220, alertViewWidth, alertHeight);
    self.layer.cornerRadius=5;
    
}
- (void)clickBtn:(UIButton *)sender
{
    NSLog(@"XFAlertView: click %@", [sender titleForState:UIControlStateNormal]);
    
    if (self.delegate != nil && [self.delegate respondsToSelector:@selector(alertView:didClickTitle:)])
    {
        [self.delegate alertView:self didClickTitle:[sender titleForState:UIControlStateNormal]];
    }
    
    [UIView animateWithDuration:0.1 animations:^{
        
        _backgroundView.backgroundColor = [UIColor colorWithWhite:0 alpha:0];
        
    } completion:^(BOOL finished) {
        
        [self.backgroundView removeFromSuperview];
    }];
}


-(void)show{
    [[UIApplication sharedApplication].delegate.window addSubview:self.backgroundView];
    [UIView animateWithDuration:0.1 animations:^{
        
        _backgroundView.backgroundColor = [UIColor colorWithWhite:0 alpha:0.5];
        
    } completion:nil];
}

@end
