//
//  UserViewController.h
//  DNSPod
//
//  Created by skyfox on 2017/5/16.
//  Copyright © 2017年 Jakey. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface UserViewController : NSViewController

@property (strong) IBOutlet NSView *loginView;
@property (weak) IBOutlet NSTextField *emailTextField;
@property (weak) IBOutlet NSTextField *passwordTextField;
@property (weak) IBOutlet NSButton *autoLoginButton;
- (IBAction)loginTouched:(id)sender;
- (IBAction)autoLoginTouched:(id)sender;

@property (weak) IBOutlet NSView *infoView;
//账户余额
@property (weak) IBOutlet NSTextField *idTextField;
@property (weak) IBOutlet NSTextField *balanceTextField;
@property (weak) IBOutlet NSTextField *accountTextField;
@property (weak) IBOutlet NSTextField *smsbalacneTextField;
@property (weak) IBOutlet NSTextField *accountTypeTextField;
@property (weak) IBOutlet NSTextField *mobileTextField;
@property (weak) IBOutlet NSTextField *weixinTextField;
@property (weak) IBOutlet NSTextField *usergradeTextField;
@property (weak) IBOutlet NSTextField *qqTextField;
- (IBAction)logoutTouched:(id)sender;

@end
