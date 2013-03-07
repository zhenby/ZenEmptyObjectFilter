//
//  ViewController.m
//  ZenEmptyObjectFilterDemo
//
//  Created by zhenby on 13-3-7.
//  Copyright (c) 2013年 zhenby. All rights reserved.
//

#import "ViewController.h"
#import "ZenEmptyObjectFilter.h"

@interface ViewController ()

@property(retain, nonatomic) IBOutlet UITextView *textViewBefore;
@property(retain, nonatomic) IBOutlet UITextView *textViewAfter;

@end

@implementation ViewController

@synthesize textViewBefore;
@synthesize textViewAfter;

- (void)dealloc
{
    [textViewBefore release];
    textViewBefore = nil;
    
    [textViewAfter release];
    textViewAfter = nil;
    
    [super dealloc];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    NSDictionary *dict1 = [NSDictionary dictionaryWithObjectsAndKeys:@"", @"1a", [NSNull null], @"2b",nil];
    NSArray *array1 = [NSArray arrayWithObjects:@"aaa", @"", [NSNull null], @"abb", dict1, nil];
    
    // Way one : Filter the whole object
    // 方法一：整个对象的过滤
    NSMutableDictionary *dictWay1Before = [[NSMutableDictionary new] autorelease];
    [dictWay1Before setObject:dict1 forKey:@"dict1"];
    [dictWay1Before setObject:array1 forKey:@"array1"];
    [dictWay1Before setObject:@"string1" forKey:@"string1"];
    [dictWay1Before setObject:@"" forKey:@"string2"];
    [dictWay1Before setObject:[NSNull null] forKey:@"null"];
    NSDictionary *dictWay1After = [ZenEmptyObjectFilter emptyObjectFilter:dictWay1Before];
    
    // Way two : Fitlter every object that set to Dictionary
    // 方法一：对加到Dictionary的每个对象都进行过滤
    NSMutableDictionary *dictWay2After = [[NSMutableDictionary new] autorelease];
    [ZenEmptyObjectFilter setObject:dict1 forKey:@"dict1" toDictionary:&dictWay2After];
    [ZenEmptyObjectFilter setObject:array1 forKey:@"array1" toDictionary:&dictWay2After];
    [ZenEmptyObjectFilter setObject:@"string1" forKey:@"string1" toDictionary:&dictWay2After];
    [ZenEmptyObjectFilter setObject:@"" forKey:@"string2" toDictionary:&dictWay2After];
    [ZenEmptyObjectFilter setObject:[NSNull null] forKey:@"null" toDictionary:&dictWay2After];
    
    
    self.textViewBefore.text = dictWay1Before.description;
    self.textViewAfter.text = dictWay1After.description;
    
    NSLog(@"before:%@", self.textViewBefore.text);
    NSLog(@"after:%@", self.textViewAfter.text);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
