//
//  ViewController.m
//  170116
//
//  Created by 张斌 on 2017/1/16.
//  Copyright © 2017年 张斌. All rights reserved.
//

#import "ViewController.h"
#import "Person.h"
#include <objc/runtime.h>
@interface ViewController ()

@property (strong,nonatomic) Person * aPerson;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //用objc_allocateClassPair 创造新的类
    Class newClass = objc_allocateClassPair([UIView class],"zbView", 0);
    //class_addMethod 为类增加新的方法
    class_addMethod(newClass, @selector(loadView), (IMP)loveFuncation, 0);
    //class_addProperty 为类增加属性
    objc_property_attribute_t type = {"T","@\"NSString\""};
    objc_property_attribute_t ownership = {"C",""};// c = copy
    objc_property_attribute_t backingivar = {"V","_privateName"};
    objc_property_attribute_t attrs[] = {type,ownership,backingivar};
    class_addProperty([newClass class], "name", attrs, 3);
    //objc_registerClassPair 注册类
    objc_registerClassPair(newClass);
    
    id newClassObjc = [[newClass alloc] init];
    [newClassObjc performSelector:@selector(loadView)];
    //class_copyIvarList 获取变量名列表
    unsigned int ivarsCount = 0;
    //获取类成员变量列表， ivarCount为类成员数量
    Ivar * ivars = class_copyIvarList([UIView class], &ivarsCount);
    
    for (const Ivar * p = ivars; p < ivars + ivarsCount; ++p) {
        Ivar const ivar = *p;
        // 获取变量名
        NSString * key = [NSString stringWithUTF8String:ivar_getName(ivar)];
        NSLog(@"输出变量名------->%@",key);
    }
    
    //calss_copyMethodList 获取方法名列表
    
    unsigned int count;
    
    Method * methods = class_copyMethodList([UIView class], &count);
    
    for (int i = 0; i < count; i ++) {
        SEL name = method_getName(methods[i]);
        NSString * strName = [NSString stringWithCString:sel_getName(name) encoding:NSUTF8StringEncoding];
        NSLog(@"输出方法名------->%@",strName);
    }
    
    
//    NSLog(@"current method %@,%@,%@",[self class],NSStringFromSelector(_cmd),NSStringFromCGRect(self.view.bounds));
//    _aPerson = [[Person alloc] init];
//    [_aPerson addObserver:self forKeyPath:@"height" options:NSKeyValueObservingOptionNew context:nil];
//    [_aPerson addObserver:self forKeyPath:@"weight" options:NSKeyValueObservingOptionNew context:nil];
    
}

void loveFuncation(id self,SEL _cmd){
    
    NSLog(@"这是一个例子，输出这个方法------->%@",NSStringFromSelector(_cmd));
    NSLog(@"这里输出isa指针指向的对象：使用%p",object_getClass([NSObject class]));
    NSLog(@"这里使用的对象------->%p",[NSObject class]);
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
//    int w = [[_aPerson valueForKey:@"weight"] intValue];
//    [_aPerson setValue:[NSNumber numberWithInt:w + 10] forKey:@"weight"];
    
//    int h = [[_aPerson valueForKey:@"height"] intValue];
//    [_aPerson setValue:[NSNumber numberWithInt:h+5] forKey:@"height"];
//    NSInteger dd = [self maxIn:2 theOther:3];
//    
//    IMP s = [self methodForSelector:@selector(maxIn:theOther:)];
//    
//    NSLog(@"输出------->%s",s);
}


- (NSInteger)maxIn:(NSInteger)a theOther:(NSInteger)b{
    return a > b ? a : b;
}



- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context{
    
    NSLog(@"输出------->%@,%d",NSStringFromSelector(_cmd),__LINE__);
    NSLog(@"输出------->%@",keyPath);
    NSLog(@"输出------->%@",object);
    NSLog(@"输出------->%@",change);
    NSLog(@"输出------->%@",context);
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
