#include<stdio.h>
int *i;
int ii=0;
int count=0;
int rad(int a){
	int t=0;
	if(a==0){
		ii=0;
		i=(int*)&rad;
	}
	if (count>80){
		count=0;
		i=(int*)&rad;
	}
	count++;
	i=i+1;
	t=*i & 255;
	if(a==1)t=t*2;
	return t;
}


int main(){
	int aa=0;
	aa=rad(0);
	printf("\033c\n\033[42;30m\n");
	for(aa=0;aa<80;aa++)printf("%d\n",rad(1));
	return 0;
}
