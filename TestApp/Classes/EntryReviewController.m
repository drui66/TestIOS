//
//  EntryReviewController.m
//  TestApp
//
//  Created by 邓竺芮 on 2025/2/13.
//

#import "EntryReviewController.h"
#import <Masonry.h>

@interface EntryReviewController ()

@property (nonatomic, strong) UIButton *rejectButton;
@property (nonatomic, strong) UIButton *approveButton;

@property (nonatomic, strong) UIScrollView *scrollView;
@property (nonatomic, strong) UIImageView *avatarImageView;
@property (nonatomic, strong) UILabel *nameLabel;
@property (nonatomic, strong) UILabel *personTypeLabel;
@property (nonatomic, strong) UILabel *genderLabel;
@property (nonatomic, strong) UILabel *idCardLabel;
@property (nonatomic, strong) UILabel *addressLabel;

@property (nonatomic, strong) UILabel *groupLabel;
@property (nonatomic, strong) UIButton *publicButton;
@property (nonatomic, strong) UITextField *unitTextField;
@property (nonatomic, strong) UITextField *phoneTextField;

@property (nonatomic, strong) UIButton *region1Button;
@property (nonatomic, strong) UIButton *region2Button;
@property (nonatomic, strong) UIButton *region3Button;

@property (nonatomic, strong) UIButton *teamLeadButton;
@property (nonatomic, strong) UIButton *educationButton;
@property (nonatomic, strong) UIButton *insuranceButton;

@end

@implementation EntryReviewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 设置背景色
    self.view.backgroundColor = [UIColor whiteColor];
    [self setupViews];
}

- (void)setupViews
{
    // 创建底部按钮
    self.rejectButton = [UIButton buttonWithType:UIButtonTypeSystem];
    [self.rejectButton setTitle:@"驳回" forState:UIControlStateNormal];
    self.rejectButton.backgroundColor = [UIColor redColor];
    self.rejectButton.layer.cornerRadius = 5;
    [self.rejectButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self.rejectButton addTarget:self action:@selector(rejectTapped) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.rejectButton];
    [self.rejectButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view).offset(20);
        make.bottom.equalTo(self.view).offset(-80);
        make.height.equalTo(@40);
    }];
    
    self.approveButton = [UIButton buttonWithType:UIButtonTypeSystem];
    [self.approveButton setTitle:@"通过" forState:UIControlStateNormal];
    self.approveButton.backgroundColor = [UIColor greenColor];
    self.approveButton.layer.cornerRadius = 5;
    [self.approveButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self.approveButton addTarget:self action:@selector(approveTapped) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.approveButton];
    [self.approveButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.view).offset(-20);
        make.left.equalTo(self.rejectButton.mas_right).offset(20);
        make.height.width.bottom.equalTo(self.rejectButton);
        make.centerY.equalTo(self.rejectButton);
    }];
    
    // Setup Scroll View
    self.scrollView = [[UIScrollView alloc] init];
    [self.view addSubview:self.scrollView];
    [self.scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.equalTo(self.view);
        make.bottom.equalTo(self.rejectButton.mas_top).offset(-20);
    }];
    
    [self setupInfo];
    [self setupReadRowWithText:@"第一行数据" index:0];
    [self setupReadRowWithText:@"第二行数据" index:1];
    self.groupLabel = [self setupPickerRowWithTitle:@"数据" action:@selector(groupTapped) index:2];
    self.phoneTextField = [self setupInputRowWithTitle:@"手机号" placeholder:@"请输入手机号" index:3];
    
//    self.publicButton = [UIButton buttonWithType:UIButtonTypeSystem];
//    [self.publicButton setTitle:@"公众" forState:UIControlStateNormal];
//    self.publicButton.frame = CGRectMake(140, 40, 100, 40);
//    self.publicButton.layer.cornerRadius = 5;
//    self.publicButton.layer.borderWidth = 1;
//    self.publicButton.layer.borderColor = [UIColor lightGrayColor].CGColor;
//    [self.publicButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
//    [self.publicButton addTarget:self action:@selector(publicTapped) forControlEvents:UIControlEventTouchUpInside];
//    [self.scrollView addSubview:self.publicButton];
//    
//    // 创建“单位”和“手机号”输入框
//    UILabel *unitLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, 100, 60, 40)];
//    unitLabel.text = @"单位";
//    [self.scrollView addSubview:unitLabel];
//    
//    self.unitTextField = [[UITextField alloc] initWithFrame:CGRectMake(90, 100, 250, 40)];
//    self.unitTextField.borderStyle = UITextBorderStyleRoundedRect;
//    self.unitTextField.layer.borderWidth = 1;
//    self.unitTextField.layer.borderColor = [UIColor lightGrayColor].CGColor;
//    self.unitTextField.placeholder = @"请输入单位";
//    [self.scrollView addSubview:self.unitTextField];
//    
//    UILabel *phoneLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, 160, 60, 40)];
//    phoneLabel.text = @"手机号";
//    [self.scrollView addSubview:phoneLabel];
//    
//    self.phoneTextField = [[UITextField alloc] initWithFrame:CGRectMake(90, 160, 250, 40)];
//    self.phoneTextField.borderStyle = UITextBorderStyleRoundedRect;
//    self.phoneTextField.layer.borderWidth = 1;
//    self.phoneTextField.layer.borderColor = [UIColor lightGrayColor].CGColor;
//    self.phoneTextField.placeholder = @"请输入手机号";
//    [self.scrollView addSubview:self.phoneTextField];
//    
//    // 创建“权限分区”按钮
//    UILabel *regionLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, 220, 100, 40)];
//    regionLabel.text = @"权限分区";
//    [self.scrollView addSubview:regionLabel];
//    
//    self.region1Button = [UIButton buttonWithType:UIButtonTypeSystem];
//    [self.region1Button setTitle:@"施工作区" forState:UIControlStateNormal];
//    self.region1Button.frame = CGRectMake(20, 260, 100, 40);
//    self.region1Button.layer.cornerRadius = 5;
//    self.region1Button.layer.borderWidth = 1;
//    self.region1Button.layer.borderColor = [UIColor lightGrayColor].CGColor;
//    [self.region1Button addTarget:self action:@selector(region1Tapped) forControlEvents:UIControlEventTouchUpInside];
//    [self.scrollView addSubview:self.region1Button];
//    
//    self.region2Button = [UIButton buttonWithType:UIButtonTypeSystem];
//    [self.region2Button setTitle:@"生活区" forState:UIControlStateNormal];
//    self.region2Button.frame = CGRectMake(140, 260, 100, 40);
//    self.region2Button.layer.cornerRadius = 5;
//    self.region2Button.layer.borderWidth = 1;
//    self.region2Button.layer.borderColor = [UIColor lightGrayColor].CGColor;
//    [self.region2Button addTarget:self action:@selector(region2Tapped) forControlEvents:UIControlEventTouchUpInside];
//    [self.scrollView addSubview:self.region2Button];
//    
//    self.region3Button = [UIButton buttonWithType:UIButtonTypeSystem];
//    [self.region3Button setTitle:@"办公区" forState:UIControlStateNormal];
//    self.region3Button.frame = CGRectMake(260, 260, 100, 40);
//    self.region3Button.layer.cornerRadius = 5;
//    self.region3Button.layer.borderWidth = 1;
//    self.region3Button.layer.borderColor = [UIColor lightGrayColor].CGColor;
//    [self.region3Button addTarget:self action:@selector(region3Tapped) forControlEvents:UIControlEventTouchUpInside];
//    [self.scrollView addSubview:self.region3Button];
//    
//    // 创建“班组长”，“三级教育”和“民工保险”按钮
//    self.teamLeadButton = [UIButton buttonWithType:UIButtonTypeSystem];
//    [self.teamLeadButton setTitle:@"班组长" forState:UIControlStateNormal];
//    self.teamLeadButton.frame = CGRectMake(20, 320, 100, 40);
//    self.teamLeadButton.layer.cornerRadius = 5;
//    self.teamLeadButton.layer.borderWidth = 1;
//    self.teamLeadButton.layer.borderColor = [UIColor lightGrayColor].CGColor;
//    [self.teamLeadButton addTarget:self action:@selector(teamLeadTapped) forControlEvents:UIControlEventTouchUpInside];
//    [self.scrollView addSubview:self.teamLeadButton];
//    
//    self.educationButton = [UIButton buttonWithType:UIButtonTypeSystem];
//    [self.educationButton setTitle:@"三级教育" forState:UIControlStateNormal];
//    self.educationButton.frame = CGRectMake(140, 320, 100, 40);
//    self.educationButton.layer.cornerRadius = 5;
//    self.educationButton.layer.borderWidth = 1;
//    self.educationButton.layer.borderColor = [UIColor lightGrayColor].CGColor;
//    [self.educationButton addTarget:self action:@selector(educationTapped) forControlEvents:UIControlEventTouchUpInside];
//    [self.scrollView addSubview:self.educationButton];
//    
//    self.insuranceButton = [UIButton buttonWithType:UIButtonTypeSystem];
//    [self.insuranceButton setTitle:@"民工保险" forState:UIControlStateNormal];
//    self.insuranceButton.frame = CGRectMake(260, 320, 100, 40);
//    self.insuranceButton.layer.cornerRadius = 5;
//    self.insuranceButton.layer.borderWidth = 1;
//    self.insuranceButton.layer.borderColor = [UIColor lightGrayColor].CGColor;
//    [self.insuranceButton addTarget:self action:@selector(insuranceTapped) forControlEvents:UIControlEventTouchUpInside];
//    [self.scrollView addSubview:self.insuranceButton];
    
    // 设置 scroll view 内容大小
    self.scrollView.contentSize = CGSizeMake(self.view.bounds.size.width, 500);
}

- (void)setupInfo
{
    // 头像设置
    self.avatarImageView = [[UIImageView alloc] initWithFrame:CGRectMake(15, 10, 75, 100)];
    self.avatarImageView.layer.cornerRadius = 5;
    self.avatarImageView.layer.masksToBounds = YES;
    self.avatarImageView.image = [UIImage imageNamed:@"avatar_image"];  // 设置头像图片
    [self.scrollView addSubview:self.avatarImageView];
    
    // 姓名
    self.nameLabel = [[UILabel alloc] init];
    self.nameLabel.text = @"吴磊";  // 示例姓名
    self.nameLabel.font = [UIFont boldSystemFontOfSize:18];
    [self.scrollView addSubview:self.nameLabel];
    [self.nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.avatarImageView);
        make.height.equalTo(@20);
        make.left.equalTo(self.avatarImageView.mas_right).offset(10);
    }];
    
    // 人员类型标签
    self.personTypeLabel = [[UILabel alloc] init];
    self.personTypeLabel.text = @"管理员";
    self.personTypeLabel.backgroundColor = [UIColor lightGrayColor];
    self.personTypeLabel.textAlignment = NSTextAlignmentCenter;
    self.personTypeLabel.layer.cornerRadius = 5;
    self.personTypeLabel.layer.masksToBounds = YES;
    self.personTypeLabel.font = [UIFont systemFontOfSize:14];
    [self.scrollView addSubview:self.personTypeLabel];
    [self.personTypeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.nameLabel.mas_right).offset(10);
        make.width.equalTo(@60);
        make.height.equalTo(@20);
        make.centerY.equalTo(self.nameLabel);
    }];
    
    // 性别、民族、出生年月
    self.genderLabel = [[UILabel alloc] init];
    self.genderLabel.text = @"男 汉族 1989-05-23";
    self.genderLabel.font = [UIFont systemFontOfSize:14];
    [self.scrollView addSubview:self.genderLabel];
    [self.genderLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.height.equalTo(self.nameLabel);
        make.top.equalTo(self.nameLabel.mas_bottom).offset(5);
    }];
    
    // 身份证号码
    self.idCardLabel = [[UILabel alloc] init];
    self.idCardLabel.text = @"510823198905243133";
    self.idCardLabel.font = [UIFont systemFontOfSize:14];
    [self.scrollView addSubview:self.idCardLabel];
    [self.idCardLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.height.equalTo(self.genderLabel);
        make.top.equalTo(self.genderLabel.mas_bottom).offset(5);
    }];
    
    // 居住地址
    self.addressLabel = [[UILabel alloc] init];
    self.addressLabel.text = @"四川省剑阁县开封镇健康路4号";
    self.addressLabel.font = [UIFont systemFontOfSize:14];
    [self.scrollView addSubview:self.addressLabel];
    [self.addressLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.height.equalTo(self.idCardLabel);
        make.top.equalTo(self.idCardLabel.mas_bottom).offset(5);
    }];
}

- (void)setupReadRowWithText:(NSString *)text index:(NSInteger)index
{
    UIView *backView = [[UIView alloc] init];
    backView.backgroundColor = [UIColor lightGrayColor];
    backView.layer.cornerRadius = 5;
    backView.layer.masksToBounds = YES;
    [self.scrollView addSubview:backView];
    [backView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.scrollView).offset(15);
        make.right.equalTo(self.scrollView).offset(-15);
        make.height.equalTo(@40);
        make.top.equalTo(self.avatarImageView.mas_bottom).offset(10 + index * 50);
    }];
    
    UILabel *label = [[UILabel alloc] init];
    label.text = text;
    label.font = [UIFont systemFontOfSize:14];
    [backView addSubview:label];
    [label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.equalTo(backView).offset(10);
        make.bottom.right.equalTo(backView).offset(-10);
    }];
}

- (UILabel *)setupPickerRowWithTitle:(NSString *)title action:(SEL)action index:(NSInteger)index
{
    UIView *backView = [[UIView alloc] init];
    backView.layer.cornerRadius = 5;
    backView.layer.masksToBounds = YES;
    backView.layer.borderColor = [UIColor lightGrayColor].CGColor;
    backView.layer.borderWidth = 1;
    [self.scrollView addSubview:backView];
    [backView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.scrollView).offset(15);
        make.right.equalTo(self.scrollView).offset(-15);
        make.height.equalTo(@40);
        make.top.equalTo(self.avatarImageView.mas_bottom).offset(10 + index * 50);
    }];
    
    UILabel *label = [[UILabel alloc] init];
    label.text = title;
    label.font = [UIFont systemFontOfSize:14];
    [backView addSubview:label];
    [label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.equalTo(backView).offset(10);
        make.bottom.equalTo(backView).offset(-10);
        make.width.equalTo(@70);
    }];
    
    UILabel *content = [[UILabel alloc] init];
    content.text = title;
    content.font = [UIFont systemFontOfSize:14];
    [backView addSubview:content];
    [content mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(label.mas_right).offset(10);
        make.right.bottom.equalTo(backView).offset(-10);
        make.centerY.equalTo(backView);
    }];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
    [button addTarget:self action:action forControlEvents:UIControlEventTouchUpInside];
    [backView addSubview:button];
    [button mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.bottom.equalTo(backView);
    }];
    
    return content;
}

- (UITextField *)setupInputRowWithTitle:(NSString *)title placeholder:(NSString *)placeholder index:(NSInteger)index
{
    UIView *backView = [[UIView alloc] init];
    backView.layer.cornerRadius = 5;
    backView.layer.masksToBounds = YES;
    backView.layer.borderColor = [UIColor lightGrayColor].CGColor;
    backView.layer.borderWidth = 1;
    [self.scrollView addSubview:backView];
    [backView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.scrollView).offset(15);
        make.right.equalTo(self.scrollView).offset(-15);
        make.height.equalTo(@40);
        make.top.equalTo(self.avatarImageView.mas_bottom).offset(10 + index * 50);
    }];
    
    UILabel *label = [[UILabel alloc] init];
    label.text = title;
    label.font = [UIFont systemFontOfSize:14];
    [backView addSubview:label];
    [label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.equalTo(backView).offset(10);
        make.bottom.equalTo(backView).offset(-10);
        make.width.equalTo(@70);
    }];
    
    UITextField * textField = [[UITextField alloc] init];
    textField.borderStyle = UITextBorderStyleNone;
    textField.placeholder = placeholder;
    textField.textAlignment = NSTextAlignmentRight;
    [backView addSubview:textField];
    [textField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(label.mas_right).offset(10);
        make.top.right.bottom.equalTo(backView);
    }];
    
    return textField;
}

// 按钮点击方法
- (void)groupTapped {
    NSLog(@"班组 tapped");
}

- (void)publicTapped {
    NSLog(@"公众 tapped");
}

- (void)region1Tapped {
    NSLog(@"施工作区 tapped");
}

- (void)region2Tapped {
    NSLog(@"生活区 tapped");
}

- (void)region3Tapped {
    NSLog(@"办公区 tapped");
}

- (void)teamLeadTapped {
    NSLog(@"班组长 tapped");
}

- (void)educationTapped {
    NSLog(@"三级教育 tapped");
}

- (void)insuranceTapped {
    NSLog(@"民工保险 tapped");
}

- (void)rejectTapped {
    NSLog(@"Reject tapped");
}

- (void)approveTapped {
    NSLog(@"Approve tapped");
}

@end
