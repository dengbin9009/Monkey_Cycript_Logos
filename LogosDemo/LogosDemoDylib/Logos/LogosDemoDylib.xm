// See http://iphonedevwiki.net/index.php/Logos

#import <UIKit/UIKit.h>

// 这里只是为了申明
@interface ViewController

- (void)newFunC;

@end

%hook ViewController

// 新增方法关键字new
%new
- (void)newFunC{
    NSLog(@"newFunC");
}

// IBAction == void
- (void)tapAction:(id)sender {
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"来什么来" message:@"😡😡😡" delegate:nil cancelButtonTitle:@"我知道了" otherButtonTitles:nil, nil];
    [alert show];
    [self newFunC];
    // 调用原方法关键字orig
    %orig;
}

%end
