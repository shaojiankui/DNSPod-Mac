//
//  AppDelegate.h
//  DNSPod
//
//  Created by skyfox on 2017/5/16.
//  Copyright © 2017年 Jakey. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface AppDelegate : NSObject <NSApplicationDelegate>
+(AppDelegate*)APP;
@property (nonatomic, strong) NSDictionary *user;
@property (nonatomic, strong) NSMenu *mainMenu;
@property (nonatomic, strong) NSStatusItem *statusItem;
@property (nonatomic, strong) NSPopover *popover;
@end

