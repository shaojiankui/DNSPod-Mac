//
//  IndexWindowController.h
//  DNSPod
//
//  Created by www.skyfox.org on 2017/5/19.
//  Copyright © 2017年 Jakey. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface DomainWindowController : NSWindowController

@property (weak) IBOutlet NSTableView *tableView;
- (IBAction)reloadTOuched:(id)sender;
@end
