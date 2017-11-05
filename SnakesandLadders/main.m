//
//  main.m
//  SnakesandLadders
//
//  Created by Daniel Grosman on 2017-11-03.
//  Copyright © 2017 Daniel Grosman. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Player.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // user is prompted to roll to start the game
        NSLog(@"Welcome to Snakes & Ladders!");
        NSLog(@"Please type 'roll' or 'r'");
        
        Player *player1 = [[Player alloc] init];
        
        while (!player1.gameOver) {
            char newTurn[20];
            fgets (newTurn, 120, stdin);
            NSString *userAction = [[NSString alloc] initWithUTF8String:newTurn];
            userAction = [userAction stringByTrimmingCharactersInSet:[NSCharacterSet newlineCharacterSet]];
        
            if ([[userAction lowercaseString] hasPrefix:@"r"]) {
                [player1 rollDice];
            }
            
        }
        
    }
    return 0;
}
