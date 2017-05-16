//
//  UserViewController.m
//  DNSPod
//
//  Created by skyfox on 2017/5/16.
//  Copyright © 2017年 Jakey. All rights reserved.
//

#import "UserViewController.h"
#import "User.h"
#import "NSDictionary+JKSafeAccess.h"
#import "AppDelegate.h"
@interface UserViewController ()

@end

@implementation UserViewController

- (void)viewDidLoad {
    [self.view addSubview:self.loginView];
    
    [super viewDidLoad];
    // Do view setup here.
    [self updateViewWithLoginStatus];

}
- (void)updateViewWithLoginStatus{
    BOOL isLogin = NO;
    
    if ([AppDelegate APP].user) {
        isLogin = YES;
    }
    self.loginView.hidden = isLogin;
    self.infoView.hidden = !isLogin;
    self.emailTextField.stringValue = [[NSUserDefaults standardUserDefaults] stringForKey:@"email"]?:@"";

    self.balanceTextField.stringValue = [[AppDelegate APP].user jk_stringForKey:@"balance"]?:@"";
    self.accountTextField.stringValue = [[AppDelegate APP].user jk_stringForKey:@"email"]?:@"";
    self.smsbalacneTextField.stringValue = [[AppDelegate APP].user jk_stringForKey:@"smsbalance"]?:@"";
    self.accountTypeTextField.stringValue = [[AppDelegate APP].user jk_stringForKey:@"user_type"]?:@"";
    self.mobileTextField.stringValue = [[AppDelegate APP].user jk_stringForKey:@"balance"]?:@"";
    self.weixinTextField.stringValue = [[AppDelegate APP].user jk_stringForKey:@"weixin_binded"]?:@"";
    self.usergradeTextField.stringValue = [[AppDelegate APP].user jk_stringForKey:@"user_grade"]?:@"";
    self.qqTextField.stringValue = [[AppDelegate APP].user jk_stringForKey:@"qq"]?:@"";
    self.idTextField.stringValue = [[AppDelegate APP].user jk_stringForKey:@"id"]?:@"";
    
    NSString *launchFolder = [NSString stringWithFormat:@"%@/Library/LaunchAgents",NSHomeDirectory()];
    NSString *boundleID = [[NSBundle mainBundle] objectForInfoDictionaryKey:(NSString *)kCFBundleIdentifierKey];
    NSString *dstLaunchPath = [launchFolder stringByAppendingFormat:@"/%@.plist",boundleID];
    NSFileManager *fm = [NSFileManager defaultManager];
    BOOL isDir = NO;
    if ([fm fileExistsAtPath:dstLaunchPath isDirectory:&isDir] && !isDir) {
        self.autoLoginButton.state = NSOnState;
    }

}
- (IBAction)loginTouched:(id)sender {
    [User UserDetail:self.emailTextField.stringValue login_password:self.passwordTextField.stringValue success:^(NSURLResponse *response, id responseObject) {
        if ([[responseObject jk_dictionaryForKey:@"status"] jk_integerForKey:@"code"] ==1) {
            
            NSDictionary *info = [[responseObject jk_dictionaryForKey:@"info"] jk_dictionaryForKey:@"user"];
            [AppDelegate APP].user = info;
            
            [[NSUserDefaults standardUserDefaults] setObject:self.emailTextField.stringValue?:@"" forKey:@"email"];
            [[NSUserDefaults standardUserDefaults] setObject:self.passwordTextField.stringValue?:@"" forKey:self.emailTextField.stringValue?:@""];
            [[NSUserDefaults standardUserDefaults] synchronize];
            [self updateViewWithLoginStatus];
            
         
        }else{
            [[NSUserDefaults standardUserDefaults] removeObjectForKey:self.emailTextField.stringValue?:@""];
            [[NSUserDefaults standardUserDefaults] synchronize];
        }
        
    } failure:^(NSURLResponse *response, NSError *error) {
        [[NSUserDefaults standardUserDefaults] removeObjectForKey:self.emailTextField.stringValue?:@""];
        [[NSUserDefaults standardUserDefaults] synchronize];
    }];
}

- (IBAction)logoutTouched:(id)sender {
    [AppDelegate APP].user = nil;
    [[NSUserDefaults standardUserDefaults] removeObjectForKey:self.accountTextField.stringValue];
    [[NSUserDefaults standardUserDefaults] synchronize];
    [self updateViewWithLoginStatus];
}
- (IBAction)autoLoginTouched:(id)sender {
    NSLog(@"Switch (%@) is %@", sender, (self.autoLoginButton.state ==1) ? @"checked" : @"unchecked");
    if(self.autoLoginButton.state ==1)
    {
        [self installDaemon];
    }
    else
    {
        [self unInstallDaemon];
    }
}
-(void)installDaemon{
    NSString *launchFolder = [NSString stringWithFormat:@"%@/Library/LaunchAgents",NSHomeDirectory()];
    NSString *boundleID = [[NSBundle mainBundle] objectForInfoDictionaryKey:(NSString *)kCFBundleIdentifierKey];
    NSString *dstLaunchPath = [launchFolder stringByAppendingFormat:@"/%@.plist",boundleID];
    NSFileManager *fm = [NSFileManager defaultManager];
    BOOL isDir = NO;
    //已经存在启动项中，就不必再创建
    if ([fm fileExistsAtPath:dstLaunchPath isDirectory:&isDir] && !isDir) {
        return;
    }
    //下面是一些配置
    NSMutableDictionary* dict = [[NSMutableDictionary alloc] init];
    NSMutableArray* arr = [[NSMutableArray alloc] init];
    [arr addObject:[[NSBundle mainBundle] executablePath]];
    [arr addObject:@"-runMode"];
    [arr addObject:@"autoLaunched"];
    [dict setObject:[NSNumber numberWithBool:true] forKey:@"RunAtLoad"];
    [dict setObject:boundleID forKey:@"Label"];
    [dict setObject:arr forKey:@"ProgramArguments"];
    isDir = NO;
    if (![fm fileExistsAtPath:launchFolder isDirectory:&isDir] && isDir) {
        [fm createDirectoryAtPath:launchFolder withIntermediateDirectories:NO attributes:nil error:nil];
    }
    [dict writeToFile:dstLaunchPath atomically:NO];
    
}
-(void)unInstallDaemon{
    NSString* launchFolder = [NSString stringWithFormat:@"%@/Library/LaunchAgents",NSHomeDirectory()];
    BOOL isDir = NO;
    NSFileManager* fm = [NSFileManager defaultManager];
    if (![fm fileExistsAtPath:launchFolder isDirectory:&isDir] && isDir) {
        return;
    }
    NSString * boundleID = [[NSBundle mainBundle] objectForInfoDictionaryKey:(NSString *)kCFBundleIdentifierKey];
    NSString* srcLaunchPath = [launchFolder stringByAppendingFormat:@"/%@.plist",boundleID];
    [fm removeItemAtPath:srcLaunchPath error:nil];
}
@end
