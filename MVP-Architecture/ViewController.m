//
//  ViewController.m
//  MVP-Architecture
//
//  Created by bang on 2022/4/15.
//

#import "ViewController.h"
#import "MVP/MVPListViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = UIColor.yellowColor;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    MVPListViewController *lvc = [[MVPListViewController alloc] init];
    UINavigationController *nvc = [[UINavigationController alloc] initWithRootViewController:lvc];
    nvc.modalPresentationStyle = UIModalPresentationFullScreen;
    [self presentViewController:nvc animated:YES completion:nil];
}


@end
