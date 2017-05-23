//
//  OprationCell.h
//  DNSPod
//
//  Created by www.skyfox.org on 2017/5/22.
//  Copyright © 2017年 Jakey. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface OprationCell : NSCell
@property(nonatomic,strong) NSArray *buttons;
@property(nonatomic,strong) NSButton *b;

- (id)copyWithZone:(NSZone *)zone;

@end
