#include<stdio.h>
#include <stddef.h>
#include <stdint.h>
struct ints256{
	uint64_t n1;
	uint64_t n2;
	uint64_t n3;
	uint64_t n4;
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
char hexi256(struct ints256 a,int b,int c){
	uint64_t aaa;
	uint64_t aa;
	uint64_t cc;
	if(c<8){
		cc=c;
		aaa=cc+cc+cc+cc;
		aa=(a.n4>>(56-(aaa+aaa))) & 255;
	}
	if(c>7 & c<16){
		cc=c-8;
		aaa=cc+cc+cc+cc;
		aa=(a.n3>>(56-(aaa+aaa))) & 255;
	}
	if(c>15 & c<24){
		cc=c-16;
		aaa=cc+cc+cc+cc;
		aa=(a.n2>>(56-(aaa+aaa))) & 255;
	}
	if(c>23){
		cc=c-24;
		aaa=cc+cc+cc+cc;
		aa=(a.n1>>(56-(aaa+aaa))) & 255;
	}


	return hexss[(int)aa+aa+b];
}
struct ints256 add256(struct ints256 a,struct ints256 b){
	struct ints256 aa;
	uint64_t aaa=b.n1;
	uint64_t aaa2=b.n2;
	uint64_t aaa3=b.n3;
	uint64_t aaa4=b.n4;
	aa.n1=0;
	aa.n2=0;
	aa.n3=0;
	aa.n4=0;
	if(aaa<a.n1)aaa=a.n1;
	if(aaa2<a.n2)aaa2=a.n2;
	if(aaa3<a.n3)aaa3=a.n3;	
	if(aaa4<a.n3)aaa4=a.n4;	
	aa.n1=a.n1+b.n1;
	aa.n2=a.n2+b.n2;
	if(aa.n1<aaa)aa.n2++;
	aa.n3=a.n3+b.n3;
	if(aa.n2<aaa2)aa.n3++;
	aa.n4=a.n4+b.n4;
	if(aa.n3<aaa3)aa.n4++;
	return aa;
} 
struct ints256 mults256(struct ints256 a,int b){
	struct ints256 aa;
	uint64_t c0=0xffffffffffffffff;
	if(b==0)c0=0;
	aa.n1=a.n1 & c0;
	aa.n2=a.n2 & c0;
	aa.n3=a.n3 & c0;
	aa.n4=a.n4 & c0;
	return aa;
	
}
struct ints256 rolls256(struct ints256 a,int b){
		struct ints256 aa;
		if(b<64){
			aa.n1=a.n1<<b;
			aa.n2=a.n1>>(64-b);
			aa.n2=aa.n2+(a.n2<<b);
			aa.n3=a.n2>>(64-b);
			aa.n3=aa.n3+(a.n3<<b);
			aa.n4=a.n3>>(64-b);
			aa.n4=aa.n4+(a.n4<<b);
		}
		if(b>63 & b < 64*2){
			aa.n1=0;
			aa.n2=a.n1<<(b-64);
			aa.n3=aa.n1>>(64-(b-64));
			aa.n3=aa.n3+(a.n2<<b-64);
			aa.n4=aa.n2>>(64-(b-64));
			aa.n4=aa.n4+(a.n3<<b-64);
		}
		if(b>64*2-1 & b < 64*3){
			aa.n1=0;
			aa.n2=0;
			aa.n3=a.n1<<b-(64*2);
			aa.n4=aa.n1>>(64-(b-64*2));
			aa.n4=aa.n4+(a.n2<<b-(64*2));
		}
		if(b>64*3-1 & b < 64*4){
			aa.n1=0;
			aa.n2=0;
			aa.n3=0;
			aa.n4=a.n1<<b-(64*3);
		}
		return aa;
}
struct ints256 mult256(struct ints256 a,struct ints256 b){
	int i;
	uint64_t s;
	struct ints256 aa;
	struct ints256 bb;
	s=1;
	aa.n1=0;
	aa.n2=0;
	aa.n3=0;
	aa.n4=0;
	for(i=0;i<256;i++){
		if(i==64)s=1;
		if(i==64*2)s=1;
		if(i==64*3)s=1;
		if(i<64){
			bb=mults256(a,b.n1 & s);
			bb=rolls256(bb,i);
			aa=add256(aa,bb);
		}
		if(i>63 & i<64*2){
			bb=mults256(a,b.n2 & s);
			bb=rolls256(bb,i);
			aa=add256(aa,bb);
		}
		if(i>64*2-1 & i<64*3){
			bb=mults256(a,b.n3 & s);
			bb=rolls256(bb,i);
			aa=add256(aa,bb);
		}
		if(i>64*3-1 & i<64*4){
			bb=mults256(a,b.n4 & s);
			bb=rolls256(bb,i);
			aa=add256(aa,bb);
		}

		s=s<<1;
	}

	return aa;
} 

int main(){
	struct ints256 n;
	struct ints256 n1;
	n.n1=0x1;
	n.n2=0x0;
	n.n3=0x0;
	n.n4=0x0;
	n1.n1=0x10;
	n1.n2=0x0;
	n1.n3=0x0;
	n1.n4=0x0;
	int nn;
	int nnn;
	int nnnn;
	puts("\ec\e[42;30m;");
	for(nnnn=0;nnnn<64;nnnn++){
		printf("0x");
		for(nnn=0;nnn<32;nnn++){
			for(nn=0;nn<2;nn++){
				putc(hexi256(n,nn,nnn),stdout);
			}
		}
		n=mult256(n,n1);
		puts("");
	}
	return 0;
}
