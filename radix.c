int findbig(int *a, int n){
  
  int i;
  int big = -1;
  
  for(i = 0; i < n; i++){
    if(a[i] > big){
      big = a[i]; 
    }
  }
  return big;
}

void radixSort(int *a, int n){
  int i;
  int tmp[n];
  int digit = 1;
  int big = findbig(a, n);
  while (big / digit > 0){
      int count[10] = { 0 };
      for (i = 0; i < n; i++){
          count[(a[i] / digit) % 10]++;
      }   
      for (i = 1; i < 10; i++){
          count[i] += count[i - 1];
      }
      for (i = n - 1; i >= 0; i--){
          tmp[--count[(a[i] / digit) % 10]] = a[i];
      }
      for (i = 0; i < n; i++){
          a[i] = tmp[i];
      }
      digit *= 10;
   }
}
