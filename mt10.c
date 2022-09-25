#include<stdio.h>
#include <stddef.h>
#include <stdint.h>
struct ints128{
	uint64_t n1;
	uint64_t n2;
};
char hexss[]={
48,48,48,49,48,50,48,51,48,52,
48,53,48,54,48,55,48,56,48,57,
48,65,48,66,48,67,48,68,48,69,
48,70,49,48,49,49,49,50,49,51,
49,52,49,53,49,54,49,55,49,56,
49,57,49,65,49,66,49,67,49,68,
49,69,49,70,50,48,50,49,50,50,
50,51,50,52,50,53,50,54,50,55,
50,56,50,57,50,65,50,66,50,67,
50,68,50,69,50,70,51,48,51,49,
51,50,51,51,51,52,51,53,51,54,
51,55,51,56,51,57,51,65,51,66,
51,67,51,68,51,69,51,70,52,48,
52,49,52,50,52,51,52,52,52,53,
52,54,52,55,52,56,52,57,52,65,
52,66,52,67,52,68,52,69,52,70,
53,48,53,49,53,50,53,51,53,52,
53,53,53,54,53,55,53,56,53,57,
53,65,53,66,53,67,53,68,53,69,
53,70,54,48,54,49,54,50,54,51,
54,52,54,53,54,54,54,55,54,56,
54,57,54,65,54,66,54,67,54,68,
54,69,54,70,55,48,55,49,55,50,
55,51,55,52,55,53,55,54,55,55,
55,56,55,57,55,65,55,66,55,67,
55,68,55,69,55,70,56,48,56,49,
56,50,56,51,56,52,56,53,56,54,
56,55,56,56,56,57,56,65,56,66,
56,67,56,68,56,69,56,70,57,48,
57,49,57,50,57,51,57,52,57,53,
57,54,57,55,57,56,57,57,57,65,
57,66,57,67,57,68,57,69,57,70,
65,48,65,49,65,50,65,51,65,52,
65,53,65,54,65,55,65,56,65,57,
65,65,65,66,65,67,65,68,65,69,
65,70,66,48,66,49,66,50,66,51,
66,52,66,53,66,54,66,55,66,56,
66,57,66,65,66,66,66,67,66,68,
66,69,66,70,67,48,67,49,67,50,
67,51,67,52,67,53,67,54,67,55,
67,56,67,57,67,65,67,66,67,67,
67,68,67,69,67,70,68,48,68,49,
68,50,68,51,68,52,68,53,68,54,
68,55,68,56,68,57,68,65,68,66,
68,67,68,68,68,69,68,70,69,48,
69,49,69,50,69,51,69,52,69,53,
69,54,69,55,69,56,69,57,69,65,
69,66,69,67,69,68,69,69,69,70,
70,48,70,49,70,50,70,51,70,52,
70,53,70,54,70,55,70,56,70,57,
70,65,70,66,70,67,70,68,70,69,
70,70,0};
char hexi128(struct ints128 a,int b,int c){
	uint64_t aaa;
	uint64_t aa;
	uint64_t cc;
	if(c<8){
		cc=c;
		aaa=cc+cc+cc+cc;
		aa=(a.n2>>(56-(aaa+aaa))) & 255;
	}else{
		cc=c-8;
		aaa=cc+cc+cc+cc;
		aa=(a.n1>>(56-(aaa+aaa))) & 255;
	}
	return hexss[(int)aa+aa+b];
}
struct ints128 add128(struct ints128 a,struct ints128 b){
	struct ints128 aa;
	uint64_t aaa=b.n1;
	if(aaa<a.n1)aaa=a.n1;
	aa.n1=a.n1+b.n1;
	aa.n2=a.n2+b.n2;
	if(aa.n1<aaa)aa.n2++;
	return aa;
}
struct ints128 mults128(struct ints128 a,int b){
	struct ints128 aa;
	uint64_t c0=0xffffffffffffffff;
	if(b==0)c0=0;
	aa.n1=a.n1 & c0;
	aa.n2=a.n2 & c0;
	return aa;
	
}
struct ints128 rolls128(struct ints128 a,int b){
		struct ints128 aa;
		aa.n1=a.n1<<b;
		aa.n2=a.n1>>(64-b);
		aa.n2=aa.n2+(a.n2<<b);
		return aa;
}
struct ints128 mult128(struct ints128 a,struct ints128 b){
	int i;
	uint64_t s;
	struct ints128 aa;
	struct ints128 bb;
	s=1;
	aa.n1=0;
	aa.n2=0;
	for(i=0;i<128;i++){
		if(i==64)s=1;
		if(i<64){
			bb=mults128(a,b.n1 & s);
			bb=rolls128(bb,i);
			aa=add128(aa,bb);
		}else{
			bb=mults128(a,b.n2 & s);
			bb=rolls128(bb,i-64);
			aa=add128(aa,bb);
		}
		s=s<<1;
	}

	return aa;
} 
int main(){
	struct ints128 n;
	struct ints128 n2;
	int nn;
	int nnn;
	int nnnn;
	n.n1=0x1;
	n.n2=0x0;
	n2.n1=10;
	n2.n2=0x0;
	puts("\ec\e[42;30m;");
	for(nnnn=0;nnnn<38;nnnn++){
		printf("0x");
		for(nnn=0;nnn<16;nnn++){
			for(nn=0;nn<2;nn++){
				putc(hexi128(n,nn,nnn),stdout);
			}
		}
		puts("");
		n=mult128(n,n2);
	}
	return 0;
}
