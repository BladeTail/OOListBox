# OOListBox

[![CI Status](http://img.shields.io/travis/www.oldone@qq.com/OOListBox.svg?style=flat)](https://travis-ci.org/www.oldone@qq.com/OOListBox)
[![Version](https://img.shields.io/cocoapods/v/OOListBox.svg?style=flat)](http://cocoapods.org/pods/OOListBox)
[![License](https://img.shields.io/cocoapods/l/OOListBox.svg?style=flat)](http://cocoapods.org/pods/OOListBox)
[![Platform](https://img.shields.io/cocoapods/p/OOListBox.svg?style=flat)](http://cocoapods.org/pods/OOListBox)

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements

## Installation

OOListBox is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'OOListBox'
```

## Author

www.oldone@qq.com, zqylwrq@yonyou.com

ListBox controller written in Objective-C.This is just a test for using of git commands.

Drag the OOListBox.h and OOListBox.m files to your project.
You can use it just like any other widget such as UIView.

Using example:
```objectivec
OOListBox * listBox = [OOListBox alloc] initWithFrame:CGRectMake(0, 0, 150, 36);
listBox.defaultSelectedString = @"Make a choise";
NSArray *array = @[@"itemOne",@"itemFirst",@"itemTird"];
listBox.selectStrings = [[NSMutableArray alloc] initWithArray:array];
[self.view addSubView:listBox]
```
This might wouldn't be updated any more.

## License

OOListBox is available under the MIT license. See the LICENSE file for more info.

