//
//  main.m
//  nsset
//
//  Created by Rene Fürst on 19/11/14.
//  Copyright (c) 2014 Rene Fürst. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {

    //NSSet wie Array nur jedoch keine doppelte einträge, duplikate.
        
        NSNumber *eineZahl = [NSNumber numberWithInt:5];
        NSString *einString = @"Ein String";
        
        NSSet *einSet = [NSSet setWithObjects:eineZahl, einString, nil];
        
        NSLog(@"%@", einSet);
        
        
        NSArray *meinArray = @[@"Eins", @"Zwei", @"Drei",@"Eins", @"Zwei", @"Drei",@"Eins", @"Zwei", @"Drei", @"Vier", @"Fünf"];
        
        //Zeigt mit NSSet keine Duplikate an
        NSSet *setausArray = [NSSet setWithArray:meinArray];
        
        NSLog(@"%@", setausArray);
    
        
        NSArray *arrayausSet = [setausArray allObjects];
        NSLog(@"%@", arrayausSet);
    
        
        //Überprüft ob ein Objekt vorhanden ist, eine der schnellsten methoden.
        NSSet *meinSet = [NSSet setWithObjects: @"Eins", @"Zwei", @"Drei",@"Eins", @"Zwei", @"Drei",@"Eins", @"Zwei", @"Drei", @"Vier", @"Fünf", nil];
        
        if ([meinSet containsObject:@"Vier"]) {
            NSLog(@"Das Objekt ist Vorhanden");
        }
        
        //Legt die Filterbedingung fest
        NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF BEGINSWITH [c] 'Z'"];
        
        //Inizialisiert das Set mit dem Filter
        NSSet *filteredSet = [meinSet filteredSetUsingPredicate:predicate];
        
        NSLog(@"Gefiltertes Set: %@", filteredSet);

        NSSet *vergleichSet = [NSSet setWithObjects:@"Eins", @"Zwei", @"Drei",@"Eins", @"Zwei", @"Drei",@"Eins", @"Zwei", @"Drei", @"Vier", nil];
        
        
        //intersectsSet überprüft ob 2 vergleiche ein identisches Objekt enthalten
        
        if ([vergleichSet intersectsSet:meinSet]) {
            NSLog(@"Ja es gibt Überschneidungen (wenn eine davon zutrifft)");
        }

        if ([vergleichSet isEqualTo:meinSet]) {
            NSLog(@"Die Sets sind  identisch!");
        } else {
            NSLog(@"Die Sets sind nicht identisch!");
        }
    
        // mit "member" wird überprüft ob der Wert vorhanden ist, und holt den Wert gleich raus.

        NSString *memberString = [meinSet member:@"Vier"];
        NSLog(@"%@", memberString);
        
        
        
    }
    return 0;
}
