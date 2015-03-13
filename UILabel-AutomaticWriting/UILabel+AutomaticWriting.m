//
//  UILabel+AutomaticWriting.m
//  UILabel-AutomaticWriting
//
//  Created by alexruperez on 10/3/15.
//  Copyright (c) 2015 alexruperez. All rights reserved.
//

#import "UILabel+AutomaticWriting.h"
#import <objc/runtime.h>


NSTimeInterval const UILabelAWDefaultDuration = 0.4f;

unichar const UILabelAWDefaultCharacter = 124;

static char kAutomaticWritingOperationQueueKey;


@implementation UILabel (AutomaticWriting)

@dynamic automaticWritingOperationQueue;

#pragma mark - Public Methods

- (void)setAutomaticWritingOperationQueue:(NSOperationQueue *)automaticWritingOperationQueue
{
    objc_setAssociatedObject(self, &kAutomaticWritingOperationQueueKey, automaticWritingOperationQueue, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (NSOperationQueue *)automaticWritingOperationQueue
{
    return objc_getAssociatedObject(self, &kAutomaticWritingOperationQueueKey);
}

- (void)setTextWithAutomaticWritingAnimation:(NSString *)text
{
    [self setText:text automaticWritingAnimationWithBlinkingMode:UILabelAWBlinkingModeNone];
}

- (void)setText:(NSString *)text automaticWritingAnimationWithBlinkingMode:(UILabelAWBlinkingMode)blinkingMode
{
    [self setText:text automaticWritingAnimationWithDuration:UILabelAWDefaultDuration blinkingMode:blinkingMode];
}

- (void)setText:(NSString *)text automaticWritingAnimationWithDuration:(NSTimeInterval)duration
{
    [self setText:text automaticWritingAnimationWithDuration:duration blinkingMode:UILabelAWBlinkingModeNone];
}

- (void)setText:(NSString *)text automaticWritingAnimationWithDuration:(NSTimeInterval)duration blinkingMode:(UILabelAWBlinkingMode)blinkingMode
{
    [self setText:text automaticWritingAnimationWithDuration:duration blinkingMode:blinkingMode blinkingCharacter:UILabelAWDefaultCharacter];
}

- (void)setText:(NSString *)text automaticWritingAnimationWithDuration:(NSTimeInterval)duration blinkingMode:(UILabelAWBlinkingMode)blinkingMode blinkingCharacter:(unichar)blinkingCharacter
{
    [self setText:text automaticWritingAnimationWithDuration:duration blinkingMode:blinkingMode blinkingCharacter:blinkingCharacter completion:nil];
}

- (void)setText:(NSString *)text automaticWritingAnimationWithDuration:(NSTimeInterval)duration blinkingMode:(UILabelAWBlinkingMode)blinkingMode blinkingCharacter:(unichar)blinkingCharacter completion:(void (^)(void))completion
{
    self.automaticWritingOperationQueue.suspended = YES;
    
    self.text = @"";
    
    NSMutableString *automaticWritingText = NSMutableString.new;
    
    if (text)
    {
        [automaticWritingText appendString:text];
    }
    
    self.automaticWritingOperationQueue = NSOperationQueue.new;
    self.automaticWritingOperationQueue.name = @"Automatic Writing Operation Queue";
    self.automaticWritingOperationQueue.maxConcurrentOperationCount = 1;
    
    [self.automaticWritingOperationQueue addOperationWithBlock:^{
        [self automaticWriting:automaticWritingText duration:duration mode:blinkingMode character:blinkingCharacter completion:completion];
    }];
}

#pragma mark - Private Methods

- (void)automaticWriting:(NSMutableString *)text duration:(NSTimeInterval)duration mode:(UILabelAWBlinkingMode)mode character:(unichar)character completion:(void (^)(void))completion
{
    NSOperationQueue *currentQueue = NSOperationQueue.currentQueue;
    if ((text.length || mode >= UILabelAWBlinkingModeWhenFinish) && !currentQueue.isSuspended)
    {
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(duration * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            if (mode != UILabelAWBlinkingModeNone)
            {
                if ([self isLastCharacter:character])
                {
                    [self deleteLastCharacter];
                }
                else if (mode != UILabelAWBlinkingModeWhenFinish || !text.length)
                {
                    [text insertString:[self stringWithCharacter:character] atIndex:0];
                }
            }
            
            if (text.length)
            {
                [self appendCharacter:[text characterAtIndex:0]];
                [text deleteCharactersInRange:NSMakeRange(0, 1)];
                if ((![self isLastCharacter:character] && mode == UILabelAWBlinkingModeWhenFinishShowing) || (!text.length && mode == UILabelAWBlinkingModeUntilFinishKeeping))
                {
                    [self appendCharacter:character];
                }
            }
            
            if (!currentQueue.isSuspended)
            {
                [currentQueue addOperationWithBlock:^{
                    [self automaticWriting:text duration:duration mode:mode character:character completion:completion];
                }];
            }
            else if (completion)
            {
                completion();
            }
        });
    }
    else if (completion)
    {
        completion();
    }
}

- (NSString *)stringWithCharacter:(unichar)character
{
    return [NSString stringWithFormat:@"%C", character];
}

- (NSString *)stringWithCharacters:(NSArray *)characters
{
    NSMutableString *string = NSMutableString.new;
    
    for (NSNumber *character in characters)
    {
        [string appendFormat:@"%C", character.unsignedShortValue];
    }
    
    return string.copy;
}

- (void)appendCharacter:(unichar)character
{
    self.text = [self.text stringByAppendingString:[self stringWithCharacter:character]];
}

- (void)appendCharacters:(NSArray *)characters
{
    self.text = [self.text stringByAppendingString:[self stringWithCharacters:characters]];
}

- (BOOL)isLastCharacter:(unichar)character
{
    if (self.text.length)
    {
        return [self.text characterAtIndex:self.text.length-1] == character;
    }
    return NO;
}

- (BOOL)deleteLastCharacter
{
    if (self.text.length)
    {
        self.text = [self.text substringToIndex:self.text.length-1];
        return YES;
    }
    return NO;
}

@end
