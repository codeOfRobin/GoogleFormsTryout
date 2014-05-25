//
//  ViewController.m
//  GoogleFormsTryout
//
//  Created by Robin Malhotra on 24/05/14.
//  Copyright (c) 2014 Robin's code kitchen. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (retain, nonatomic) NSMutableData *receivedData;
@property (retain, nonatomic) NSURLConnection *connection;
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //if there is a connection going on just cancel it.
    [self.connection cancel];
    
    //initialize new mutable data
    NSMutableData *data = [[NSMutableData alloc] init];
    self.receivedData = data;
    
    //initialize url that is going to be fetched.
    NSURL *url = [NSURL URLWithString:@"https://docs.google.com/forms/d/1yffvViDKq7BHALtC7Om-ceFLWT5hb_cM9sBqndHG3aU/formResponse"];
    
    //initialize a request from url
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[url standardizedURL]];
    
    //set http method
    [request setHTTPMethod:@"POST"];
    //initialize a post data
    NSString *postData = @"entry.154268020=iOS&entry.940479455=vajhcsd&entry.247556683=BJKSVDB";
    //set request content type we MUST set this value.
    
    [request setValue:@"application/x-www-form-urlencoded; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    //set post data of request
    [request setHTTPBody:[postData dataUsingEncoding:NSUTF8StringEncoding]];
    
    //initialize a connection from request
    NSURLConnection *connection = [[NSURLConnection alloc] initWithRequest:request delegate:self];
    self.connection = connection;
    
    //start the connection
    [connection start];

    
    
    
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
