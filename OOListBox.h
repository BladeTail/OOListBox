//
//  OOListBox.h
//
//  Created by Old one on 5/13/16.
//  Copyright © 2016 Oldone. All rights reserved.
//

#import <UIKit/UIKit.h>
// Tell the compiler to assume that no method should have a NULL value
NS_ASSUME_NONNULL_BEGIN

/**  Tasteful Checkbox for iOS.
 */
IB_DESIGNABLE @interface OOListBox : UIView

#pragma mark - The list box's background color.
/**
 * The color could be change when you set it.
 */
@property (nonatomic,assign) IBInspectable UIColor *color;

/**
 * The strings array to holdplace those selection items.
 */
@property (nonatomic,strong) NSMutableArray *selectStrings;

/**
 *  The default selected items,if it's nil,then the list box will set the first element of
 *  the selectStrings.
 */
@property (nonatomic,copy) IBInspectable NSString *defaultFirstSelection;

-(NSInteger)selectedItemIndex;
-(NSString *)selectedItemString;

@end

NS_ASSUME_NONNULL_END
