//
//  main.m
//  enums
//
//  Created by Rene Fürst on 12/11/14.
//  Copyright (c) 2014 Rene Fürst. All rights reserved.
//

typedef enum
{
    haAkazie,
    haBuche,
    haEiche,
    haKirsche,
    haPinie

} Holzart;


typedef struct{
    int hoehe;
    int laenge;
    int breite;
    Holzart holzart;
} Tisch;

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {

        Tisch meinTisch;
        
        meinTisch.breite = 29;
        meinTisch.hoehe = 30;
        meinTisch.laenge = 100;
        meinTisch.holzart = haKirsche;
        
        NSLog(@"Die Holzart des Tische ist %d", meinTisch.holzart);
    
    }
    return 0;
}
