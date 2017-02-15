//
//  ZBGLKVC1.m
//  1227
//
//  Created by 张斌 on 2016/12/27.
//  Copyright © 2016年 张斌. All rights reserved.
//

#import "ZBGLKVC1.h"
#import <OpenGLES/ES1/gl.h>
@interface ZBGLKVC1 (){
    
    GLfloat *vertexBuffer;
    
}

@end

@implementation ZBGLKVC1

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    GLKView * view = self.glkView;
    view.backgroundColor = [UIColor clearColor];
    view.context = [[EAGLContext alloc] initWithAPI:kEAGLRenderingAPIOpenGLES1];
    [EAGLContext setCurrentContext:view.context];
    
    vertexBuffer = (GLfloat *)calloc(sizeof(GLfloat) * 2 *4, 1);
    memset(vertexBuffer, 0, 2 * 4 * sizeof(GLfloat));
    
    vertexBuffer[0] = -0.5;
    vertexBuffer[1] = 0.1;
    vertexBuffer[2] = 0.2;
    vertexBuffer[3] = 0.3;
    vertexBuffer[4] = 0.4;
    vertexBuffer[5] = -0.5;
    vertexBuffer[6] = -0.6;
    vertexBuffer[7] = -0.7;
}

- (void)glkView:(GLKView *)view drawInRect:(CGRect)rect {
    glEnable(GL_BLEND);
    glDisable(GL_DEPTH_TEST);
    glBlendFunc(GL_SRC_ALPHA, GL_SRC_COLOR);
    
    glEnableClientState(GL_VERTEX_ARRAY);
    glClear(GL_COLOR_BUFFER_BIT);
    glColor4f(1, 0, 0, 1);
    
    glVertexPointer(2, GL_FLOAT, 0, vertexBuffer);
    glDrawArrays(GL_TRIANGLE_FAN, 0, 4);
    
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
