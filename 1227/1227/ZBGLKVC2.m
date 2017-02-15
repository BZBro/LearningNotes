//
//  ZBGLKVC2.m
//  1227
//
//  Created by 张斌 on 2016/12/27.
//  Copyright © 2016年 张斌. All rights reserved.
//

#import "ZBGLKVC2.h"
#import <OpenGLES/ES1/gl.h>
@interface ZBGLKVC2 (){
    
    GLfloat * vertexBuffer;
    GLfloat interval;
    
}

@end

@implementation ZBGLKVC2

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    GLKView * view = self.glkView;
    view.backgroundColor = [UIColor clearColor];
    view.context = [[EAGLContext alloc] initWithAPI:kEAGLRenderingAPIOpenGLES1];
    [EAGLContext setCurrentContext:view.context];
    
    
    
    vertexBuffer = (GLfloat*)calloc(sizeof(GLfloat) * 2 * 4, 1);
    memset(vertexBuffer, 0, 2 * 4 * sizeof(GLfloat));
    
    vertexBuffer[0] = 0;
    vertexBuffer[1] = 50;
    
    vertexBuffer[2] = 50;
    vertexBuffer[3] = 75;
    
    vertexBuffer[4] = 100;
    vertexBuffer[5] = 50;
    
    vertexBuffer[6] = 50;
    vertexBuffer[7] = 25;
    
}

- (void)update {
    if (vertexBuffer[4] >= 100) {
        interval = -2.0f;
    } else if (vertexBuffer[4] < 50) {
        interval = 2.0f;
    }
    vertexBuffer[2] += interval;
    vertexBuffer[4] += interval;
}

- (void)glkView:(GLKView *)view drawInRect:(CGRect)rect {
    
    glViewport(0, 0, rect.size.width * 2, rect.size.height * 2);
    glMatrixMode(GL_PROJECTION);
    glLoadIdentity();
    glOrthof(0, 100, 0, 100, -1024, 1024);
    glMatrixMode(GL_MODELVIEW);
    glLoadIdentity();
    
    glEnable(GL_BLEND);
    glDisable(GL_DEPTH_TEST);
    glBlendFunc(GL_SRC_ALPHA, GL_SRC_COLOR);
    
    glEnableClientState(GL_VERTEX_ARRAY);
    glClear(GL_COLOR_BUFFER_BIT);
    glColor4f(1, 0, 0, 1);
    
    glVertexPointer(2, GL_FLOAT, 0, vertexBuffer);
    glDrawArrays(GL_TRIANGLE_FAN, 0, 4);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
