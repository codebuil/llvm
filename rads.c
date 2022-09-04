#include<stdio.h>
#include<stdlib.h>
#include<string.h>
#include<time.h>
//clang  -c -o rands.bc -emite-llvm rads.c
//lli rands.bc
int i[]={511,255};
int rad(int iii){
	int ii=0;
	srand(time(NULL));
	ii=iii & 1;
	ii=i[ii];
	ii=rand() & ii;
	return ii;
	
}

int main(int argc,char *argv[]){
	if(argc>1)printf("%d\n",rad(atoi(argv[1])));
	return 0;
}
