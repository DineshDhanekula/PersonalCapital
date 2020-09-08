//
//  ViewController.m
//  PersonalCapital
//
//  Created by Dinesh Kumar Dhanekula on 9/3/20.
//  Copyright © 2020 Dinesh Kumar Dhanekula. All rights reserved.
//

#import "ViewController.h"
#import "PersonalCapitalProfile.h"
#import "PersonalCollectionViewCell.h"
#import "PersoalHeaderCollectionViewCell.h"
#import "DetailWebViewController.h"
#import "PreviourArticulesHeaderView.h"
#import "PersonalCapitalDataParser.h"
#import "PersonalCapitalServices.h"
#import "NSDate+DateFormatter.h"
#import "NSString+EncodeHtmlText.h"

@interface ViewController ()<UICollectionViewDataSource,UICollectionViewDelegateFlowLayout,UICollectionViewDelegate>
@property (strong,nonatomic) PersonalCapitalProfile* profileinfo;
@property (strong,nonatomic) UICollectionView *collectionView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _profileinfo = [PersonalCapitalProfile new];
    [self initialSetUp];
}

- (void)initialSetUp {
    [self createCollectionView];
    [self getData];
}

- (void) setUpNavigationBar {
    self.view.backgroundColor = UIColor.whiteColor;
    self.title = _profileinfo.title;
    UIBarButtonItem *button = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemRefresh target:self action:@selector(refresh:)];
    self.navigationItem.rightBarButtonItem = button;
}

- (void) refresh:(id)sender {
    [self getData];
}

- (void)createCollectionView {
    UICollectionViewFlowLayout *layout=[[UICollectionViewFlowLayout alloc] init];
    layout.sectionInset = UIEdgeInsetsMake(0, 10, 0, 10);
    layout.minimumLineSpacing = 10;
    self.collectionView = [[UICollectionView alloc]initWithFrame:self.view.bounds collectionViewLayout:layout];
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    [_collectionView registerClass:[PersoalHeaderCollectionViewCell class] forCellWithReuseIdentifier:cellIdentifierone];
    [_collectionView registerClass:[PersonalCollectionViewCell class] forCellWithReuseIdentifier:cellIdentifiertwo];
    [self.collectionView registerClass:[PreviourArticulesHeaderView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:header];
    [self.collectionView setTranslatesAutoresizingMaskIntoConstraints:NO];
    [_collectionView setBackgroundColor:[UIColor whiteColor]];
    self.collectionView.allowsSelection = true;
    [self.view addSubview:self.collectionView];
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 2;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    if (section == 0) {
        return 1;
    }
    return _profileinfo.personalCapitalitems.count-1;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    NSInteger indexValue = indexPath.row;
    if (indexPath.section == 0) {
        PersoalHeaderCollectionViewCell *cell=
        [collectionView dequeueReusableCellWithReuseIdentifier:cellIdentifierone forIndexPath:indexPath];
        cell.cellInfo.text = _profileinfo.personalCapitalitems[indexValue].title ;
        NSString * formattedDate = [NSDate formetDate:_profileinfo.personalCapitalitems[indexValue].date_published];
        NSString *createSubText = [NSString stringWithFormat:@"%@ - %@",formattedDate ,_profileinfo.personalCapitalitems[indexValue].summary];
        cell.subInfo.text = createSubText;
        cell.ImageUrl = self.profileinfo.personalCapitalitems[indexValue].featured_image;
        return cell;
    }
    PersonalCollectionViewCell *cell =
    [collectionView dequeueReusableCellWithReuseIdentifier:cellIdentifiertwo forIndexPath:indexPath];
    cell.cellInfo.text = _profileinfo.personalCapitalitems[indexValue+1].title ;
    cell.ImageUrl = self.profileinfo.personalCapitalitems[indexValue+1].featured_image;
    return cell;
}


- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    NSInteger indexValue = indexPath.row;
    DetailWebViewController *webView = [[DetailWebViewController alloc]init];
    if (indexPath.section == 0) {
        webView.title = self.profileinfo.personalCapitalitems[indexValue].title;
        webView.htmlContentText = self.profileinfo.personalCapitalitems[indexValue].content_html;
    } else   if (indexPath.section == 1) {
        webView.title = self.profileinfo.personalCapitalitems[indexValue + 1].title;
        webView.htmlContentText = self.profileinfo.personalCapitalitems[indexValue].content_html;
    }
    [self.navigationController pushViewController:webView animated:YES];
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        return CGSizeMake(self.view.frame.size.width, self.view.frame.size.width);
    }
    if (UIDevice.currentDevice.userInterfaceIdiom == UIUserInterfaceIdiomPad) {
        return CGSizeMake(self.view.frame.size.width / 3 - 15, self.view.frame.size.width / 3);
    } else {
        return CGSizeMake(self.view.frame.size.width / 2 - 15, self.view.frame.size.width / 2);
    }
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath {
    UICollectionReusableView *reusableview = nil;
    if (kind == UICollectionElementKindSectionHeader) {
        PreviourArticulesHeaderView *headerView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:header forIndexPath:indexPath];
        headerView.header.text = personalCapitalCollectionViewHeader;
        reusableview = headerView;
    }
    return  reusableview;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section {
    if (section == 0) {
        return CGSizeZero;
    } else {
        return CGSizeMake(self.collectionView.bounds.size.width, 50);
    }
}

- (void)getData {
    [self.activityIndicator startAnimating];
    self.collectionView.hidden = true;
    
    [PersonalCapitalServices getDataFromUrl:personalCapitalSerivceURL completionHandler:^(NSData * _Nonnull data, NSURLResponse * _Nonnull response, NSError * _Nonnull error) {
        NSError *err;
        NSDictionary *jsonData =  [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&err];
        self.profileinfo = [PersonalCapitalDataParser parseDataIntoPersonalCapitalProfile:jsonData];
        dispatch_async(dispatch_get_main_queue(), ^{
            [self assinDataToCollectionView];
        });
        if (err) {
            NSLog(@"Failed to get data");
            return;
        }
    }];
}


- (void) assinDataToCollectionView {
    [self setUpNavigationBar];
    self.collectionView.hidden = false;
    [self.activityIndicator stopAnimating];
    [self.collectionView reloadData];
}

@end
