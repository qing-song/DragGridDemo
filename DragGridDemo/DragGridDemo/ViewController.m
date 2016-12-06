//
//  ViewController.m
//  DragGridDemo
//
//  Created by qingsong on 16/12/1.
//  Copyright © 2016年 qingsong. All rights reserved.
//

#import "ViewController.h"
#import "SDAddItemGridView.h"
#import "SDHomeGridItemModel.h"

@interface ViewController ()

@property (nonatomic, weak) SDAddItemGridView *mainView;
@property (nonatomic, strong) NSMutableArray *dataArray;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    CGRect rect = self.view.bounds;
    rect.origin.y += 40;
    
    SDAddItemGridView *mainView = [[SDAddItemGridView alloc] initWithFrame:rect];
    mainView.showsVerticalScrollIndicator = NO;
    
    NSArray *titleArray = @[@"淘宝",
                            @"生活缴费",
                            @"教育缴费",
                            @"红包",
                            @"物流",
                            @"信用卡",
                            @"转账",
                            @"爱心捐款",
                            @"彩票",
                            @"当面付",
                            @"余额宝",
                            @"AA付款",
                            @"国际汇款",
                            @"淘点点",
                            @"淘宝电影",
                            @"亲密付",
                            @"股市行情",
                            @"汇率换算",
                            @"爱心捐款",
                            @"彩票",
                            @"当面付",
                            @"余额宝",
                            @"AA付款",
                            @"国际汇款",
                            @"淘点点",
                            @"淘宝电影",
                            @"亲密付",
                            @"股市行情",
                            @"汇率换算",
                            ];
    
    NSMutableArray *temp = [NSMutableArray array];
    for (int i = 0; i < titleArray.count; i++) {
        SDHomeGridItemModel *model = [[SDHomeGridItemModel alloc] init];
        model.destinationClass = [ViewController class];
        model.title = titleArray[i];
        [temp addObject:model];
    }
    
//    _dataArray = [temp copy];
    mainView.gridModelsArray = [temp copy];
    
    [self.view addSubview:mainView];
    _mainView = mainView;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
