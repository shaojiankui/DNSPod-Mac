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
#import "DynamicPopUpButtonCell.h"
#import "OprationCell.h"
#import "IP.h"
#import "iAlert.h"
#import "DataManager.h"
#import "LogWriter.h"
@interface RecordWindowController ()<NSMenuDelegate>
{
    NSMutableArray *_records;
    NSArray *_types;
    NSDictionary *_lines;

}
@end

@implementation RecordWindowController

- (void)windowDidLoad {
    [super windowDidLoad];
    
    // Implement this method to handle any initialization after your window controller's window has been loaded from its nib file.
    self.tableView.selectionHighlightStyle = NSTableViewSelectionHighlightStyleNone;
    [self.tableView setColumnAutoresizingStyle:NSTableViewUniformColumnAutoresizingStyle];

//    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(willPopUp:) name:NSPopUpButtonCellWillPopUpNotification object:nil];

    [self loadData];

}
- (void)loadData{
    [self loadRecordList];
    [self loadRecordTypes];
    [self loadRecordLines];
}
- (void)loadRecordTypes{
    [Record RecordType:@"all" success:^(NSURLResponse *response, id responseObject) {
        _types = [responseObject jk_arrayForKey:@"types"];
        [self.tableView reloadData];
    } failure:^(NSURLResponse *response, NSError *error) {
        
    }];
}
- (void)loadRecordLines{
    [Record RecordLine:[self.domainInfo jk_stringForKey:@"id"] domain:[self.domainInfo jk_stringForKey:@"name"] domain_grade:[self.domainInfo jk_stringForKey:@"grade"] success:^(NSURLResponse *response, id responseObject) {
        _lines = responseObject;
        [self.tableView reloadData];
    } failure:^(NSURLResponse *response, NSError *error) {
        
    }];
}
-(void)setDomainInfo:(NSDictionary *)domainInfo{
    _domainInfo = domainInfo;
    [self loadData];

}
- (void)loadRecordList{
    [Record RecordList:[self.domainInfo jk_stringForKey:@"id"] offset:0 length:@"1000" sub_domain:nil keyword:nil success:^(NSURLResponse *response, id responseObject) {
        _records = [[responseObject jk_arrayForKey:@"records"] mutableCopy];
        [self.tableView reloadData];
    } failure:^(NSURLResponse *response, NSError *error) {
        
    }];
}
-(NSInteger)numberOfRowsInTableView:(NSTableView *)tableView{
    return [_records count];
}
-(id)tableView:(NSTableView *)tableView objectValueForTableColumn:(NSTableColumn *)tableColumn row:(NSInteger)row{
    NSString *identifier = [tableColumn identifier];
 
    NSDictionary *recordDic = [_records jk_objectWithIndex:row];
    
    if([identifier isEqualToString:@"name"]){
        return [recordDic jk_stringForKey:@"name"];
    } else if([identifier isEqualToString:@"value"]){
        return [recordDic jk_stringForKey:@"value"];
    } else if([identifier isEqualToString:@"type"]){
        //设置新数据
        DynamicPopUpButtonCell *popCell = [tableColumn dataCellForRow:row];
        [popCell removeAllItems];
        for(int i=0;i< [_types count];i++){
            [popCell addItemWithTitle:[_types jk_objectWithIndex:i]?:@""];
        }
//        [popCell selectItemWithTitle:[recordDic jk_stringForKey:@"type"]];
       //NSPopUpButtonCell 要返回index
       return [NSNumber numberWithInteger:[popCell indexOfItemWithTitle:[recordDic jk_stringForKey:@"type"]]];
        
    }else if([identifier isEqualToString:@"route"]){
        DynamicPopUpButtonCell *popCell = [tableColumn dataCellForRow:row];
//        popCell.menu.delegate = self;
//        popCell.info  = recordDic;
//        popCell.tag = 999;
//        NSMenuItem *item = [popCell itemAtIndex:0];
//        item.title = [recordDic jk_stringForKey:@"line"];
//        //NSPopUpButtonCell 要返回index
//        return [NSNumber numberWithInteger:0];
        [popCell removeAllItems];
        for(int i=0;i< [[_lines jk_arrayForKey:@"lines"] count];i++){
            [popCell addItemWithTitle:[[_lines jk_arrayForKey:@"lines"] jk_objectWithIndex:i]?:@""];
        }
        return [NSNumber numberWithInteger:[popCell indexOfItemWithTitle:[recordDic jk_stringForKey:@"line"]]];
    }else if([identifier isEqualToString:@"ttl"]){
        return [recordDic jk_stringForKey:@"ttl"];
    }else if([identifier isEqualToString:@"delete"]){
        NSButtonCell *buttonCell = [tableColumn dataCellForRow:row];
        buttonCell.target = self;
        buttonCell.action = @selector(deleteButtonTouched:);
        return [recordDic jk_stringForKey:@""];
    }else if([identifier isEqualToString:@"disable"]){
        NSButtonCell *buttonCell = [tableColumn dataCellForRow:row];
        buttonCell.target = self;
        buttonCell.action = @selector(disableButtonTouched:);
        return [recordDic jk_stringForKey:@""];
    }else if([identifier isEqualToString:@"enable"]){
        NSButtonCell *buttonCell = [tableColumn dataCellForRow:row];
        buttonCell.target = self;
        buttonCell.action = @selector(enableButtonTouched:);
        return [recordDic jk_stringForKey:@""];
    }else if([identifier isEqualToString:@"save"]){
        NSButtonCell *buttonCell = [tableColumn dataCellForRow:row];
        buttonCell.target = self;
        buttonCell.action = @selector(saveButtonTouched:);
        return [recordDic jk_stringForKey:@"ttl"];
    }else if([identifier isEqualToString:@"ddns"]){
        NSButtonCell *buttonCell = [tableColumn dataCellForRow:row];
        buttonCell.target = self;
        buttonCell.action = @selector(ddnsButtonTouched:);
        
        
        NSDictionary *ddnss =  [DataManager ddnsList];
        if ([ddnss jk_hasKey:[recordDic jk_stringForKey:@"id"]]) {
            buttonCell.title = @"取消";
        }else{
            buttonCell.title = @"DDNS";
        }
        return [recordDic jk_stringForKey:@""];
    }
    
    return nil;
}
- (void)deleteButtonTouched:(NSTableView*)tableView{
//    NSButtonCell *button = [tableView selectedCell];
//    NSDictionary *recordDic = [_records jk_objectWithIndex:[tableView selectedRow]];
    
}
- (void)disableButtonTouched:(NSTableView*)tableView{
//    NSButtonCell *button = [tableView selectedCell];
//    NSDictionary *recordDic = [_records jk_objectWithIndex:[tableView selectedRow]];
    
}
- (void)enableButtonTouched:(NSTableView*)tableView{
//    NSButtonCell *button = [tableView selectedCell];
//    NSDictionary *recordDic = [_records jk_objectWithIndex:[tableView selectedRow]];
    
}
- (void)saveButtonTouched:(NSTableView*)tableView{
//    NSButtonCell *button = [tableView selectedCell];
//    NSDictionary *recordDic = [_records jk_objectWithIndex:[tableView selectedRow]];
    
}
//    NSEvent *event = [NSApp currentEvent];
//    NSPoint pointInTable = [tableView convertPoint:[event locationInWindow] fromView:nil];
//    NSUInteger row = [tableView rowAtPoint:pointInTable];
//    NSTableColumn *column = [[tableView tableColumns] objectAtIndex:[tableView columnAtPoint:pointInTable]];
//    NSLog(@"row:%d column:%@", row, [column description]);
- (void)ddnsButtonTouched:(NSTableView*)tableView{
//    如果1小时之内，提交了超过5次没有任何变动的记录修改请求，该记录会被系统锁定1小时，不允许再次修改，所以在开发和测试的过程中，请自行处理IP变动，仅在本地IP发生变动的情况下才调用本接口。
    NSDictionary *recordDic = [_records jk_objectWithIndex:[tableView selectedRow]];

    NSButtonCell *button = [tableView selectedCell];
    if ([button.title isEqualToString:@"取消"]) {
        NSMutableDictionary *ddnss =  [DataManager ddnsList]?:[NSMutableDictionary dictionary];
        [ddnss  removeObjectForKey:[recordDic jk_stringForKey:@"id"]];
        [DataManager saveDdnsList:ddnss];
        button.title = @"DDNS";
        return;
    }
    NSString *message = [NSString stringWithFormat:@"确定在子域名（%@）上启用DDNS?原有的记录将被覆盖！",[recordDic jk_stringForKey:@"name"]];
    
    iAlert *alert = [iAlert alertWithTitle:@"确定启动动态域名解析" message:message style:NSAlertStyleWarning];
    [alert addCommonButtonWithTitle:@"确定" handler:^(iAlertItem *item) {
        [IP whatismyip:^(NSURLResponse *response, id responseObject) {
            [Record RecordDdns:[self.domainInfo jk_stringForKey:@"id"] record_id:[recordDic jk_stringForKey:@"id"] sub_domain:[recordDic jk_stringForKey:@"name"] record_line:[recordDic jk_stringForKey:@"line"] record_line_id:[recordDic jk_stringForKey:@"line_id"] value:[responseObject jk_stringForKey:@"ip"] success:^(NSURLResponse *response, id responseObject) {
                button.title = @"取消";
            } failure:^(NSURLResponse *response, NSError *error) {
                
            }];
        } failure:^(NSURLResponse *response, NSError *error) {
            
        }];
    }];
   
    [alert addButtonWithTitle:@"取消"];
    [alert show];
}
+ (void)ddns{
    
    [IP whatismyip:^(NSURLResponse *response, id responseObject) {
        NSMutableDictionary *ddnsList =[DataManager ddnsList] ?: [NSMutableDictionary dictionary];
        [LogWriter writeLog:[NSString stringWithFormat:@"当前IP:%@",[responseObject jk_stringForKey:@"ip"]?:@""] type:@"get ip"];

        for (id domainID in [ddnsList allKeys]) {
            NSDictionary *recordDic = [ddnsList objectForKey:domainID];
            
            [Record RecordDdns:domainID record_id:[recordDic jk_stringForKey:@"record_id"] sub_domain:[recordDic jk_stringForKey:@"name"] record_line:[recordDic jk_stringForKey:@"line"] record_line_id:[recordDic jk_stringForKey:@"line_id"] value:[responseObject jk_stringForKey:@"ip"] success:^(NSURLResponse *response, id responseObject) {

            } failure:^(NSURLResponse *response, NSError *error) {
                
            }];
        }
    } failure:^(NSURLResponse *response, NSError *error) {
        
    }];
    
}
//- (void)willPopUp:(DynamicPopUpButtonCell*)cell{
//    if (cell.tag == 999) {
//
//      
//    }
//}
//- (void)menuWillOpen:(NSMenu *)menu{
//    for(int i=0;i<= [_types count];i++){
//        [menu addItemWithTitle:[_types jk_objectWithIndex:i]?:@"" action:nil keyEquivalent:@""];
//    }
//}
- (void)tableView:(NSTableView *)tableView setObjectValue:(nullable id)object forTableColumn:(nullable NSTableColumn *)tableColumn row:(NSInteger)row{
    NSMutableDictionary *recordDic = [[_records jk_objectWithIndex:row] mutableCopy];
    NSString *identifier = [tableColumn identifier];
//    id cell = [tableColumn dataCellForRow:row];
    
    if([identifier isEqualToString:@"name"]){
        [recordDic setObject:object forKey:@"name"];
    }
    else if([identifier isEqualToString:@"value"]){
        [recordDic setObject:object forKey:@"value"];
    }else if([identifier isEqualToString:@"type"]){
        NSPopUpButtonCell *popCell = [tableColumn dataCellForRow:row];
        NSMenuItem *menuItem = [popCell itemAtIndex:[object integerValue]];
        NSLog(@"%@", [menuItem title]); //DEBUG
        [recordDic setObject:[menuItem title] forKey:@"type"];
    }
    else if([identifier isEqualToString:@"route"]){
        NSPopUpButtonCell *popCell = [tableColumn dataCellForRow:row];
        NSMenuItem *menuItem = [popCell itemAtIndex:[object integerValue]];
        NSLog(@"%@", [menuItem title]); //DEBUG
        [recordDic setObject:[menuItem title] forKey:@"line"];
        [recordDic setObject:[[_lines jk_dictionaryForKey:@"line_ids"] jk_stringForKey:[menuItem title]] forKey:@"line_id"];

    }else if([identifier isEqualToString:@"ttl"]){
        [recordDic setObject:object forKey:@"ttl"];
    }
    [_records replaceObjectAtIndex:row withObject:recordDic];
    
}
//-(id)tableView:(NSTableView *)tableView objectValueForTableColumn:(NSTableColumn *)tableColumn row:(NSInteger)row{
//    NSString *identifier = [tableColumn identifier];
//    
//    NSDictionary *recordDic = [_records jk_objectWithIndex:row];
//    
//    if([identifier isEqualToString:@"name"]){
//        return [recordDic jk_stringForKey:@"name"];
//    } else if([identifier isEqualToString:@"value"]){
//        return [recordDic jk_stringForKey:@"value"];
//    } else if([identifier isEqualToString:@"type"]){
//        return [recordDic jk_stringForKey:@"type"];
//    }else if([identifier isEqualToString:@"route"]){
//        return [recordDic jk_stringForKey:@"line"];
//    }
//    return nil;
//}
//
//- (NSView *)tableView:(NSTableView *)tableView viewForTableColumn:(NSTableColumn *)tableColumn row:(NSInteger)row {
//    
//    NSString *identifier = [tableColumn identifier];
//    NSTableCellView *cellView = [tableView makeViewWithIdentifier:identifier owner:self];
//    
//    NSView *view = [cellView viewWithTag:666];
//    NSDictionary *recordDic = [_records jk_objectWithIndex:row];
//    
//    if([identifier isEqualToString:@"name"]){
//        NSTextField *text = (NSTextField*)view;
//        text.stringValue = [recordDic jk_stringForKey:@"name"];
//    } else if([identifier isEqualToString:@"value"]){
//        NSTextField *text = (NSTextField*)view;
//        text.stringValue = [recordDic jk_stringForKey:@"value"];
//    } else if([identifier isEqualToString:@"type"]){
//        NSButton *button = (NSButton*)view;
//        button.title = [recordDic jk_stringForKey:@"type"];
//    }else if([identifier isEqualToString:@"route"]){
//        NSButton *button = (NSButton*)view;
//        button.title = [recordDic jk_stringForKey:@"line"];
//    }
//    return cellView;
//}
@end
