//
//  ViewController.m
//  JXTTest
//
//  Created by 姜训彤 on 2018/11/6.
//  Copyright © 2018 JXT. All rights reserved.
//

#import "ViewController.h"
#import "JXTQuickCreateControl.h"
#import "jxtViewController.h"
#import "Masonry.h"

#import "TFDropDownMenuView.h"
#import "PasswordView.h"
#define Color_RGB(a,b,c,d) [UIColor colorWithRed:(a)/255.0 green:(b)/255.0 blue:(c)/255.0 alpha:(d)]
#define GrayColor  Color_RGB(236,236,236,1)//headerView 灰
#define screenWidth [UIScreen mainScreen].bounds.size.width
#define screenHeight [UIScreen mainScreen].bounds.size.height
#define RGBACOLOR(a,b,c,d) Color_RGB(a,b,c,d)
#define Font(a)     [UIFont systemFontOfSize:a];
#define littleBlackColor  Color_RGB(79,79,79,1)// 字体浅黑
#define YellowColor  Color_RGB(253,131,42,1)//主题黄
#define LineGrayColor  Color_RGB(210,210,210,1)//分割线 灰

#define STATUSBAR_HEIGHT ([[UIApplication sharedApplication] statusBarFrame].size.height)

#define NAVBAR_HEIGHT (STATUSBAR_HEIGHT+44)
@interface ViewController ()<UITableViewDelegate,UITableViewDataSource,PasswordViewDelegate,TFDropDownMenuViewDelegate>
@property (nonatomic,strong) UITableView *tableView;
@property (nonatomic,strong) NSMutableArray *dataArray;
@property (nonatomic,strong) UIView *alphaView;
@property (nonatomic,strong) NSString *checkString;
@property (nonatomic,strong) NSString *updateString;
@property (nonatomic) NSInteger integer;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    self.view.backgroundColor = [UIColor orangeColor];
    NSMutableArray *array1 = [NSMutableArray arrayWithObjects:@"面积最大", @"面积最小", @"价格最高", @"价格最低", nil];
    
    NSMutableArray *data1 = [NSMutableArray arrayWithObjects:array1, nil];
    NSMutableArray *data2 = [NSMutableArray arrayWithObjects:@[], nil];
    TFDropDownMenuView *menu = [[TFDropDownMenuView alloc] initWithFrame:CGRectMake(0, NAVBAR_HEIGHT, UIScreen.mainScreen.bounds.size.width, 40) firstArray:data1 secondArray:data2 MenuTitleStyle:TFDropDownMenuTitleStyleLeft];
    //    menu.menuTitleStyle = TFDropDownMenuTitleStyleLeft;
    menu.delegate = self;
    menu.cellSelectBackgroundColor = [UIColor colorWithWhite:0.9 alpha:1];
    menu.ratioLeftToScreen = 0.35;
    [self.view addSubview:menu];
//    self.view.backgroundColor = GrayColor;
//    self.alphaView = [[UIView alloc]initWithFrame:[UIScreen mainScreen].bounds];
//    self.dataArray = [NSMutableArray arrayWithObjects:@"修改提现密码",@"忘记提现密码", nil];
//    [self initSubview];
    
    
//    UIButton *myButton = [JXTQuickCreateControl JXTConvenientControlButton:@"111" Font:[UIFont systemFontOfSize:12] TextColor:[UIColor blackColor] BackgroundColor:[UIColor whiteColor]];
//    [self.view addSubview:myButton];
//    [myButton mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.center.mas_equalTo(self.view);
//        make.width.mas_equalTo(100);
//        make.height.mas_equalTo(100);
//    }];
//    [myButton addTarget:self action:@selector(pushAction) forControlEvents:UIControlEventTouchUpInside];
}
- (void)pushAction{
    jxtViewController *vc = [jxtViewController new];
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)menuView:(TFDropDownMenuView *)menu selectIndex:(TFIndexPatch *)index {
    NSLog(@"index: %@", index);
}

- (void)menuView:(TFDropDownMenuView *)menu tfColumn:(NSInteger)column {
    NSLog(@"column: %ld", column);
}
-(void)initSubview{
    
    self.tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 64, screenWidth, screenHeight) style:UITableViewStyleGrouped];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.view addSubview:self.tableView];
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 2;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *string = @"tradeCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:string];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:string];
    }
    
    cell.textLabel.text = self.dataArray[indexPath.row];
    cell.textLabel.font = Font(14);
    cell.textLabel.textColor = littleBlackColor;
    cell.accessoryView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"personal_arrow"]];
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    self.integer = 1;
    [self initAlphaViewAndString:@"请输入原提现密码"];
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 43;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 0.001;
}
-(void)initAlphaViewAndString:(NSString *)string
{
    
    self.alphaView.backgroundColor = RGBACOLOR(0, 0, 0, 0.3);
    self.alphaView.alpha = 1;
    //    UIWindow *window = [[UIApplication sharedApplication].windows lastObject];
    //    [window addSubview:self.alphaView];
    
    [self.view addSubview:self.alphaView];
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapToDismiss)];
    [self.alphaView addGestureRecognizer:tap];
    
//    UIView *whiteV = [[UIView alloc]initWithFrame:CGRectMake(20, 110, screenWidth - 40, 140)];
//    whiteV.backgroundColor = [UIColor whiteColor];
//
//    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(20, 25, screenWidth - 80, 15)];
//    label.textColor = YellowColor;
//    label.text = string;
//    label.font = Font(12);
//    [whiteV addSubview:label];
    
    PasswordView *password = [[PasswordView alloc]initWithFrame:CGRectMake(20,90, screenWidth - 80, 43)];
//    [whiteV addSubview:password];
    password.layer.borderColor = LineGrayColor.CGColor;
    password.layer.borderWidth = 0.5;
    password.delegate = self;
    password.backgroundColor = [UIColor whiteColor];
    
    [self.alphaView addSubview:password];
    
    
//    CAKeyframeAnimation* animation = [CAKeyframeAnimation animationWithKeyPath:@"transform"];
//    animation.duration = 0.5;
//
//    NSMutableArray *values = [NSMutableArray array];
//    [values addObject:[NSValue valueWithCATransform3D:CATransform3DMakeScale(0.8, 0.8, 1.0)]];
//    [values addObject:[NSValue valueWithCATransform3D:CATransform3DMakeScale(1.2, 1.2, 1.0)]];
//    [values addObject:[NSValue valueWithCATransform3D:CATransform3DMakeScale(0.9, 0.9, 1.0)]];
//    [values addObject:[NSValue valueWithCATransform3D:CATransform3DMakeScale(1.0, 1.0, 1.0)]];
//    animation.values = values;
//    [whiteV.layer addAnimation:animation forKey:nil];
}

-(void)tapToDismiss{
    
    [UIView animateWithDuration:0.2 animations:^{
        [self.alphaView endEditing:YES];
        
        self.alphaView.alpha = 0;
    } completion:^(BOOL finished) {
        [self.alphaView removeFromSuperview];
    }];
}

#pragma mark PasswordView Delegate
-(void)passWordDidChange:(PasswordView *)password
{
    NSLog(@"改变%@",password.textStore);
}

-(void)passWordBeginInput:(PasswordView *)password
{
    NSLog(@"开始输入%@",password.textStore);
}

-(void)passWordCompleteInput:(PasswordView *)password
{
    NSLog(@"输入完成%@",password.textStore);
    
    if (password.textStore.length == 6 && self.integer == 1) {
        
        self.checkString = password.textStore;
        //延迟执行
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [self checkPassword];
        });
    }
    if (password.textStore.length == 6 && self.integer == 2) {
        
        self.updateString = password.textStore;
        //延迟执行
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [self updatePassword];
        });
    }
}

//验证原始密码
-(void)checkPassword
{
    [self tapToDismiss];
    NSLog(@"验证原始密码");
}

//更改密码
-(void)updatePassword
{
    [self tapToDismiss];
    NSLog(@"更改密码");
}
@end
