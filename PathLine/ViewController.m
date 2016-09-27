//
//  ViewController.m
//  PathLine
//
//  Created by CiHon-IOS2 on 16/9/26.
//  Copyright © 2016年 walkingzmz. All rights reserved.
//

#import "ViewController.h"

#define ScreenWidth [UIScreen mainScreen].bounds.size.width

#define ScreenHeight [UIScreen mainScreen].bounds.size.height

#define startX  ScreenWidth/6.0

#define centerX ScreenWidth/2

#define Y ScreenHeight/2

@interface ViewController ()<CAAnimationDelegate>
{
    CAShapeLayer *shapeLayer;
    CAShapeLayer *shapelayer1;
    CAShapeLayer *shapelayer2;
    CAShapeLayer *shapelayer3;
    CAShapeLayer *shapelayer4;
    CAShapeLayer *shapelayer5;
     CAShapeLayer *shapelayer6;
    UIImageView *imagev;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    imagev = [[UIImageView alloc]initWithFrame:[UIScreen mainScreen].bounds];
    imagev.image = [UIImage imageNamed:@"111"];
    [self.view addSubview:imagev];
    
    
    UIBlurEffect *ffect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleLight];
    UIVisualEffectView *lightView = [[UIVisualEffectView alloc]initWithEffect:ffect];
    lightView.frame = self.view.bounds;
    [self.view addSubview:lightView];
    
    

    [self first];
    
    // Do any additional setup after loading the view, typically from a nib.
}
-(void)first{
    
    UIBezierPath *_path;
    
    CGPoint point1 = CGPointMake(startX, 80);
    CGPoint point2 = CGPointMake(startX+50, 65);
    CGPoint point3 = CGPointMake(startX+25, 55);
    CGPoint point4 = CGPointMake(startX+25, 160);
    //贝塞尔曲线,以下是4个角的位置，相对于_testView1
   // CGPoint point1= CGPointMake(0, Y);
   // CGPoint point2= CGPointMake(startX, Y);
//    CGPoint point3= CGPointMake(startX+5, Y-20);
//    CGPoint point4= CGPointMake(startX+10, Y+20);
//    CGPoint point5= CGPointMake(startX+15, Y);
//    CGPoint point6= CGPointMake(startX+25, Y-50);
//    CGPoint point7= CGPointMake(startX+35, Y+50);
//    CGPoint point8= CGPointMake(startX+40, Y+10);
//    CGPoint point9= CGPointMake(startX+45, Y+10);
//    CGPoint point10= CGPointMake(startX+50, Y-10);
//    CGPoint point11= CGPointMake(startX+55, Y);
//    CGPoint point12= CGPointMake(centerX-2, Y);
//    
//    CGPoint point0= CGPointMake(ScreenWidth, Y);
    
    _path=[UIBezierPath bezierPath];
    [_path moveToPoint:point1];//移动到某个点，也就是起始点
    [_path addLineToPoint:point2];
    [_path addLineToPoint:point3];
    [_path addLineToPoint:point4];
//    [_path addLineToPoint:point5];
//    [_path addLineToPoint:point6];
//    [_path addLineToPoint:point7];
//    [_path addLineToPoint:point8];
//    [_path addLineToPoint:point9];
//    [_path addLineToPoint:point10];
//    [_path addLineToPoint:point11];
//    [_path addLineToPoint:point12];
    
    //绘制曲线
   // [_path addQuadCurveToPoint:CGPointMake(centerX, Y-100) controlPoint:CGPointMake(startX+20, Y-130)];
//    [_path addQuadCurveToPoint:CGPointMake(centerX+2, Y) controlPoint:CGPointMake(centerX+centerX-startX-20, Y-130)];
    
  //  [_path addLineToPoint:point0];
    
    //controlPoint控制点，不等于曲线顶点
    //[_path addQuadCurveToPoint:point1 controlPoint:CGPointMake(150, -30)];
    
    shapeLayer = [CAShapeLayer layer];
    shapeLayer.path=_path.CGPath;
    shapeLayer.fillColor=[UIColor clearColor].CGColor;//填充颜色
    shapeLayer.strokeColor=[UIColor blueColor].CGColor;//边框颜色
    [self.view.layer addSublayer:shapeLayer];
    
    
    //动画
    CABasicAnimation *pathAniamtion = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    // 时间
    pathAniamtion.duration = 1;
    //动画节奏
    pathAniamtion.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    pathAniamtion.fromValue = [NSNumber numberWithFloat:0.0f];
    pathAniamtion.toValue = [NSNumber numberWithFloat:1.0];
//    pathAniamtion.autoreverses = YES; //动画逆方向
    pathAniamtion.delegate = self;
    [shapeLayer addAnimation:pathAniamtion forKey:@"animation1"];
    
    
    [self performSelector:@selector(aaa) withObject:nil afterDelay:1.0];
    
}

-(void)aaa{
 
    UIBezierPath *path1;
    CGPoint point1 = CGPointMake(startX+5, 90);
    
    
     path1=[UIBezierPath bezierPath];
    
    [path1 moveToPoint:point1];
    //前面表示节点的位置
    //下面表示 两个点中间的位置
     [path1 addQuadCurveToPoint:CGPointMake(startX-10, 140) controlPoint:CGPointMake(startX+20, 100)];

    shapelayer1 = [CAShapeLayer layer];
    shapelayer1.path=path1.CGPath;
    
    shapelayer1.fillColor=[UIColor clearColor].CGColor;//填充颜色
    
    shapelayer1.strokeColor=[UIColor blueColor].CGColor;//边框颜色
    
    [self.view.layer addSublayer:shapelayer1];

    //动画
    CABasicAnimation *pathAniamtion = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    // 时间
    pathAniamtion.duration = 1;
    //动画节奏
    pathAniamtion.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    pathAniamtion.fromValue = [NSNumber numberWithFloat:0.0f];
    pathAniamtion.toValue = [NSNumber numberWithFloat:1.0];
    //    pathAniamtion.autoreverses = YES; //动画逆方向
    pathAniamtion.delegate = self;
    [shapelayer1 addAnimation:pathAniamtion forKey:@"animation1"];

    [self performSelector:@selector(bbb) withObject:nil afterDelay:1.0];
}

-(void)bbb{
    
    UIBezierPath *path1;
    CGPoint point1 = CGPointMake(startX+35, 100);
    CGPoint point2 = CGPointMake(startX+45, 120);
    
    path1=[UIBezierPath bezierPath];
    
    [path1 moveToPoint:point1];
    [path1 addLineToPoint:point2];
    
    
    shapelayer2 = [CAShapeLayer layer];
    shapelayer2.path=path1.CGPath;
    
    shapelayer2.fillColor=[UIColor clearColor].CGColor;//填充颜色
    
    shapelayer2.strokeColor=[UIColor blueColor].CGColor;//边框颜色
    
    [self.view.layer addSublayer:shapelayer2];
    
    //动画
    CABasicAnimation *pathAniamtion = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    // 时间
    pathAniamtion.duration = 1;
    //动画节奏
    pathAniamtion.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    pathAniamtion.fromValue = [NSNumber numberWithFloat:0.0f];
    pathAniamtion.toValue = [NSNumber numberWithFloat:1.0];
    //    pathAniamtion.autoreverses = YES; //动画逆方向
    pathAniamtion.delegate = self;
    [shapelayer2 addAnimation:pathAniamtion forKey:@"animation1"];

     [self performSelector:@selector(ccc) withObject:nil afterDelay:1.0];
}




-(void)ccc{
    
    UIBezierPath *path1;
    CGPoint point1 = CGPointMake(startX+50, 95);
    CGPoint point2 = CGPointMake(startX+85, 95);
    
    path1=[UIBezierPath bezierPath];
    
    [path1 moveToPoint:point1];
    [path1 addLineToPoint:point2];
    
    
    shapelayer3 = [CAShapeLayer layer];
    shapelayer3.path=path1.CGPath;
    
    shapelayer3.fillColor=[UIColor clearColor].CGColor;//填充颜色
    
    shapelayer3.strokeColor=[UIColor blueColor].CGColor;//边框颜色
    
    [self.view.layer addSublayer:shapelayer3];
    
    //动画
    CABasicAnimation *pathAniamtion = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    // 时间
    pathAniamtion.duration = 0.5;
    //动画节奏
    pathAniamtion.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    pathAniamtion.fromValue = [NSNumber numberWithFloat:0.0f];
    pathAniamtion.toValue = [NSNumber numberWithFloat:0.5];
    //    pathAniamtion.autoreverses = YES; //动画逆方向
    pathAniamtion.delegate = self;
    [shapelayer3 addAnimation:pathAniamtion forKey:@"animation1"];
     [self performSelector:@selector(ddd) withObject:nil afterDelay:0.5];
}

-(void)ddd{
    
    UIBezierPath *path1;
    CGPoint point1 = CGPointMake(startX+70, 75);
    CGPoint point2 = CGPointMake(startX+70, 130);
    
    path1=[UIBezierPath bezierPath];
    
    [path1 moveToPoint:point1];
    [path1 addLineToPoint:point2];
    
    
    shapelayer4 = [CAShapeLayer layer];
    shapelayer4.path=path1.CGPath;
    
    shapelayer4.fillColor=[UIColor clearColor].CGColor;//填充颜色
    
    shapelayer4.strokeColor=[UIColor blueColor].CGColor;//边框颜色
    
    [self.view.layer addSublayer:shapelayer4];
    
    //动画
    CABasicAnimation *pathAniamtion = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    // 时间
    pathAniamtion.duration = 1;
    //动画节奏
    pathAniamtion.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    pathAniamtion.fromValue = [NSNumber numberWithFloat:0.0f];
    pathAniamtion.toValue = [NSNumber numberWithFloat:0.5];
    //    pathAniamtion.autoreverses = YES; //动画逆方向
    pathAniamtion.delegate = self;
    [shapelayer4 addAnimation:pathAniamtion forKey:@"animation1"];
    [self performSelector:@selector(eee) withObject:nil afterDelay:0.5];
}

-(void)eee{
    
    UIBezierPath *path1;
    CGPoint point1 = CGPointMake(startX+40, 130);
    CGPoint point2 = CGPointMake(startX+100, 130);
    
    path1=[UIBezierPath bezierPath];
    
    [path1 moveToPoint:point1];
    [path1 addLineToPoint:point2];
    
    
    shapelayer5 = [CAShapeLayer layer];
    shapelayer5.path=path1.CGPath;
    
    shapelayer5.fillColor=[UIColor clearColor].CGColor;//填充颜色
    
    shapelayer5.strokeColor=[UIColor blueColor].CGColor;//边框颜色
    
    [self.view.layer addSublayer:shapelayer5];
    
    //动画
    CABasicAnimation *pathAniamtion = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    // 时间
    pathAniamtion.duration = 0.5;
    //动画节奏
    pathAniamtion.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    pathAniamtion.fromValue = [NSNumber numberWithFloat:0.0f];
    pathAniamtion.toValue = [NSNumber numberWithFloat:0.5];
    //    pathAniamtion.autoreverses = YES; //动画逆方向
    pathAniamtion.delegate = self;
    [shapelayer5 addAnimation:pathAniamtion forKey:@"animation1"];
     [self performSelector:@selector(fff) withObject:nil afterDelay:1.0];
}




-(void)fff{
    
    UIBezierPath *path1;

   

    
    path1=[UIBezierPath bezierPath];
    
    
   // [path1 moveToPoint:CGPointMake(30, Y-30)];
    
    // 画圆
    
    [path1 addArcWithCenter:CGPointMake(centerX+15, Y-30) radius:ScreenWidth/2-30 startAngle:M_PI endAngle:M_PI*3 clockwise:YES];
    
    
    
    shapelayer6 = [CAShapeLayer layer];
    shapelayer6.path=path1.CGPath;
    
    shapelayer6.fillColor=[UIColor clearColor].CGColor;//填充颜色
    
    shapelayer6.strokeColor=[UIColor yellowColor].CGColor;//边框颜色
    shapelayer6.lineWidth = 15;
    [self.view.layer addSublayer:shapelayer6];
    
    //动画
    CABasicAnimation *pathAniamtion = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    // 时间
    pathAniamtion.duration = 8;
    //动画节奏
    pathAniamtion.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    pathAniamtion.fromValue = [NSNumber numberWithFloat:0.0f];
    pathAniamtion.toValue = [NSNumber numberWithFloat:8.0];
    //    pathAniamtion.autoreverses = YES; //动画逆方向
    pathAniamtion.delegate = self;
    [shapelayer6 addAnimation:pathAniamtion forKey:@"key"];
    
}





















- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag{
  //  [shapeLayer removeFromSuperlayer];
    
   // [self first];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end











