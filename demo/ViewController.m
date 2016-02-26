//
//  ViewController.m
//  demo
//
//  Created by binghuang on 15/5/9.
//  Copyright (c) 2015年 binghuang. All rights reserved.
//

#import "ViewController.h"
//import "ViewController.h"
#import <CoreBluetooth/CoreBluetooth.h>
#import <CoreLocation/CoreLocation.h>
#import "DrawView.h"
#import "EyeView.h"

#define KScreenWidth  [UIScreen mainScreen].bounds.size.width
#define KScreenHeight [UIScreen mainScreen].bounds.size.height


@interface ViewController ()<CLLocationManagerDelegate,UITableViewDataSource,UITableViewDelegate>{
    BOOL isopenMenuBtn;
    NSMutableArray * buttonArray;
    UIButton * menuBtn;
    UIView * toastView;
    CLLocationManager * locationManager;
    UILabel * textLabel;
    
    UIButton * loginBtn;
    
    EyeView  * _eyeView;
    
    CAShapeLayer  * shapeLayer;
}



@end



@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    CGPoint startPoint    = CGPointMake(50, 300);
//    CGPoint endPoint      = CGPointMake(300, 300);
//    CGPoint controlPoint  = CGPointMake(170, 200);
//    
//    CALayer * layer1 = [CALayer layer];
//
//    layer1.backgroundColor   = [UIColor blackColor].CGColor;
//
//    layer1.frame             = CGRectMake(startPoint.x, startPoint.y, 5, 5);
//
//    UIBezierPath * paths     = [UIBezierPath bezierPath];
//    
//     shapeLayer              = [CAShapeLayer layer];
//    
//    [paths moveToPoint:startPoint];
//    [paths addQuadCurveToPoint:endPoint controlPoint:controlPoint];
//    
//    shapeLayer.path          =  paths.CGPath;
//    shapeLayer.fillColor     =  [UIColor clearColor].CGColor;
//    shapeLayer.strokeColor   =  [UIColor blackColor].CGColor;
//   
//    [self.view.layer addSublayer:shapeLayer];
//    [self.view.layer addSublayer:layer1];
//    
//    //底部
//    CGSize  finalSize     = CGSizeMake(CGRectGetWidth(self.view.frame),400);
//    float   layerHeight   = finalSize.height * 0.2;
//    CAShapeLayer  *layer  = [CAShapeLayer layer];
//    UIBezierPath  *path   = [UIBezierPath bezierPath];
//    [path moveToPoint:CGPointMake(1,finalSize.height -1)];
//    [path addLineToPoint:CGPointMake(finalSize.width, finalSize.height - 1)];
//    [path addLineToPoint:CGPointMake(finalSize.width, finalSize.height - layerHeight)];
//    [path addQuadCurveToPoint:CGPointMake(1, finalSize.height - layerHeight) controlPoint:CGPointMake(finalSize.width/2,(finalSize.height - layerHeight) - 40)];
//    [path addLineToPoint:CGPointMake(1,finalSize.height -1)];
//    layer.path            = path.CGPath;
//    layer.strokeColor     = [UIColor redColor].CGColor;
//    layer.fillColor       = [UIColor clearColor].CGColor;
//    [self.view.layer addSublayer:layer];
    
    
    
//    //登陆按钮
//    loginBtn = ({
//        UIButton * button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
//        button.frame      = CGRectMake(0,64,50,20);
//        [button setTitle:@"登录" forState:UIControlStateNormal];
//        [button addTarget:self action:@selector(loginAction:) forControlEvents:UIControlEventTouchUpInside];
//        button;
//    });
//    
//    [self.view addSubview:loginBtn];
    
    //eyeView
     _eyeView = [[EyeView alloc] initWithFrame:CGRectMake(0,64,CGRectGetWidth(self.view.frame),100)];
     _eyeView.layer.borderColor = [UIColor redColor].CGColor;
     _eyeView.layer.borderWidth = 1;
//    _eyeView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:_eyeView];
    
    
    UITableView  * tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 64,CGRectGetWidth(self.view.frame),CGRectGetHeight(self.view.frame) - 64) style:UITableViewStylePlain];
    tableView.backgroundColor = [UIColor clearColor];
    tableView.dataSource      = self;
    tableView.delegate        = self;
    [self.view addSubview:tableView];
    
//    UIBezierPath * path   = [UIBezierPath bezierPathWithRect:CGRectMake(20,100,200,50)];
//    CAShapeLayer * layers = [CAShapeLayer layer];
//    layers.path       = path.CGPath;
//    layers.fillColor    = [UIColor  clearColor].CGColor;
//    layers.strokeColor  = [UIColor blackColor].CGColor;
//    [self.view.layer addSublayer:layers];

//    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(100, 100, 200, 100)];
//    view.backgroundColor = [UIColor yellowColor];
//    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 5, 0, 0)];
//    [label setFont:[UIFont systemFontOfSize:19]];
//    label.text = @"测试下，我要测试下试试事实上事实上事实上";
//    CGSize sizeThatFits = [label sizeThatFits:CGSizeZero];
//    NSLog(@"----第一个== %f  %f ----", sizeThatFits.width, sizeThatFits.height);
//    // output:  ---------- 117.000000  24.000000 ---------------
//    
//    NSLog(@"****==第二个== %f  %f ****", label.frame.size.width, label.frame.size.height);
//    // output:  **** 0.000000  0.000000 **** 说明sizeThatSize并没有改变原始label的大小
   
//    [label sizeToFit];  // 这样搞就直接改变了这个label的宽和高，使它根据上面字符串的大小做合适的改变
//    //[label setCenter:CGPointMake(80, 50)];
//    NSLog(@"====第三个=== %f %f ====", label.frame.size.width, label.frame.size.height);
//    // output:   ==== 117.000000 24.000000 ===============
   
//    [view addSubview:label];
//    [self.view addSubview:view];
    
//    DrawView * drawView = [[DrawView alloc]initWithFrame:self.view.frame];
//    drawView.backgroundColor = [UIColor whiteColor];
//    [self.view addSubview:drawView];
//    CGAffineTransform transform = CGAffineTransformMakeTranslation(50, 20);
    

//    locationManager = [[CLLocationManager alloc] init];
//    locationManager.delegate = self;
//    [locationManager setDesiredAccuracy:kCLLocationAccuracyBest];
//    
//    if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 8.0)
//    {
//        [locationManager requestWhenInUseAuthorization];
//        [locationManager requestAlwaysAuthorization];
//    }
//    
//    
//    //B5B182C7-EAB1-4988-AA99-B5C1517008D9
//
//    NSUUID *uuid = [[NSUUID alloc] initWithUUIDString:@"FDA50693-A4E2-4FB1-AFCF-C6EB07647825"];
//    
//    CLBeaconRegion * _beaconRegion =  [[CLBeaconRegion alloc] initWithProximityUUID:uuid identifier:@""];
//    
//    [locationManager startRangingBeaconsInRegion:_beaconRegion];
//    
//    
//    toastView = [[UIView alloc] initWithFrame:CGRectMake(0, 0,200,200)];
//    toastView.center   = self.view.center;
//    toastView.backgroundColor  = [UIColor blackColor];
//    [self.view addSubview:toastView];
//    
//    textLabel = [[UILabel alloc] initWithFrame:CGRectMake(0,100, 200, 50)];
//    textLabel.textColor  = [UIColor redColor];
//    [toastView addSubview:textLabel];
//    
//    // Do any additional setup after loading the view, typically from a nib.
//    
//    menuBtn = [UIButton buttonWithType:UIButtonTypeCustom];
//    menuBtn.frame = CGRectMake(20,KScreenHeight - 60, 40, 40);
//    menuBtn.backgroundColor = [UIColor redColor];
////    menuBtn setBackgroundColor:<#(UIColor *)#>
//    menuBtn.titleLabel.textAlignment = NSTextAlignmentCenter;
//    menuBtn.layer.cornerRadius = CGRectGetWidth(menuBtn.frame)/2;
//    [menuBtn setTitle:@"1F" forState:UIControlStateNormal];
//    [menuBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
//    [menuBtn setTitleColor:[UIColor blueColor] forState:UIControlStateHighlighted];
//    [menuBtn addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
//    menuBtn.tag = 100;
//    
//    //创建button数组
//     buttonArray = [[NSMutableArray alloc] initWithCapacity:3];
//    for (int i= 0;i<3;i++) {
//        
//        UIButton * menuBtn2 = [UIButton buttonWithType:UIButtonTypeCustom];
//        menuBtn2.frame = CGRectMake(20,(KScreenHeight - 60)-40*(i+1) - 10*(i+1), 40, 40);
//        menuBtn2.backgroundColor = [UIColor redColor];
//        menuBtn2.titleLabel.textAlignment = NSTextAlignmentCenter;
//        menuBtn2.layer.cornerRadius = CGRectGetWidth(menuBtn.frame)/2;
//        //[menuBtn2 setTitle:@"1F" forState:UIControlStateNormal];
//        [menuBtn2 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
//        [menuBtn2 setTitleColor:[UIColor blueColor] forState:UIControlStateHighlighted];
//        [menuBtn2 addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
//        menuBtn2.tag = 101 + i;
//        [buttonArray addObject: menuBtn2];
//    }
//    
//    //先添加
//    for (UIButton * button in buttonArray) {
//        
//        switch (button.tag) {
//            case 101:
//                  [button setTitle:@"1F" forState:UIControlStateNormal];
//                break;
//            case 102:
//                  [button setTitle:@"2F" forState:UIControlStateNormal];
//                break;
//            case 103:
//                  [button setTitle:@"3F" forState:UIControlStateNormal];
//                break;
//                
//            default:
//                break;
//        }
//        
//        [self.view addSubview:button];
//        
//    }
//    //添加菜单按钮
//    [self.view addSubview:menuBtn];
//    
    
    
    NSLog(@"viewDidLoad=====>");
}

-(void)loginAction:(UIButton *) sender{
    NSLog(@"loginAction=====>");
    //[self animation1];
    
//    UIAlertController  * alertDialog = [UIAlertController alertControllerWithTitle:@"提示" message:@"整个山谷图个" preferredStyle:UIAlertControllerStyleAlert];
//    
//    [alertDialog addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
//        textField.placeholder = @"Your Email";
//        textField.secureTextEntry = NO;
//    }];
//    
//    // 创建操作
//    UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"去顶" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
//        // 读取文本框的值显示出来
//        UITextField *userEmail = alertDialog.textFields.firstObject;
//       // self.userOutput.text = userEmail.text;
//    }];
//    
//    // 添加操作（顺序就是呈现的上下顺序）
//    [alertDialog addAction:okAction];
//    
//    
//    [self presentViewController:alertDialog animated:YES completion:^{
//    }];
//    
}

-(void)animation1{
    
    shapeLayer.strokeStart  = 0.5f;
    shapeLayer.strokeEnd    = 0.5f;
    CABasicAnimation  * animation1 = [CABasicAnimation animationWithKeyPath:@"strokeStart"];
    animation1.fromValue           = [NSNumber numberWithFloat:0.5];
    animation1.toValue             = [NSNumber numberWithFloat:0.0];
    animation1.duration            = 2.0f;
//  animation1.autoreverses        = YES;
//  animation1.repeatCount         = MAXFLOAT;
    animation1.removedOnCompletion=NO;
    animation1.fillMode            = kCAFillModeForwards ;
  
    
    CABasicAnimation  * animation2 = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    animation2.fromValue           = [NSNumber numberWithFloat:0.5];
    animation2.toValue             = [NSNumber numberWithFloat:1.0];
    animation2.duration            = 2.0f;
//  animation2.autoreverses        = YES;
//  animation2.repeatCount         = MAXFLOAT;
    animation2.removedOnCompletion = NO;
    animation2.fillMode            = kCAFillModeForwards;
    
    [shapeLayer addAnimation:animation1 forKey:@"strokeStart1"];
    [shapeLayer addAnimation:animation2 forKey:@"strokeEnd1"];
    
}

#pragma mark - 实时获取蓝牙信息
- (void)locationManager:(CLLocationManager *)manager
        didRangeBeacons:(NSArray<CLBeacon *> *)beacons inRegion:(CLBeaconRegion *)region{
    textLabel.text = [NSString stringWithFormat:@"我被调用了===%ld",[beacons count]];
    NSLog(@"beacons ==== %ld",[beacons count]);
}

#pragma mark - 蓝牙和定位失败后调用这里
- (void)locationManager:(CLLocationManager *)manager
rangingBeaconsDidFailForRegion:(CLBeaconRegion *)region
              withError:(NSError *)error{
    textLabel.text  = @"关闭蓝牙和定位都会调用这里!";
    NSLog(@"关闭蓝牙和定位都会调用这里!");
}

/*
 *  locationManager:didEnterRegion:
 *
 *  Discussion:
 *    Invoked when the user enters a monitored region.  This callback will be invoked for every allocated
 *    CLLocationManager instance with a non-nil delegate that implements this method.
 */

#pragma mark - 进入ibeacon时调用
- (void)locationManager:(CLLocationManager *)manager
         didEnterRegion:(CLRegion *)region{
    NSLog(@"didEnterRegion");
}



#pragma mark - 进入buttonClick
-(void)buttonClick:(UIButton *) button{
    if (button.tag == 100) {
        //isopenMenuBtn打开关闭按钮
        isopenMenuBtn = !isopenMenuBtn;
        if (isopenMenuBtn) {
            
            menuBtn.userInteractionEnabled = NO;
            for (UIButton *singbutton in buttonArray) {
//              [UIView animateWithDuration:.5 animations:^{
//                  singbutton.frame = CGRectMake(20,(KScreenHeight - 60), 40, 40);
//              }];
                [UIView animateWithDuration:.5 animations:^{
                    singbutton.frame = CGRectMake(20,(KScreenHeight - 60), 40, 40);

                } completion:^(BOOL finished) {
                    singbutton.hidden = YES;
                    menuBtn.userInteractionEnabled = YES;
                }];
            }
            
        }else{
            
              menuBtn.userInteractionEnabled = NO;
            for (int i=0;i<buttonArray.count ;i++) {
                
                [UIView animateWithDuration:.5 animations:^{
                    //NSLog(@"buttong===%@",NSStringFromCGRect(singbutton.frame));
                    UIButton * singbuttong = buttonArray[i];
                    singbuttong.hidden = NO;
                    singbuttong.frame = CGRectMake(20,(KScreenHeight - 60)-40*(i+1) - 10*(i+1), 40, 40);
                    
                }completion:^(BOOL finished) {
                    menuBtn.userInteractionEnabled = YES;
                }];
            }
        }
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    
    return 7;
}

// Row display. Implementers should *always* try to reuse cells by setting each cell's reuseIdentifier and querying for available reusable cells with dequeueReusableCellWithIdentifier:
// Cell gets various attributes set automatically based on table (separators) and data source (accessory views, editing controls)

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString  * cells = @"cell1";
    
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cells];
    
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cells];
    }
    
     cell.textLabel.text  = @"测试";
     cell.detailTextLabel.text  = @"详情";
    
    return cell;
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    
    [_eyeView animationtionWith:scrollView.contentOffset.y];
    
    NSLog(@"scrollViewDidScroll==%@",NSStringFromCGPoint(scrollView.contentOffset));
    
}

@end
