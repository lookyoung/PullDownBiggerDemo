//
//  ViewController_1.m
//  PullDownBiggerDemo
//
//  Created by liuyang on 17/1/16.
//  Copyright © 2017年 me. All rights reserved.
//

#import "ViewController_1.h"

@interface ViewController_1 ()<UITableViewDelegate,UITableViewDataSource>
{
    UIImageView         *_headImgeView;
}
/** tableview */
@property (nonatomic, strong) UITableView *tableView;
@end

#define k_imageViewHeight [UIScreen mainScreen].bounds.size.width

const CGFloat NavHeight = 64;


@implementation ViewController_1

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor yellowColor];
    
    self.navigationItem.title = @"下拉列表";
    [self.view addSubview:self.tableView];
    
    //初始化顶部图片
    if (_headImgeView == nil) {
        _headImgeView = [[UIImageView alloc] initWithFrame:CGRectMake(0, - k_imageViewHeight, k_imageViewHeight, k_imageViewHeight)];
        _headImgeView.image = [UIImage imageNamed:@"demo.jpeg"];
        //设置图片的填充方式
        _headImgeView.contentMode = UIViewContentModeScaleAspectFill;
        //添加图片到tableView顶部(直接addSubView，当下拉的时候会覆盖cell)
        [self.tableView insertSubview:_headImgeView atIndex:0];
    }
    
}

- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.contentInset = UIEdgeInsetsMake(k_imageViewHeight * 0.5 - NavHeight, 0, 0, 0);
    }
    return _tableView;
}

#pragma mark - Table view data source
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *reuseIdentifier = @"cellID";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseIdentifier];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseIdentifier];
    }
    cell.textLabel.text = @"test1";

    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 50;
}

#pragma mark - UIScrollView代理方法
- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    
    //计算往下拖拽的高度
    CGFloat down = -(k_imageViewHeight * 0.5) - scrollView.contentOffset.y;
    //小于0直接返回
    if(down < 0) return;
    CGRect frame = _headImgeView.frame;
    frame.size.height = k_imageViewHeight + down * 1;
    _headImgeView.frame = frame;
    
}

@end
