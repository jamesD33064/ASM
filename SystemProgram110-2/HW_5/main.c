#include <stdio.h>
#include <stdlib.h>
#include <string.h>
typedef struct cs{
    char csname[10];
    char symbolname[10];
    int adr;
    int len;
}CS;
int main(int argc, char* argv[]) {
    printf("CS\tSN\tADR\tLEN\n");
    FILE* file[10];
    CS control[100];
    int count=0;
    int start = (int)strtol(argv[1], NULL, 16);
    for(int i=2;i<argc;i++){
        file[i]=fopen(argv[i], "r");
        char buf[128];
        char head;
        char *p;
        char progname[128];int s;int size;
        for(int y=0;y<10;y++){
            memset(control[y].csname,'\0',10);
            memset(control[y].symbolname,'\0',10);
            control[y].len=0;
            control[y].adr=0;
        }
        while(!feof(file[i])&&fscanf(file[i],"%c",&head)!=0){
            switch(head){
            case 'H':
                fscanf(file[i],"%06s%06x%06x",control[count].csname,&s,&control[count].len);
                printf("%-06s\t%06s\t%06s\t%06x\n",control[count].csname,"      ","      ",control[count].len);
                size=control[count].len;
                count++;
            case 'D':
                fscanf(file[i],"%06s%06x",control[count].symbolname,&control[count].adr);
                control[count].adr+=start;
                printf("%-06s\t%-06s\t%06x\n","      ",control[count].symbolname,control[count].adr);
                count++;
                fscanf(file[i],"%06s%06x",control[count].symbolname,&control[count].adr);
                control[count].adr+=start;
                printf("%-06s\t%-06s\t%06x\n","      ",control[count].symbolname,control[count].adr);
                count++;
                
            default:;
            }
        }
        
        start+=size;
    }
}