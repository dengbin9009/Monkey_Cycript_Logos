#import <UIKit/UIKit.h>
#define FYDefaults  [NSUserDefaults standardUserDefaults]
#define FYSwitchUserDefaultsKey @"FYSwitchUserDefaultsKey"

@interface SettingViewController
- (long long)numberOfSectionsInTableView:(id)arg1;
@end

%hook SettingViewController

%new
-(void)switchChangeAction:(UISwitch *)switchView{
    [FYDefaults setBool:switchView.isOn forKey:FYSwitchUserDefaultsKey];
    [FYDefaults synchronize];
    [MSHookIvar <UITableView *>(self,"_tabview") reloadData];
}

//多少组
- (long long)numberOfSectionsInTableView:(id)arg1{
    UITableView * tableView = MSHookIvar <UITableView *>(self,"_tabview");
    NSLog(@"fy_numberOfSectionsInTableView:");
    // 额外增加一个
    return %orig+1;
}

//每组多少行
- (long long)tableView:(UITableView *)tableView numberOfRowsInSection:(long long)section{
    NSLog(@"fy_numberOfRowsInSection:");
    //定位设置界面,并且是最后一个
    if(section == [self numberOfSectionsInTableView:tableView]-1){
        return 1;
    }
    else{
        return %orig;
    }
}

//返回高度
- (double)tableView:
(UITableView *)tableView heightForRowAtIndexPath:(id)indexPath{
    NSLog(@"fy_heightForRowAtIndexPath:");
    //定位设置界面,并且是最后一个
    if([indexPath section] ==[self numberOfSectionsInTableView:tableView]-1){
        return 44;
    }
    else{
        return %orig;
    }
}


//每一个Cell
- (id)tableView:(UITableView *)tableView cellForRowAtIndexPath:(id)indexPath{
    NSLog(@"fy_cellForRowAtIndexPath:");
    //定位设置界面,并且是最后一组
    if([indexPath section] == [self numberOfSectionsInTableView:tableView]-1){
        UITableViewCell * cell = nil;
        if([indexPath row] == 0){
            static NSString *swCell = @"SwCellIdentifier";
            cell = [tableView dequeueReusableCellWithIdentifier:swCell];
            if(!cell){
                cell = [[UITableViewCell alloc] initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:nil];
            }
            cell.textLabel.text = @"免广告";
            // 免广告开关
            UISwitch *switchView = [[UISwitch alloc] init];
            switchView.on = [FYDefaults boolForKey:FYSwitchUserDefaultsKey];
            [switchView addTarget:self action:@selector(switchChangeAction:) forControlEvents:(UIControlEventValueChanged)];
            cell.accessoryView = switchView;
            cell.imageView.image = [UIImage imageNamed:([FYDefaults boolForKey:FYSwitchUserDefaultsKey] == 1) ? @"unlocked" : @"locked"];
        }
        cell.backgroundColor = [UIColor whiteColor];
        return cell;
        
    }else{
        return %orig;
    }
}

%end
