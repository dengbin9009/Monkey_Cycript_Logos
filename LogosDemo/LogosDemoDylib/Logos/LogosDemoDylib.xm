// See http://iphonedevwiki.net/index.php/Logos

#import <UIKit/UIKit.h>

@interface ViewController

- (void)newFunC;

@end

%hook ViewController

%new
- (void)newFunC{
    NSLog(@"newFunC");
}

- (void)tapAction:(id)sender {
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"来什么来" message:@"😡😡😡" delegate:nil cancelButtonTitle:@"我知道了" otherButtonTitles:nil, nil];
    [alert show];
    [self newFunC];
    %orig;
}

%end
