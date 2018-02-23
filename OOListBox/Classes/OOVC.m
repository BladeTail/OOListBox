//
//  OOVC.m
//  OOListBox
//
//  Created by ruiqing wan on 2018-02-09.
//

#import "OOVC.h"
#import "OOListBoxBundle.h"

@interface OOVC ()
@property (nonatomic,weak) IBOutlet UIImageView *imageView;
@end

@implementation OOVC

+(OOVC *)loadFromNib{
    OOVC *instance = [[OOVC alloc] initWithNibName:NSStringFromClass([OOVC class]) bundle:[OOListBoxBundle frameworkBundle]];
    return instance;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    UIImage *image = [UIImage imageNamed:@"avatar_placeholder" inBundle:[OOListBoxBundle frameworkBundle] compatibleWithTraitCollection:nil];
    self.imageView.image = image;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
