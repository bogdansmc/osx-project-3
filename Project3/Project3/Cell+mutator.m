//
//  Cell+mutator.m
//  Project3
//
//  Created by Bogdan Pankiv on 12/24/12.
//  Copyright (c) 2012 Bogdan Pankiv. All rights reserved.
//

#import "Cell+mutator.h"

@implementation Cell (mutator)
-(void)mutate:(int)x
{
    srandomdev();
    
    // Create temporary array with DNA positions
    NSMutableArray *tarr = [[NSMutableArray alloc] init];
    for (int i=0; i<dnaLength; ++i)
        [tarr addObject: [[NSNumber alloc] initWithInt:i] ];
    
    for (int i=0; i<x*dnaLength/100 && i<dnaLength; ++i) {
        // Select random position in tarr
        unsigned long p1 = random() % [tarr count] ;
        
        // Get real position in DNA array
        int p = [tarr[p1] intValue];
        
        // Calc new value as random offset
        int newval = ([dna[p] intValue] + 1 + random()%3) % 4;
        
        // Set new value
        [dna replaceObjectAtIndex:p withObject:[[NSNumber alloc] initWithInt: newval] ];
        
        // Remove object to avoid double changes in DNA
        [tarr removeObjectAtIndex:p1];
    }
}
@end
