//
//  OOListBoxBundle.m
//  OOListBox
//
//  Created by ruiqing wan on 2018-02-09.
//

#import "OOListBoxBundle.h"

@implementation OOListBoxBundle
+(NSBundle *)frameworkBundle
{
    static NSBundle* frameworkBundle = nil;
    static dispatch_once_t predicate;
    dispatch_once(&predicate, ^{
        NSString* mainBundlePath = [[NSBundle mainBundle] resourcePath];
        NSString* frameworkBundlePath = [mainBundlePath stringByAppendingPathComponent:@"OOListBox.bundle"];
        frameworkBundle = [NSBundle bundleWithPath:frameworkBundlePath];
    });
    return frameworkBundle;
}
@end
