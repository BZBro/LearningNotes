//
//  GLKVC.m
//  1227
//
//  Created by 张斌 on 2016/12/27.
//  Copyright © 2016年 张斌. All rights reserved.
//

#import "GLKVC.h"
#import <OpenGLES/ES1/gl.h>
#import <OpenGLES/ES2/gl.h>
#import <OpenGLES/ES1/glext.h>

@interface GLKVC ()<GLKViewDelegate>{
    
    GLuint viewFrameBuffer;
    
    GLuint viewRenderBuffer;
    
}

@end

@implementation GLKVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    GLKView * view = (GLKView *)self.view;
    view.backgroundColor = [UIColor blackColor];
    view.context = [[EAGLContext alloc] initWithAPI:kEAGLRenderingAPIOpenGLES1];
    view.delegate = self;
    [EAGLContext setCurrentContext:view.context];
    
    GLuint  framebuffers;
    
    glGenFramebuffers(1, &framebuffers);

}

- (void)glkView:(GLKView *)view drawInRect:(CGRect)rect{
    
    
    
    const GLfloat triangleVertices[] = {
        0.0, 1.0, -6.0,                    // Triangle top centre
        -1.0, -1.0, -6.0,                  // bottom left
        1.0, -1.0, -6.0                    // bottom right
    };
    
    UIWindow * window =  [[UIApplication sharedApplication] keyWindow];
    
    [EAGLContext setCurrentContext:view.context];
    glBindFramebufferOES(1, viewFrameBuffer);
    glViewport(100, 100, window.bounds.size.width, window.bounds.size.height);
    
    // -- BEGIN NEW CODE
    
    glClear(GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT);
    
    glVertexPointer(3, GL_FLOAT, 0, triangleVertices);
    glEnableClientState(GL_VERTEX_ARRAY);
    glDrawArrays(GL_TRIANGLES, 0, 3);
    
    // -- END NEW CODE
    
    glBindRenderbufferOES(1, viewRenderBuffer);
    [view.context presentRenderbuffer:GL_RENDERBUFFER_OES];
    
    
    
}














///

@end
