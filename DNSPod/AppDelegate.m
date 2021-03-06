//
//  AppDelegate.m
//  DNSPod
//
//  Created by skyfox on 2017/5/16.
//  Copyright © 2017年 Jakey. All rights reserved.
//

#import "AppDelegate.h"
#import "UserViewController.h"
#import "User.h"
#import "DateManager.h"
#import "LogWriter.h"
@interface AppDelegate ()<NSMenuDelegate>

@property (weak) IBOutlet NSWindow *window;                      
@end

@implementation AppDelegate
+(AppDelegate*)APP{
    return (AppDelegate*)[[NSApplication sharedApplication] delegate];
}
- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    // Insert code here to initialize your application
//    self.statusItem.menu = self.mainMenu;
    self.statusItem.target = self;
    self.statusItem.button.action = @selector(showPopover:);
  
    self.userViewController = [[UserViewController alloc]initWithNibName:@"UserViewController" bundle:nil];
    self.popover.contentViewController = self.userViewController;
    
    __weak typeof (self) weakSelf = self;
    [NSEvent addGlobalMonitorForEventsMatchingMask:NSEventMaskLeftMouseDown handler:^(NSEvent * event) {
        if (weakSelf.popover.isShown) {
            [weakSelf.popover close];
        }
    }];
    
//    [[NSUserDefaults standardUserDefaults] removeObjectForKey:@"ddnsList"];
    [self autoLogin];
    [self performSelector:@selector(ddns) withObject:nil afterDelay:60.0];
}

- (void)autoLogin{
    NSString *email = [[NSUserDefaults standardUserDefaults] stringForKey:@"email"];
    NSString *password = [[NSUserDefaults standardUserDefaults] stringForKey:email?:@""];
    
    if(email && password){
        [User UserDetail:email login_password:password success:^(NSURLResponse *response, id responseObject) {
            if ([[responseObject jk_dictionaryForKey:@"status"] jk_integerForKey:@"code"] ==1) {
                NSDictionary *info = [[responseObject jk_dictionaryForKey:@"info"] jk_dictionaryForKey:@"user"];
                [AppDelegate APP].user = info;
                
            }else{
                [[NSUserDefaults standardUserDefaults] removeObjectForKey:@"email"];
                [[NSUserDefaults standardUserDefaults] synchronize];
            }
            
        } failure:^(NSURLResponse *response, NSError *error) {
            [[NSUserDefaults standardUserDefaults] removeObjectForKey:@"email"];
            [[NSUserDefaults standardUserDefaults] synchronize];
        }];
    }
}
- (void)ddns{
    [LogWriter writeLog:@"试图DDNS更新" type:@"try update"];
    NSLog(@"试图DDNS更新");
    [self performSelector:@selector(ddns) withObject:nil afterDelay:60.0];
    [RecordWindowController ddns];
    self.userViewController.lastDate.stringValue = [DateManager stringConvert_YMDHMS_FromDate:[NSDate date]];
  
}
- (void)applicationWillTerminate:(NSNotification *)aNotification {
    // Insert code here to tear down your application
}
- (void)showPopover:(NSStatusBarButton *)button{
    [self.popover showRelativeToRect:button.bounds ofView:button preferredEdge:NSRectEdgeMaxY];
}
- (void)showDomainPanel
{
    [NSApp activateIgnoringOtherApps:YES];
//    _domainWindowController = [[DomainWindowController alloc] initWithWindowNibName:@"DomainWindowController"];
    [self.domainWindowController.window center];
    [self.domainWindowController.window orderFront:nil];
//    [self.domainWindowController showWindow:self];
}
- (void)showRecordPanel:(id)item{
    [NSApp activateIgnoringOtherApps:YES];
    self.recordWindowController.domainInfo = item;
    [self.recordWindowController.window center];
    [self.recordWindowController.window orderFront:nil];
}
- (void)exitItemTouched:(NSMenuItem *)item
{
    [NSApp terminate:self];
}
- (NSWindowController *)recordWindowController{
    if (!_recordWindowController) {
        _recordWindowController = [[RecordWindowController alloc] initWithWindowNibName:@"RecordWindowController"];
        [_recordWindowController.window orderFrontRegardless];
    }
    return  _recordWindowController;
}

- (NSWindowController *)domainWindowController{
    if (!_domainWindowController) {
        _domainWindowController = [[DomainWindowController alloc] initWithWindowNibName:@"DomainWindowController"];
//        [_domainWindowController.window orderFrontRegardless];
    }
    return  _domainWindowController;
}
-(NSPopover *)popover{
    if(!_popover){
        _popover = [[NSPopover alloc]init];
        _popover.behavior = NSPopoverBehaviorTransient;
    }
    return _popover;
}
-(NSStatusItem *)statusItem{
    if (!_statusItem) {
        _statusItem = [[NSStatusBar systemStatusBar] statusItemWithLength:NSVariableStatusItemLength];
        [_statusItem setImage:[NSImage imageNamed:@"statusbar"]];
        [_statusItem setHighlightMode:YES];
    }
    return _statusItem;
}
- (NSMenu *)mainMenu{
    if (!_mainMenu) {
        _mainMenu = [[NSMenu alloc] initWithTitle:@"xxxx"];
        _mainMenu.delegate = self;
    }
    return _mainMenu;
}

@end
