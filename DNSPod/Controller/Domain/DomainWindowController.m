//
//  IndexWindowController.m
//  DNSPod
//
//  Created by www.skyfox.org on 2017/5/19.
//  Copyright © 2017年 Jakey. All rights reserved.
//

#import "DomainWindowController.h"
#import "NSArray+JKSafeAccess.h"
#import "Domain.h"
#import "NSDictionary+JKSafeAccess.h"
#import "MonitorWindowController.h"
#import "AppDelegate.h"
@interface DomainWindowController ()
{
    NSArray *_domains;
}
@end

@implementation DomainWindowController

- (void)windowDidLoad {
    [super windowDidLoad];
    
    // Implement this method to handle any initialization after your window controller's window has been loaded from its nib file.
    
    //当拖拽窗口大小，NSOutlineView frame自动更改时，Column宽等比增减
    [self.tableView setColumnAutoresizingStyle:NSTableViewUniformColumnAutoresizingStyle];
    //最后一行自动宽等比增减
    //    [self.treeView sizeLastColumnToFit];
    //app第一次运行Column 自动宽等比增减，否则会有滚动条
    [self.tableView sizeToFit];
    
    [self loadDomainList];
    
}
- (void)loadDomainList{
    [Domain DomainList:@"all" offset:0 length:@"1000" group_id:nil keyword:nil success:^(NSURLResponse *response, id responseObject) {
        _domains = [responseObject jk_arrayForKey:@"domains"];
        [self.tableView reloadData];
    } failure:^(NSURLResponse *response, NSError *error) {
        [self.tableView reloadData];
    }];
}
-(NSInteger)numberOfRowsInTableView:(NSTableView *)tableView{
    return [_domains count];
}
-(id)tableView:(NSTableView *)tableView objectValueForTableColumn:(NSTableColumn *)tableColumn row:(NSInteger)row{
    NSString *v = [_domains jk_objectWithIndex:row];
    return v;
}

- (NSView *)tableView:(NSTableView *)tableView viewForTableColumn:(NSTableColumn *)tableColumn row:(NSInteger)row {
    
    NSString *identifier = [tableColumn identifier];
    NSTableCellView *cellView = [tableView makeViewWithIdentifier:identifier owner:self];
    
    NSView *view = [cellView viewWithTag:666];
    NSDictionary *domainDic = [_domains jk_objectWithIndex:row];
    
    if([identifier isEqualToString:@"domain"]){
        NSTextField *text = (NSTextField*)view;
        text.stringValue = [domainDic jk_stringForKey:@"name"];
    } else if([identifier isEqualToString:@"ddns"]){
        NSButton *button = (NSButton*)view;
        button.target = self;
        button.action = @selector(ddnsTouched:);
        button.tag = row;
    } else if([identifier isEqualToString:@"monitor"]){
        NSButton *button = (NSButton*)view;
        button.target = self;
        button.action = @selector(monitorTouched:);
        button.tag = row;
    }
    return cellView;
}

- (void)tableViewSelectionDidChange:(NSNotification *)notification{
    NSInteger row = [self.tableView selectedRow];
    if (row == -1) {
        return;
    }
    
}
- (void)ddnsTouched:(NSButton*)sender{
    NSDictionary *domainDic = [_domains jk_objectWithIndex:sender.tag];
   [[AppDelegate APP]showRecordPanel:domainDic];
//   [self.window orderOut:nil];
    
}
- (void)monitorTouched:(NSButton*)sender{
    
}
- (IBAction)reloadTOuched:(id)sender {
    [self loadDomainList];
}
@end
