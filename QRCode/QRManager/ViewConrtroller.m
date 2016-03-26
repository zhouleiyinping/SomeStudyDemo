//
//  ViewConrtroller.m
//  QRManager
//
//  Created by zhaoguoqing on 16/3/21.
//  Copyright © 2016年 赵国庆. All rights reserved.
//

#import "ViewConrtroller.h"
#import "QRCodeViewController.h"
#import "QRCodeGenerator.h"
#import "QRManager.h"

@interface ViewConrtroller ()
@property (weak, nonatomic) IBOutlet UIImageView *qrimage;

@end

@implementation ViewConrtroller
- (IBAction)create:(id)sender {
  
  
  UIImage *img = [QRManager createQRCodeImageWithMessage:@"1" size:_qrimage.frame.size.width color:[UIColor redColor] topImg:[UIImage imageNamed:@"2"]];
  UIImage *image = [QRCodeGenerator qrImageForString:@"1" imageSize:_qrimage.frame.size.width Topimg:[UIImage imageNamed:@"2"]];
  _qrimage.image = img;
}

- (IBAction)decode:(id)sender {
    QRCodeViewController *vc = [[QRCodeViewController alloc] init];
    vc.decodeBlock = ^(NSString *message, QRCodeViewController *controller){
        NSLog(@"message: %@", message);
        [controller dismissViewControllerAnimated:YES completion:nil];
    };
    vc.cancelBlock = ^(QRCodeViewController *controller){
        [controller dismissViewControllerAnimated:YES completion:nil];
    };
    [self presentViewController:vc animated:YES completion:nil];
  

  
}

@end
