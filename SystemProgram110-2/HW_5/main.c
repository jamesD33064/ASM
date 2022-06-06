#include <stdlib.h>
#include <string.h>
#include <stdio.h>
typedef struct test{
    char CS[10];
    char SN[10];
    int ADR;
    int len;
}test;
int main(int argc, char* argv[]) {
    printf("CS\tSN\tADR\tLEN\n");
    FILE* file[10];
    test list[100];
    int count=0;
    int start = (int)strtol(argv[1], NULL, 16);
    for(int i=2;i<argc;i++){
        file[i]=fopen(argv[i], "r");
        char buf[128];
        char first[128];
        char *p;
        char progname[128];int s;int size;
        for(int y=0;y<10;y++){
            memset(list[y].CS,'\0',10);
            memset(list[y].SN,'\0',10);
            list[y].len=0;
            list[y].ADR=0;
        }
        while(!feof(file[i]) && fgets(first,128,file[i])){
            switch(first[0]){
                case 'H':
                    sscanf(first,"%06s%06x%06x",list[count].CS,&s,&list[count].len);
                    printf("%-06s\t%s\t%06x\n",list[count].CS,"\t",list[count].len);
                    size=list[count].len;
                    count++;
                    break;
                case 'D':
                    sscanf(first,"%06s%06x",list[count].SN,&list[count].ADR);
                    list[count].ADR+=start;
                    p = strtok(list[count].SN, "D");
                    printf("\t%s\t%06x\n",p,list[count].ADR);
                    count++;
                    fscanf(file[i],"%06s%06x",list[count].SN,&list[count].ADR);
                    list[count].ADR+=start;
                    printf("\t%-06s\t%06x\n",list[count].SN,list[count].ADR);
                    count++;
                    break;
                default:
                    break;
            }
        }
        
        start+=size;
    }
}