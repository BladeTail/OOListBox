//
//  OOListBox.m
//
//  Created by Old one on 5/13/16.
//  Copyright © 2016 Oldone. All rights reserved.
//

#import "OOListBox.h"

@interface OOListBox()
{
    BOOL isPopDown;
    NSInteger selectedIndex;
    NSString  *selectedString;
}

@property (nonatomic,strong) UIButton *bt_default;
@property (nonatomic,assign) CGRect    originalFrame;

@end

@implementation OOListBox

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

#pragma mark Initialization
- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) [self commonInit];
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)coder {
    self = [super initWithCoder:coder];
    if (self) [self commonInit];
    return self;
}

-(void)layoutSubviews
{
    [super layoutSubviews];
}

-(void)commonInit
{
    self.color = [UIColor cyanColor];
    isPopDown = NO;
    [self.layer setMasksToBounds:YES];
    [self.layer setCornerRadius:8.0f];
    selectedIndex = -1;
    selectedString = @"";
    self.bt_default = [[UIButton alloc] initWithFrame:self.bounds];
    self.bt_default.titleLabel.textAlignment = NSTextAlignmentCenter;
    self.originalFrame = self.frame;
}

-(void)startSelect
{
    if (isPopDown) {
        isPopDown = NO;
        [self popUp];
        return;
    }
    [UIView beginAnimations:@"POP_DOWN" context:nil];
    [UIView setAnimationDuration:0.3];
    self.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y, self.frame.size.width, self.frame.size.height * (1 + self.selectStrings.count) + self.selectStrings.count);
    [UIView commitAnimations];
    isPopDown = YES;
}

-(void)popUp
{
    isPopDown = NO;
    [UIView beginAnimations:@"POP_UP" context:nil];
    [UIView setAnimationDuration:0.1];
    self.frame = self.originalFrame;
    [UIView commitAnimations];
}

-(void)selectedOneItem:(id)sender
{
    UIButton *item = (UIButton *)sender;
    [self.bt_default setTitle:self.selectStrings[item.tag] forState:UIControlStateNormal];
    selectedIndex = item.tag;
    selectedString = self.selectStrings[item.tag];
    [self popUp];
}

-(void)setColor:(UIColor *)color
{
    self.backgroundColor = color;
}

-(UIColor *)color
{
    return self.backgroundColor;
}

-(void)setDefaultFirstSelection:(NSString *)defaultFirstSelection
{
    _defaultFirstSelection = defaultFirstSelection;
    if (_defaultFirstSelection == nil) {
        [self.bt_default setTitle:self.defaultFirstSelection forState:UIControlStateNormal];
    }
}

-(void)setSelectStrings:(NSMutableArray *)selectStrings
{
    _selectStrings = selectStrings;
    if (_selectStrings == nil
        || _selectStrings.count == 0
        || ![_selectStrings[0] isKindOfClass:[NSString class]]) {
        NSLog(@"The 'selectStrings' contains nothing.");
    }
    if (self.defaultFirstSelection == nil && self.selectStrings.count > 0)
    {
        [self.bt_default setTitle:self.selectStrings[0] forState:UIControlStateNormal];
    }
    else if(self.defaultFirstSelection != nil)
    {
        [self.bt_default setTitle:self.defaultFirstSelection forState:UIControlStateNormal];
    }
    else
    {
        [self.bt_default setTitle:@"" forState:UIControlStateNormal];
    }
    [self.bt_default addTarget:self action:@selector(startSelect) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:_bt_default];
    UIButton *lastBT = self.bt_default;
    for (int i = 0; i < self.selectStrings.count; i++)
    {
        UIButton *item = [[UIButton alloc] initWithFrame:CGRectMake(lastBT.frame.origin.x, lastBT.frame.origin.y + lastBT.frame.size.height + 1.0f, lastBT.frame.size.width, lastBT.frame.size.height)];
        [item setTitle:self.selectStrings[i] forState:UIControlStateNormal];
        item.tag = i;
        item.titleLabel.textAlignment = NSTextAlignmentCenter;
        [item addTarget:self action:@selector(selectedOneItem:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:item];
        lastBT = item;
    }
}

-(NSInteger)selectedItemIndex
{
    return selectedIndex;
}

-(NSString *)selectedItemString
{
    return selectedString;
}

@end
