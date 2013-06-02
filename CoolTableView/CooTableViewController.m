//
//  CooTableViewController.m
//  CoolTableView
//
//  Created by chenzefeng on 13-5-28.
//  Copyright (c) 2013年 com.lingling2012. All rights reserved.
//

#import "CooTableViewController.h"
#import "CustomCellBackground.h"
#import "CustomHeader.h"
#import "CustomFooter.h"

@interface CooTableViewController ()

@property (nonatomic, copy) NSMutableArray *thingsToLearn;
@property (nonatomic, copy) NSMutableArray *thingsLearned;

@end

@implementation CooTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.thingsToLearn = [@[@"Drawing Rects", @"Drawing Gradients", @"Drawing Arcs"] mutableCopy];
    self.thingsLearned = [@[@"Table View", @"UIKit", @"Objective-C"] mutableCopy];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == 0) {
        return self.thingsToLearn.count;
    } else {
        return self.thingsLearned.count;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (![cell.backgroundView isKindOfClass:[CustomCellBackground class]]) {
        CustomCellBackground *backgroundCell = [[CustomCellBackground alloc] init];
        cell.backgroundView = backgroundCell;
    }
    
    if (![cell.selectedBackgroundView isKindOfClass:[CustomCellBackground class]]) {
        CustomCellBackground *selectedBackgroundCell = [[CustomCellBackground alloc] init];
        selectedBackgroundCell.selected = YES;
        cell.selectedBackgroundView = selectedBackgroundCell;
    }
    
    NSString *entry;
    
    if (indexPath.section == 0) {
        entry = self.thingsToLearn[indexPath.row];
        ((CustomCellBackground *)cell.backgroundView).lastCell = (indexPath.row == self.thingsToLearn.count-1);
        ((CustomCellBackground *)cell.selectedBackgroundView).lastCell = (indexPath.row == self.thingsToLearn.count-1);
    } else {
        entry = self.thingsLearned[indexPath.row];
        ((CustomCellBackground *)cell.backgroundView).lastCell = (indexPath.row == self.thingsLearned.count-1);
        ((CustomCellBackground *)cell.selectedBackgroundView).lastCell = (indexPath.row == self.thingsLearned.count-1);
    }
    cell.textLabel.text = entry;
    cell.textLabel.backgroundColor = [UIColor clearColor];
    cell.textLabel.highlightedTextColor = [UIColor blackColor];
    return cell;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    if (section == 0) {
        return @"Things We'll learn";
    } else {
        return @"Things Already Covered";
    }
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    CustomHeader *header = [[CustomHeader alloc] init];
    header.titleLabel.text = [self tableView:tableView titleForHeaderInSection:section];
    
    if (section == 1) {
        header.lightColor = [UIColor colorWithRed:147.0f/255.0f green:105.0f/255.0f blue:216.0f/255.0f alpha:1.0];
        header.darkColor = [UIColor colorWithRed:72.0f/255.0f green:22.0f/255.0f blue:137.0f/255.0f alpha:1.0];
    }
    return header;
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 50;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 15;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    return [[CustomFooter alloc] init];
}

@end
