#import <Foundation/Foundation.h>

int BinarySearchIterative(NSArray *intArray, int searchInt, int low, int high){
  
  int searchIndex = -1;
  
  while (low<=high){
    
    int mid = 0.5*(low+high);
    int midValue = [intArray[mid] intValue];
    
    if(searchInt == midValue){
      return mid;
    }
    else if(searchInt>midValue){
      low = mid+1;
    }
    else{
      high = mid-1;
    }
  }
  
  return searchIndex;
}

int BinarySearchRecursive(NSArray *intArray, int searchInt, int low, int high){
  
  if(high<low){
    return -1;
  }
  else{
    int mid = 0.5*(high+low);
    int midValue = [intArray[mid] intValue];
  
    if (searchInt == midValue){
      return mid;
    }
    else if (searchInt>midValue){
      return BinarySearchRecursive(intArray, searchInt, mid+1, high);
    }
    else {
      return BinarySearchRecursive(intArray, searchInt, low, mid-1);
    }
  }
  
}


int main(int argc, const char *argv[]){
  @autoreleasepool {
    
    int searchInt = 7;
    NSArray *intArray = @[@8,@2,@5,@1,@9,@7,@14];
    NSArray *sortedArray = [intArray sortedArrayUsingSelector:@selector(compare:)];
    
    int low = 0;
    int high = (int) intArray.count;
    
    //Iterative
    int searchIndexIterative = BinarySearchIterative(sortedArray, searchInt, low, high);
    if (searchIndexIterative==-1){
      NSLog(@"Iterative: search interger %i not found in array.",searchInt);
    }
    else{
      NSLog(@"Iterative: %@",[sortedArray[searchIndexIterative] intValue]==searchInt ? @"PASS":@"FAIL");
    }
    
    //Recursive
    int searchIndexRecursive = BinarySearchRecursive(sortedArray, searchInt, low, high);
    if (searchIndexRecursive==-1){
      NSLog(@"Recursive: search interger %i not found in array.",searchInt);
    }
    else{
      NSLog(@"Recursive: %@",[sortedArray[searchIndexRecursive] intValue]==searchInt ? @"PASS":@"FAIL");
    }
    
  }
  
  return 0;
}


