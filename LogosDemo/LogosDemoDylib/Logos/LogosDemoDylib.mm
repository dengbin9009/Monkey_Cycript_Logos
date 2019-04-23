#line 1 "/Users/dengbin/Code/GitHub/Monkey_Cycript_Logos/LogosDemo/LogosDemoDylib/Logos/LogosDemoDylib.xm"


#import <UIKit/UIKit.h>

@interface ViewController
- (void)newFunC;
@end


#include <substrate.h>
#if defined(__clang__)
#if __has_feature(objc_arc)
#define _LOGOS_SELF_TYPE_NORMAL __unsafe_unretained
#define _LOGOS_SELF_TYPE_INIT __attribute__((ns_consumed))
#define _LOGOS_SELF_CONST const
#define _LOGOS_RETURN_RETAINED __attribute__((ns_returns_retained))
#else
#define _LOGOS_SELF_TYPE_NORMAL
#define _LOGOS_SELF_TYPE_INIT
#define _LOGOS_SELF_CONST
#define _LOGOS_RETURN_RETAINED
#endif
#else
#define _LOGOS_SELF_TYPE_NORMAL
#define _LOGOS_SELF_TYPE_INIT
#define _LOGOS_SELF_CONST
#define _LOGOS_RETURN_RETAINED
#endif

@class ViewController; 
static void _logos_method$_ungrouped$ViewController$newFunC(_LOGOS_SELF_TYPE_NORMAL ViewController* _LOGOS_SELF_CONST, SEL); static void (*_logos_orig$_ungrouped$ViewController$tapAction$)(_LOGOS_SELF_TYPE_NORMAL ViewController* _LOGOS_SELF_CONST, SEL, id); static void _logos_method$_ungrouped$ViewController$tapAction$(_LOGOS_SELF_TYPE_NORMAL ViewController* _LOGOS_SELF_CONST, SEL, id); 

#line 9 "/Users/dengbin/Code/GitHub/Monkey_Cycript_Logos/LogosDemo/LogosDemoDylib/Logos/LogosDemoDylib.xm"



static void _logos_method$_ungrouped$ViewController$newFunC(_LOGOS_SELF_TYPE_NORMAL ViewController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd){
    NSLog(@"newFunC");
}

static void _logos_method$_ungrouped$ViewController$tapAction$(_LOGOS_SELF_TYPE_NORMAL ViewController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, id sender) {
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"来什么来" message:@"😡😡😡" delegate:nil cancelButtonTitle:@"我知道了" otherButtonTitles:nil, nil];
    [alert show];
    [self newFunC];
    _logos_orig$_ungrouped$ViewController$tapAction$(self, _cmd, sender);
}


static __attribute__((constructor)) void _logosLocalInit() {
{Class _logos_class$_ungrouped$ViewController = objc_getClass("ViewController"); { char _typeEncoding[1024]; unsigned int i = 0; _typeEncoding[i] = 'v'; i += 1; _typeEncoding[i] = '@'; i += 1; _typeEncoding[i] = ':'; i += 1; _typeEncoding[i] = '\0'; class_addMethod(_logos_class$_ungrouped$ViewController, @selector(newFunC), (IMP)&_logos_method$_ungrouped$ViewController$newFunC, _typeEncoding); }MSHookMessageEx(_logos_class$_ungrouped$ViewController, @selector(tapAction:), (IMP)&_logos_method$_ungrouped$ViewController$tapAction$, (IMP*)&_logos_orig$_ungrouped$ViewController$tapAction$);} }
#line 24 "/Users/dengbin/Code/GitHub/Monkey_Cycript_Logos/LogosDemo/LogosDemoDylib/Logos/LogosDemoDylib.xm"
