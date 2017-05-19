//
//  AppDelegate.h
//  DNSPod
//
//  Created by skyfox on 2017/5/16.
//  Copyright © 2017年 Jakey. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "DomainWindowController.h"
#import "RecordWindowController.h"
@interface AppDelegate : NSObject <NSApplicationDelegate>
+(AppDelegate*)APP;
@property (nonatomic, strong) DomainWindowController *domainWindowController;
@property (nonatomic, strong) RecordWindowController *recordWindowController;

@property (nonatomic, strong) NSDictionary *user;
@property (nonatomic, strong) NSMenu *mainMenu;
@property (nonatomic, strong) NSStatusItem *statusItem;
@property (nonatomic, strong) NSPopover *popover;


- (void)showDomainPanel;
- (void)showRecordPanel:(id)item;
@end

