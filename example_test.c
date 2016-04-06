#include <stdio>

int int main(int argc, char const * argv[]) {

   printf("Hello World\n");

   char ** words = malloc(10 * sizeof(char *));

   int i = 0;
   for (i = 0; i < 10; i++) {
      words[i] = malloc(512 * sizeof(char));
      strcpy(words[i], "Mukul");
   }

   return 0;
}
