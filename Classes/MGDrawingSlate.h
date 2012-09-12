//
//  MGDrawingSlate.h
//  MGDrawingSlate
//
//  Created by gtmtg on 6/28/12.
//  Copyright (c) 2012 gtmtg.
//  Licensed for use under the MIT License. See the license file included with this source code or visit http://opensource.org/licenses/MIT for more information.
//

#import <UIKit/UIKit.h>

@interface MGDrawingSlate : UIView {

    @public UIBezierPath *drawingPath;
    @public UIColor *drawingColor;

}

- (void)changeLineWeightTo:(NSInteger)weight;
- (void)changeColorTo:(UIColor *)color;

@end
