//
//  ViewController.m
//  CommonSortArithmetic
//
//  Created by zhuzj on 2018/8/16.
//  Copyright © 2018年 zhuzj. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    testBubbleSort();
    testSelectionSort();
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


/*
 1、冒泡排序
 冒泡算法是重复地走访过要排序的数列，一次比较两个元素，如果他们的顺序错误就把他们交换过来。走访数列的工作是重复地进行直到没有再需要交换，也就是说该数列已经排序完成。
 */
#pragma mark -冒泡排序 升序
void testBubbleSort(){
    
    int array[10] = {55, 23, 93, 23, 4, 56, 1, 34, 11, 69};
    
    int num = sizeof(array)/sizeof(int);
    
    for (int i = 0 ; i < num - 1; i++) {
        
        for (int j = 0; j < num -1 - i; j++) {
            
            if (array[j] > array[j + 1]) {
                int temp = array[j];
                array[j] = array[j + 1];
                array[j + 1] = temp;
            }
            
        }
        
    }
    
    printList(array,num);
}
/*
 2、选择排序
 选择排序的工作原理是每一次从待排序的数据元素中选出最小（或最大）的一个元素，存放在序列的起始位置，直到全部待排序的数据元素排完。
 */
#pragma mark -选择排序 升序
void testSelectionSort(){
    
    int array[10] = {55, 23, 93, 23, 4, 56, 1, 34, 11, 69};
    
    int num = sizeof(array)/sizeof(int);
    
    for (int i = 0 ; i < num - 1; i++) {
        
        for (int j = i + 1; j < num; j++) {
            
            if (array[i] > array[j]) {
                int temp = array[i];
                array[i] = array[j];
                array[j] = temp;
            }
            
        }
        
    }
    
    printList(array,num);
}


void printList(int *array,int num){
    
    for (int i = 0; i < num; i++) {
        
        printf("%d", array[i]);
        
        if (i == num - 1) {
            
            printf("\n");
            
        } else {
            
            printf(" ");
        }
    }
}



@end
