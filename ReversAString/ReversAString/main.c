//
//  main.c
//  ReversAString
//
//  Created by 张斌 on 2017/2/13.
//  Copyright © 2017年 张斌. All rights reserved.
//

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

void reverse_str(char * ch);
void delete_digit(char * ch);

int main(void)
{
    char c[] = "Can you reverse me?";
    
    printf("original string c: \n%s\n", c);
    reverse_str(c);
    printf("%s\n", c);
    
    char ch[] = "1w2e3r4t5y6u7i8o";
  
    delete_digit(ch);
    
    printf("%s\n", ch);
    
    return 0;
}

void reverse_str(char *ch)  /*使用中间变量*/
{
//    int len;
//    int i;
//    len = (int)strlen(ch)-1;
//    char ctemp;
//    
//    for(i = 0; i < len-i; i++)
//    {
//        ctemp = ch[i];
//        ch[i] = ch[len-i];
//        ch[len-i] = ctemp;
//    }
//    ch[len+1] = 0;
    
    int i;
    int len = (int)strlen(ch) - 1;
    char temp;
    
    for(i = 0 ; i < len - i; i ++){
        temp = ch[i];
        ch[i] = ch[len - i];
        ch[len - i] = temp;
    }
    
    ch[len+1] = 0;
    
}

void delete_digit(char ch[]){
    
    int i,j = 0;
    
    while (ch[i] != '\0') {
        if (ch[i] >= '0' && ch[i] <= '9') {
            i++;
        }else{
            ch[j] = ch[i];
            j++;
            i++;
        }
    }
    
    ch[j] = '\0';
    
    
}


        
