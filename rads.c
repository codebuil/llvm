#include<stdio.h>
#include<stdlib.h>
#include<string.h>
#include<time.h>
//clang  -c -o rands.bc -emite-llvm rads.c
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
	printf("\033[42;30m\n");
	if(argc>1)printf("%d\n",rad(atoi(argv[1])));
	return 0;
}
