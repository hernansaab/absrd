//
//  ConnectionListener.m
//  palangana
//
//  Created by hernan saab on 7/24/12.
//  Copyright (c) 2012 self. All rights reserved.
//
/*
 {"palangana": {
 "databases"/Users/hernansaab/Projects/PALANGANA.CLEAN/PALANGANA.CLEAN/ConnectionListener.m: {"default": {
 "type": "mysql",
 "port": 3306,
 "host":"182.11.22.111",
 "user": "root",
 "password":"myroot",
 "database": "Proficiency"
 }
 }
 
 }}
 */
#import "testAbsrd.h"


#import "ABSRD/MODELS/AbsrdConf.h"
#import "ABSRD/MODELS/QueryBlockBuster.h"
#import "ABSRD/MODELS/DbManager.h"
#import "ABSRD/MODELS/DbConnector.h"

#define WELCOME_MSG  0
#define ECHO_MSG     1
#define WARNING_MSG  2

#define READ_TIMEOUT 15.0
#define READ_TIMEOUT_EXTENSION 10.0
#define CONFIGURATION_FILE @"/etc/absrd/conf.json"
@implementation testAbsrd

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    
  //  BOOL fileExists = [[NSFileManager defaultManager] fileExistsAtPath:CONFIGURATION_FILE];
  //  if(!fileExists){
 //       NSLog(@"ERROR: Conf file does not exists for conf file%@", CONFIGURATION_FILE);
 //   }
   // NSData *dataJson = [NSData dataWithContentsOfFile:CONFIGURATION_FILE];
   // NSError *error = nil;
//	NSDictionary *conf = (NSDictionary *)[NSJSONSerialization JSONObjectWithData:dataJson options:NSJSONReadingMutableContainers error:&error];
    
    
    
    // you will have to modify the database creds or add/ remove databases
    NSDictionary *conf = @{ @"absrd":
    @{@"databases":@{
            @"default": @{
                @"type": @"mysql" ,
                @"port": @3306,
                @"host":@"localhost",
                @"user": @"root",
                @"password":@"myroot",
                @"database": @"fb"
            },
            @"web1": @{
                @"type": @"mysql",
                @"port": @3306,
                @"host":@"web1",
                @"user": @"root",
                @"password":@"myroot",
                @"database": @"Proficiency"
            }
        }
    }};
   // listenSocket = [[AsyncSocket alloc] initWithDelegate:self];
    [AbsrdConf setConfiguration:conf];

 
    AbsrdQueryBlock block1 = ^(){
        DbConnector *default_conn = [DbManager getConnector:@"default"];;
        NSMutableArray *res = [default_conn query:@"select * from courses limit 1"];
        return res;
    };
    
    AbsrdQueryBlock block2 = ^(){
        DbConnector *web1_conn    = [DbManager getConnector:@"web1"];;
        NSMutableArray *res = [web1_conn query:@"select * from t_contents limit 1"];
        return res;
        //return nil;
    };
    AbsrdQueryBlock block3 = ^(){
        DbConnector *web1_conn    = [DbManager getConnector:@"web1"];;
        NSMutableArray *res = [web1_conn query:@"select * from t_resources limit 1"];
        return res;
        //return nil;
    };
    
    AbsrdQueryBlock block4 = ^(){
        DbConnector *web1_conn    = [DbManager getConnector:@"web1"];;
        NSMutableArray *res = [web1_conn query:@"select * from t_activities limit 1"];
        return res;
        //return nil;
    };
    
    AbsrdQueryBlock block5 = ^(){
        DbConnector *web1_conn    = [DbManager getConnector:@"web1"];;
        NSMutableArray *res = [web1_conn query:@"select * from t_content_thumbnails limit 1"];
        return res;
        //return nil;
    };
    QueryBlockBuster *bb = [[QueryBlockBuster alloc] init];
    [bb addQueryBlock:block1];
    [bb addQueryBlock:block2];
    [bb addQueryBlock:block3];
    [bb addQueryBlock:block4];
    [bb addQueryBlock:block5];
    NSDate *date = [NSDate date];

    double time_passed = [date timeIntervalSince1970];
    NSMutableArray *end;
    double d1 = 1000*([[NSDate date] timeIntervalSince1970] - time_passed);
  
    time_passed = [[NSDate date] timeIntervalSince1970];
    end = [bb multiQuerySequential];
    d1 = 1000*([[NSDate date] timeIntervalSince1970] - time_passed);
    NSLog(@"seq delay is %lf", d1);
    
    time_passed = [[NSDate date] timeIntervalSince1970];
    end = [bb multiQuerySequential];
    d1 = 1000*([[NSDate date] timeIntervalSince1970] - time_passed);
    NSLog(@"seq delay is %lf", d1);
    
    
    
    time_passed = [[NSDate date] timeIntervalSince1970];
    end = [bb multiQueryParallel];
    d1 = 1000*([[NSDate date] timeIntervalSince1970] - time_passed);
    NSLog(@"parallel delay is %lf", d1);
    time_passed = [[NSDate date] timeIntervalSince1970];
    end = [bb multiQueryParallel];
    d1 = 1000*([[NSDate date] timeIntervalSince1970] - time_passed);
    NSLog(@"parallel delay is %lf", d1);
}

@end
