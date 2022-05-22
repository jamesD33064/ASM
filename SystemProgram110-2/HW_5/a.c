#include <stdio.h>
#include <stdlib.h>

int main(int argc, char* argv[]) {
    FILE* src = fopen(argv[1], "r");
    if(!src) {
        fputs("無法開啟來源檔案", stderr);
        return EXIT_FAILURE;
    }

    FILE* dest = fopen(argv[2], "w");
    if(!dest) {
        fputs("無法建立目標檔案", stderr);
        return EXIT_FAILURE;
    }

    char buf[8];
    while (fgets(buf, sizeof(buf), src) != NULL) { 
        fputs(buf, dest);
    }

    if (ferror(src) || ferror(dest)) {
        fputs("讀寫時發生錯誤", stderr);
    }

    fclose(src);
    fclose(dest);
}