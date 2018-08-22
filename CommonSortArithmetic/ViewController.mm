//
//  ViewController.m
//  CommonSortArithmetic
//
//  Created by zhuzj on 2018/8/16.
//  Copyright © 2018年 zhuzj. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic, strong) NSMutableArray *tempArr;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
//    testBubbleSort();
//    testSelectionSort();
//    [self testQuickSort];
//    testQuickSort();
//    [self testmergeSort];
    
//    testBubbleSort1();
//    testSelectionSort1();
//    testQuicksort1();
    
    testBubbleSort2();
    testSelectionSort2();
    testQuicksort2();
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

#pragma mark -快速排序 升序
void testQuickSort(){
    
    int array[10] = {55, 23, 93, 23, 4, 56, 1, 34, 11, 69};
    int num = sizeof(array)/sizeof(int);
    quickSortArray(array, 0, num - 1);
    
    printList(array,num);
}

void quickSortArray(int *array,int leftIndex,int rightIndex){
    
    if (leftIndex >= rightIndex) {
        return;
    }
    
    int i = leftIndex;
    int j = rightIndex;
    int key = array[i];
    
    //1.确定key（基准数）的位置
    while (i < j) {
        
        //1.1从右向左扫[移动右指针]，找比基准数小的为止 (i位置赋值，j位置空出）
        while (i < j && array[j] >= key) {
            j--;
        }
        array[i] = array[j];
        
        ////1.2从左向右扫[移动左指针]，找比基准数大的为止 （j位置赋值，i位置空出）
        while (i < j && array[i] <= key) {
            i++;
        }
        array[j] = array[i];
    }
    
    //1.3最终确定key（基准数）的位置
    array[i] = key;
    
    /**** 递归排序 ***/
    //排序基准数左边的
    quickSortArray(array, leftIndex, i - 1);
    //排序基准数右边的
    quickSortArray(array, i + 1, rightIndex);
}

/*
 3、快速排序算法
 该方法的基本思想是：
 1．先从数列中取出一个数作为基准数。
 2．分区过程，将比这个数大的数全放到它的右边，小于或等于它的数全放到它的左边。
 3．再对左右区间重复第二步，直到各区间只有一个数。
 */
- (void)testQuickSort{
    
    NSMutableArray *arr = [[NSMutableArray alloc] initWithObjects:@(55), @(23),@(93),@(23),@(4),@(56),@(1),@(34),@(11),@(69),nil];
    
    [self quickSortArray:arr withLeftIndex:0 andRightIndex:arr.count - 1];
    
    NSLog(@"%@",arr);
}
- (void)quickSortArray:(NSMutableArray *)array withLeftIndex:(NSInteger)leftIndex andRightIndex:(NSInteger)rightIndex{
    
    if (leftIndex >= rightIndex) {//如果数组长度为0或1时返回
        return;
    }
    
    NSInteger i = leftIndex;
    NSInteger j = rightIndex;
    //记录比较基准数
    NSInteger key = [array[i] integerValue];
    
    while (i < j) {
        //1.先从右到左
        /**** 首先从右边j开始查找比基准数小的值 ***/
        while (i < j && [array[j] integerValue] >= key) {//如果比基准数大，继续查找
            j--;
        }
        //如果比基准数小，则将查找到的小值调换到i的位置
        array[i] = array[j];
        
        //2.从左到右
        /**** 当在右边查找到一个比基准数小的值时，就从i开始往后找比基准数大的值 ***/
        while (i < j && [array[i] integerValue] <= key) {//如果比基准数小，继续查找
            i++;
        }
         //如果比基准数大，则将查找到的大值调换到j的位置
        array[j] = array[i];
    }
    
    //将基准数放到正确位置
    array[i] = @(key);
    
    /**** 递归排序 ***/
    //排序基准数左边的
    [self quickSortArray:array withLeftIndex:leftIndex andRightIndex:i - 1];
    //排序基准数右边的
    [self quickSortArray:array withLeftIndex:i + 1 andRightIndex:rightIndex];
}

/*
 4、 归并排序
 该方法的基本思想是：
 1.分解：将待排序的问题分解成大小大致相等的两部分。
 2.求解子问题：用归并排序的方法对两个子问题进行递归排序。
 3.合并(merge)：将排好序的有序子序列进行合并，得到符合要求的子序列。
 */
#pragma mark -归并排序 升序
-(NSMutableArray *)tempArr
{
    if (_tempArr == nil) {
        _tempArr = [NSMutableArray array];
    }
    return _tempArr;
}
- (void)testmergeSort{
    
    NSMutableArray *arr = [[NSMutableArray alloc] initWithObjects:@(55), @(23),@(93),@(23),@(4),@(56),@(1),@(34),@(11),@(69),nil];
    [self mergeSortArray:arr lowIndex:0 highIndex:arr.count - 1];
    
    NSLog(@"%@",arr);
}
- (void)mergeSortArray:(NSMutableArray *)array lowIndex:(NSInteger)lowIndex highIndex:(NSInteger)highIndex{
    
    if (lowIndex >= highIndex) {
        return;
    }
    NSInteger midIndex = lowIndex + (highIndex - lowIndex)/2;//向下取整
    [self mergeSortArray:array lowIndex:lowIndex highIndex:midIndex];
    [self mergeSortArray:array lowIndex:midIndex + 1 highIndex:highIndex];//因为向下取整，所以是加1
    [self mergeArray:array lowIndex:lowIndex midIndex:midIndex highIndex:highIndex];
    
}

- (void)mergeArray:(NSMutableArray *)array lowIndex:(NSInteger)lowIndex midIndex:(NSInteger)midIndex highIndex:(NSInteger)highIndex{
    
    for (NSInteger i = lowIndex; i <= highIndex; i++) {
        self.tempArr[i] = array[i];
    }
    
    NSInteger k = lowIndex;
    NSInteger l = midIndex + 1;
    for (NSInteger j = lowIndex; j <= highIndex; j++) {
        if (l > highIndex) {
            array[j] = self.tempArr[k];
            k++;
        }else if(k > midIndex){
            array[j] = self.tempArr[l];
            l++;
        }else if([self.tempArr[k] integerValue] > [self.tempArr[l] integerValue]){
            array[j] = self.tempArr[l];
            l++;
        }else{
            array[j] = self.tempArr[k];
            k++;
        }
        
    }
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


void swap(int &a,int &b){
    int temp = a;
    a = b;
    b = temp;
}

void testBubbleSort1(){
    
    int array[10] = {55, 23, 93, 23, 4, 56, 1, 34, 11, 69};
    
    int num = sizeof(array)/sizeof(int);
    
    for (int i = 0; i < num - 1; i++) {
        for (int j = 0; j < num - 1 - i; j++) {
            if (array[j] > array[j + 1]) {
                swap(array[j], array[j + 1]);
            }
        }
    }
    
    printList(array, num);
}

void testSelectionSort1(){
    
    int array[10] = {55, 23, 93, 23, 4, 56, 1, 34, 11, 69};
    
    int num = sizeof(array)/sizeof(int);
    
    for (int i = 0; i < num - 1; i++) {
        for (int j = i + 1; j < num; j++) {
            if (array[i] > array[j]) {
                swap(array[i], array[j]);
            }
        }
    }
    
    printList(array, num);
}

void testQuicksort1(){
    
    int array[10] = {55, 23, 93, 23, 4, 56, 1, 34, 11, 69};
    int num = sizeof(array)/sizeof(int);
    quickSortArray1(array, 0, num - 1);
    
    printList(array,num);
}

void quickSortArray1(int *array,int leftIndex, int rightIndex){
    
    if (leftIndex >= rightIndex) {
        return;
    }
    
    int i = leftIndex;
    int j = rightIndex;
    int key = array[i];//基准数
    
    while (i < j) {
        
        while (i < j && array[j] >= key) {
            j--;
        }
        array[i] = array[j];
        
        while (i < j && array[i] <= key) {
            i++;
        }
        array[j] = array[i];
        
    }
    
    array[i] = key;
    
    quickSortArray1(array, leftIndex, i - 1);
    quickSortArray1(array, i + 1, rightIndex);
    
}

void testBubbleSort2(){
    
    int array[10] = {55, 23, 93, 23, 4, 56, 1, 34, 11, 69};
    int num = sizeof(array)/sizeof(int);
    
    for (int i = 0; i < num - 1; i++) {
        for (int j = 0; j < num - 1 - i; j++) {
            if (array[j] > array[j + 1]) {
                swap(array[j], array[j + 1]);
            }
            
        }
    }
    printList(array,num);
}

void testSelectionSort2(){
    
    int array[10] = {55, 23, 93, 23, 4, 56, 1, 34, 11, 69};
    int num = sizeof(array)/sizeof(int);
    
    for (int i = 0; i < num - 1; i ++) {
        for (int j = i + 1; j < num; j++) {
            if (array[i] > array[j]) {
                swap(array[i], array[j]);
            }
           
        }
    }
    printList(array,num);
}

void testQuicksort2(){
    
    int array[10] = {55, 23, 93, 23, 4, 56, 1, 34, 11, 69};
    int num = sizeof(array)/sizeof(int);
    quickSortArr2(array, 0, num - 1);
    
    printList(array,num);
}

void quickSortArr2(int *array, int leftIndex, int rightIndex){
    
    if (leftIndex >= rightIndex) {
        return;
    }
    
    int i = leftIndex;
    int j = rightIndex;
    int key = array[leftIndex];
    
    while (i < j) {
        
        while (i < j && array[j] >= key) {
            j--;
        }
        array[i] = array[j];
        
        while (i < j && array[i] <= key) {
            i++;
        }
        array[j] = array[i];
        
    }
    
    array[i] = key;
    
    //左边
    quickSortArr2(array, leftIndex, i - 1);
    //右边
    quickSortArr2(array, i + 1, rightIndex);
}

@end
