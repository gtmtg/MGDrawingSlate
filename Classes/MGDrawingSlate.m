//
//  MGDrawingSlate.m
//  MGDrawingSlate
//
//  Created by Mihir Garimella on 6/28/12.
//  Copyright (c) 2012 Mihir Garimella.
//  Licensed for use under the MIT License. See the license file included with this source code or visit http://opensource.org/licenses/MIT for more information.
//

#import "MGDrawingSlate.h"

@implementation MGDrawingSlate

#pragma mark - Initialization

- (id)initWithFrame:(CGRect)frame
{
    
    self = [super initWithFrame:frame];
    if (self) {
        
        //Initialize MGDrawingSlate and set default values
        self.backgroundColor = [UIColor whiteColor];
        drawingPath = [[UIBezierPath alloc]init];
        drawingPath.lineCapStyle = kCGLineCapRound;
        drawingPath.miterLimit = 0;
        drawingPath.lineWidth = 4; //Default line weight - change with changeLineWeightTo: method.
        drawingColor = [UIColor blackColor]; //Default color - change with changeColorTo: method.
        
    }
    return self;
    
}

#pragma mark - Customization Methods

//Call from view controller to change the line weight of the drawing path. Alternatively, just change [drawingSlate]->drawingPath.lineWidth.
- (void)changeLineWeightTo:(NSInteger)weight {
    
    drawingPath.lineWidth = weight;
    
}

//Call from view controller to change the color of the drawing path. Alternatively, just change [drawingSlate]->drawingColor.
- (void)changeColorTo:(UIColor *)color {
    
    drawingColor = color;
    
}

#pragma mark - Drawing Methods

- (void)drawRect:(CGRect)rect
{
    
    [drawingColor setStroke];
    [drawingPath strokeWithBlendMode:kCGBlendModeNormal alpha:1.0];
    
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    
    UITouch *touch = [[touches allObjects] objectAtIndex:0];
    [drawingPath moveToPoint:[touch locationInView:self]];
    
}

-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    
    UITouch *touch = [[touches allObjects] objectAtIndex:0];
    [drawingPath addLineToPoint:[touch locationInView:self]];
    [self setNeedsDisplay];
    
}

@end