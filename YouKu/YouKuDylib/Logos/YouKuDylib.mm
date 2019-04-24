#line 1 "/Users/dengbin/Desktop/YouKu/YouKu/YouKuDylib/Logos/YouKuDylib.xm"
#import <UIKit/UIKit.h>
#define FYDefaults  [NSUserDefaults standardUserDefaults]
#define FYSwitchUserDefaultsKey @"FYSwitchUserDefaultsKey"

@interface SettingViewController
- (long long)numberOfSectionsInTableView:(id)arg1;
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

@class SettingViewController; 
static void _logos_method$_ungrouped$SettingViewController$switchChangeAction$(_LOGOS_SELF_TYPE_NORMAL SettingViewController* _LOGOS_SELF_CONST, SEL, UISwitch *); static long long (*_logos_orig$_ungrouped$SettingViewController$numberOfSectionsInTableView$)(_LOGOS_SELF_TYPE_NORMAL SettingViewController* _LOGOS_SELF_CONST, SEL, id); static long long _logos_method$_ungrouped$SettingViewController$numberOfSectionsInTableView$(_LOGOS_SELF_TYPE_NORMAL SettingViewController* _LOGOS_SELF_CONST, SEL, id); static long long (*_logos_orig$_ungrouped$SettingViewController$tableView$numberOfRowsInSection$)(_LOGOS_SELF_TYPE_NORMAL SettingViewController* _LOGOS_SELF_CONST, SEL, UITableView *, long long); static long long _logos_method$_ungrouped$SettingViewController$tableView$numberOfRowsInSection$(_LOGOS_SELF_TYPE_NORMAL SettingViewController* _LOGOS_SELF_CONST, SEL, UITableView *, long long); static double (*_logos_orig$_ungrouped$SettingViewController$tableView$heightForRowAtIndexPath$)(_LOGOS_SELF_TYPE_NORMAL SettingViewController* _LOGOS_SELF_CONST, SEL, UITableView *, id); static double _logos_method$_ungrouped$SettingViewController$tableView$heightForRowAtIndexPath$(_LOGOS_SELF_TYPE_NORMAL SettingViewController* _LOGOS_SELF_CONST, SEL, UITableView *, id); static id (*_logos_orig$_ungrouped$SettingViewController$tableView$cellForRowAtIndexPath$)(_LOGOS_SELF_TYPE_NORMAL SettingViewController* _LOGOS_SELF_CONST, SEL, UITableView *, id); static id _logos_method$_ungrouped$SettingViewController$tableView$cellForRowAtIndexPath$(_LOGOS_SELF_TYPE_NORMAL SettingViewController* _LOGOS_SELF_CONST, SEL, UITableView *, id); 

#line 9 "/Users/dengbin/Desktop/YouKu/YouKu/YouKuDylib/Logos/YouKuDylib.xm"



static void _logos_method$_ungrouped$SettingViewController$switchChangeAction$(_LOGOS_SELF_TYPE_NORMAL SettingViewController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, UISwitch * switchView){
    [FYDefaults setBool:switchView.isOn forKey:FYSwitchUserDefaultsKey];
    [FYDefaults synchronize];
    [MSHookIvar <UITableView *>(self,"_tabview") reloadData];
}


static long long _logos_method$_ungrouped$SettingViewController$numberOfSectionsInTableView$(_LOGOS_SELF_TYPE_NORMAL SettingViewController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, id arg1){
    UITableView * tableView = MSHookIvar <UITableView *>(self,"_tabview");
    NSLog(@"fy_numberOfSectionsInTableView:");
    
    return _logos_orig$_ungrouped$SettingViewController$numberOfSectionsInTableView$(self, _cmd, arg1)+1;
}


static long long _logos_method$_ungrouped$SettingViewController$tableView$numberOfRowsInSection$(_LOGOS_SELF_TYPE_NORMAL SettingViewController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, UITableView * tableView, long long section){
    NSLog(@"fy_numberOfRowsInSection:");
    
    if(section == [self numberOfSectionsInTableView:tableView]-1){
        return 1;
    }
    else{
        return _logos_orig$_ungrouped$SettingViewController$tableView$numberOfRowsInSection$(self, _cmd, tableView, section);
    }
}



static double _logos_method$_ungrouped$SettingViewController$tableView$heightForRowAtIndexPath$(_LOGOS_SELF_TYPE_NORMAL SettingViewController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, UITableView * tableView, id indexPath){
    NSLog(@"fy_heightForRowAtIndexPath:");
    
    if([indexPath section] ==[self numberOfSectionsInTableView:tableView]-1){
        return 44;
    }
    else{
        return _logos_orig$_ungrouped$SettingViewController$tableView$heightForRowAtIndexPath$(self, _cmd, tableView, indexPath);
    }
}



static id _logos_method$_ungrouped$SettingViewController$tableView$cellForRowAtIndexPath$(_LOGOS_SELF_TYPE_NORMAL SettingViewController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, UITableView * tableView, id indexPath){
    NSLog(@"fy_cellForRowAtIndexPath:");
    
    if([indexPath section] == [self numberOfSectionsInTableView:tableView]-1){
        UITableViewCell * cell = nil;
        if([indexPath row] == 0){
            static NSString *swCell = @"SwCellIdentifier";
            cell = [tableView dequeueReusableCellWithIdentifier:swCell];
            if(!cell){
                cell = [[UITableViewCell alloc] initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:nil];
            }
            cell.textLabel.text = @"免广告";
            
            UISwitch *switchView = [[UISwitch alloc] init];
            switchView.on = [FYDefaults boolForKey:FYSwitchUserDefaultsKey];
            [switchView addTarget:self action:@selector(switchChangeAction:) forControlEvents:(UIControlEventValueChanged)];
            cell.accessoryView = switchView;
            cell.imageView.image = [UIImage imageNamed:([FYDefaults boolForKey:FYSwitchUserDefaultsKey] == 1) ? @"unlocked" : @"locked"];
        }
        cell.backgroundColor = [UIColor whiteColor];
        return cell;
        
    }else{
        return _logos_orig$_ungrouped$SettingViewController$tableView$cellForRowAtIndexPath$(self, _cmd, tableView, indexPath);
    }
}


static __attribute__((constructor)) void _logosLocalInit() {
{Class _logos_class$_ungrouped$SettingViewController = objc_getClass("SettingViewController"); { char _typeEncoding[1024]; unsigned int i = 0; _typeEncoding[i] = 'v'; i += 1; _typeEncoding[i] = '@'; i += 1; _typeEncoding[i] = ':'; i += 1; memcpy(_typeEncoding + i, @encode(UISwitch *), strlen(@encode(UISwitch *))); i += strlen(@encode(UISwitch *)); _typeEncoding[i] = '\0'; class_addMethod(_logos_class$_ungrouped$SettingViewController, @selector(switchChangeAction:), (IMP)&_logos_method$_ungrouped$SettingViewController$switchChangeAction$, _typeEncoding); }MSHookMessageEx(_logos_class$_ungrouped$SettingViewController, @selector(numberOfSectionsInTableView:), (IMP)&_logos_method$_ungrouped$SettingViewController$numberOfSectionsInTableView$, (IMP*)&_logos_orig$_ungrouped$SettingViewController$numberOfSectionsInTableView$);MSHookMessageEx(_logos_class$_ungrouped$SettingViewController, @selector(tableView:numberOfRowsInSection:), (IMP)&_logos_method$_ungrouped$SettingViewController$tableView$numberOfRowsInSection$, (IMP*)&_logos_orig$_ungrouped$SettingViewController$tableView$numberOfRowsInSection$);MSHookMessageEx(_logos_class$_ungrouped$SettingViewController, @selector(tableView:heightForRowAtIndexPath:), (IMP)&_logos_method$_ungrouped$SettingViewController$tableView$heightForRowAtIndexPath$, (IMP*)&_logos_orig$_ungrouped$SettingViewController$tableView$heightForRowAtIndexPath$);MSHookMessageEx(_logos_class$_ungrouped$SettingViewController, @selector(tableView:cellForRowAtIndexPath:), (IMP)&_logos_method$_ungrouped$SettingViewController$tableView$cellForRowAtIndexPath$, (IMP*)&_logos_orig$_ungrouped$SettingViewController$tableView$cellForRowAtIndexPath$);} }
#line 81 "/Users/dengbin/Desktop/YouKu/YouKu/YouKuDylib/Logos/YouKuDylib.xm"
