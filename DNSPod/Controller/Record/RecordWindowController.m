//
//  RecordWindowController.m
//  DNSPod
//
//  Created by www.skyfox.org on 2017/5/19.
//  Copyright © 2017年 Jakey. All rights reserved.
//

#import "RecordWindowController.h"
#import "NSArray+JKSafeAccess.h"
#import "NSDictionary+JKSafeAccess.h"
#import "Record.h"
@interface RecordWindowController ()
{
    NSArray *_records;
}
@end

@implementation RecordWindowController

- (void)windowDidLoad {
    [super windowDidLoad];
    
    // Implement this method to handle any initialization after your window controller's window has been loaded from its nib file.
    self.tableView.selectionHighlightStyle = NSTableViewSelectionHighlightStyleNone;
    
    [self loadRecordList];
}
-(void)setDomainInfo:(NSDictionary *)domainInfo{
    _domainInfo = domainInfo;
    [self loadRecordList];

}
- (void)loadRecordList{
    [Record RecordList:[self.domainInfo jk_stringForKey:@"id"] offset:0 length:@"1000" sub_domain:nil keyword:nil success:^(NSURLResponse *response, id responseObject) {
        _records = [responseObject jk_arrayForKey:@"records"];
        [self.tableView reloadData];
    } failure:^(NSURLResponse *response, NSError *error) {
        
    }];
}
-(NSInteger)numberOfRowsInTableView:(NSTableView *)tableView{
    return [_records count];
}
-(id)tableView:(NSTableView *)tableView objectValueForTableColumn:(NSTableColumn *)tableColumn row:(NSInteger)row{
    NSString *v = [_records jk_objectWithIndex:row];
    return v;
}

- (NSView *)tableView:(NSTableView *)tableView viewForTableColumn:(NSTableColumn *)tableColumn row:(NSInteger)row {
    
    NSString *identifier = [tableColumn identifier];
    NSTableCellView *cellView = [tableView makeViewWithIdentifier:identifier owner:self];
    
    NSView *view = [cellView viewWithTag:666];
    NSDictionary *domainDic = [_records jk_objectWithIndex:row];
    
    if([identifier isEqualToString:@"name"]){
        NSTextField *text = (NSTextField*)view;
        text.stringValue = [domainDic jk_stringForKey:@"name"];
    } else if([identifier isEqualToString:@"value"]){
        NSTextField *text = (NSTextField*)view;
        text.stringValue = [domainDic jk_stringForKey:@"value"];
    } else if([identifier isEqualToString:@"type"]){
        NSButton *button = (NSButton*)view;
        button.title = [domainDic jk_stringForKey:@"type"];
    }else if([identifier isEqualToString:@"route"]){
        NSButton *button = (NSButton*)view;
        button.title = [domainDic jk_stringForKey:@"line"];
    }
    return cellView;
}
@end
