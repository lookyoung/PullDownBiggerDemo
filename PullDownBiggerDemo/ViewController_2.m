//
//  ViewController_2.m
//  PullDownBiggerDemo
//
//  Created by liuyang on 17/1/16.
//  Copyright © 2017年 me. All rights reserved.
//

#import "ViewController_2.h"
#define k_iconHeight 88
@interface ViewController_2 ()<UITableViewDelegate, UITableViewDataSource>
{
    UIImageView         *_iconImageView;
}
/** tableview */
@property (nonatomic, strong) UITableView *tableView;
@end

@implementation ViewController_2

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationController.title = nil;
    
    [self.view addSubview:self.tableView];
    
    if (_iconImageView == nil) {
        _iconImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, k_iconHeight, k_iconHeight)];
        _iconImageView.center = CGPointMake([UIScreen mainScreen].bounds.size.width * 0.5, self.navigationController.navigationBar.frame.size.height);
        _iconImageView.image = [UIImage imageNamed:@"demo.jpeg"];
        CGFloat corner = 5;
        _iconImageView.layer.cornerRadius = corner;
        _iconImageView.layer.masksToBounds = YES;
        
        self.tableView.contentInset = UIEdgeInsetsMake(k_iconHeight, 0, 0, 0);
        [self.navigationController.navigationBar addSubview:_iconImageView];
    }
}

- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
    }
    return _tableView;
}

#pragma mark - Table view data source
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 20;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"iconList"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"iconList"];
    }
    cell.textLabel.text = @"test2";
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 50;
}

#pragma mark - UIScrollView代理方法
- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    
    //计算往下拖拽的高度
    CGFloat down = scrollView.contentOffset.y + scrollView.contentInset.top;
    
    CGFloat scale = 1.0;
    // 放大
    if (down < 0) {
        scale = MIN(1.0, 1 - down / k_iconHeight);
    } else if (down > 0) { // 缩小
        scale = MAX(0.45, 1 - down / k_iconHeight);
    }
    
    _iconImageView.transform = CGAffineTransformMakeScale(scale, scale);
    
    // 保证缩放后y坐标不变
    CGRect frame = _iconImageView.frame;
    frame.origin.y = -_iconImageView.layer.cornerRadius / 2;
    _iconImageView.frame = frame;
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
