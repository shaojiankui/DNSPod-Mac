//
//  OprationCell.m
//  DNSPod
//
//  Created by www.skyfox.org on 2017/5/22.
//  Copyright © 2017年 Jakey. All rights reserved.
//

#import "OprationCell.h"

@implementation OprationCell
- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self)
    {
        
    }
    return self;
}

- (void)drawInteriorWithFrame:(NSRect)cellFrame inView:(NSView *)controlView
{
//    //选中高亮色这种只能改变某个Cell的背景色不能整行改变
//    if ([self isHighlighted]) {
//        [self highlightColorWithFrame:cellFrame inView:controlView];
//    }
    
//    NSColor* primaryColor   = [self isHighlighted] ? [NSColor alternateSelectedControlTextColor] : [NSColor textColor];
//    
//    NSDictionary* primaryTextAttributes = [NSDictionary dictionaryWithObjectsAndKeys: primaryColor, NSForegroundColorAttributeName,[NSFont systemFontOfSize:13], NSFontAttributeName, nil];
//    NSMutableAttributedString *string = [[NSMutableAttributedString alloc]initWithString:@"hello world" attributes:primaryTextAttributes];
//    [string setAttributes:@{NSForegroundColorAttributeName:[NSColor redColor]} range:NSMakeRange(0, 5)];
//    //[string drawAtPoint:NSMakePoint(cellFrame.origin.x+cellFrame.size.height+10, cellFrame.origin.y+20)];
//    //用下面这个可以使用省略属性
//    
//    NSMutableParagraphStyle *ps = [[NSParagraphStyle defaultParagraphStyle] mutableCopy];
//    [ps setLineBreakMode:NSLineBreakByTruncatingTail];
//    NSRange range = NSMakeRange(0, [string length]);
//    [string addAttribute:NSParagraphStyleAttributeName value:ps range:range];
//
//    [string drawInRect:NSMakeRect(cellFrame.origin.x+cellFrame.size.height+15, cellFrame.origin.y+10,40,15)];
//    
//    NSImage *icon = [NSImage imageNamed:@"1"];
//    
//    //icon = [self roundCorners:icon];圆形
//    
//    //这句很重要，如果没有Y轴的移偏，看到的只有第一行有头像
//    float yOffset = cellFrame.origin.y;
//    
//    [icon drawInRect:NSMakeRect(cellFrame.origin.x+5,yOffset + 3,cellFrame.size.height-6, cellFrame.size.height-6)
//            fromRect:NSMakeRect(0,0,[icon size].width, [icon size].height)
//           operation:NSCompositeSourceOver
//            fraction:1.0 respectFlipped:YES hints:nil];
    
//
//    for (int i=0; i<[_buttons count]; i++) {
//        NSButton *button;
////        if ([controlView viewWithTag:2000+i]){
////            button = [controlView viewWithTag:2000+i];
////        }else{
//            button = [_buttons objectAtIndex:i];
//            button.tag = 2000+i;
////        }
//        button.frame = CGRectMake(cellFrame.origin.x + i*(cellFrame.size.width/[_buttons count]), 0, cellFrame.size.width/[_buttons count], cellFrame.size.height);
//        
//        [controlView addSubview:[_buttons objectAtIndex:i]];
//
//    }
    
       // my custom NSButtonCell
//    NSButtonCell *warningCell = [[NSButtonCell alloc] init];
//    [warningCell setTarget:self];
//    [warningCell setAction:@selector(testButton:)];
//    [warningCell drawWithFrame:cellFrame inView:controlView];
    
}

-(void)setButtons:(NSArray *)buttons{
    _buttons = buttons;
    [self drawingRectForBounds:self.controlView.bounds];
}
- (id)copyWithZone:(NSZone *)zone
{
    OprationCell* cell = (OprationCell*)[super copyWithZone:zone];
    return cell;
}
@end
