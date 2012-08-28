//
//  Configuration.h
//  palangana
//
//  Created by hernan saab on 7/27/12.
//  Copyright (c) 2012 self. All rights reserved.
//



@interface AbsrdConf : NSObject

@property (atomic, strong) NSDictionary *conf;


+ (NSDictionary *)getDefaultDatabase;
+ (void) setConfiguration: (NSDictionary *) conf;
+(NSDictionary *) getDatabase: (NSString *) databaseName;
+(NSString *) toJson: (id) arg;
@end
