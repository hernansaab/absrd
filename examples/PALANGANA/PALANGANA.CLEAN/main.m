//
//  main.m
//  palangana
//
//  Created by hernan saab on 7/24/12.
//  Copyright (c) 2012 self. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "testAbsrd.h"
int main(int argc, const char * argv[])
{
    
    @autoreleasepool {
        
        // insert code here...
        testAbsrd * delegate = [[testAbsrd alloc] init];
        NSApplication * application = [NSApplication sharedApplication];
        [application setDelegate:delegate];
        [NSApp run];
        
    }
    return 0;
}

