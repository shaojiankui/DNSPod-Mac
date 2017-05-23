//
//  RecordWindowController.h
//  DNSPod
//
//  Created by www.skyfox.org on 2017/5/19.
//  Copyright © 2017年 Jakey. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface RecordWindowController : NSWindowController
@property (weak) IBOutlet NSTableView *tableView;
@property (strong,nonatomic) NSDictionary *domainInfo;
+ (void)ddns;
@end
