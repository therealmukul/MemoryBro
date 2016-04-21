#include <stdio>

int int main(int argc, char const * argv[]) {

   char ** words = malloc(256 * sizeof(char *));

   int i;
   for (i = 0; i < 10; i++) {
      words[i] = malloc(512 * sizeof(char));
      strpy(words[i], "RPI");
   }

   free(words);

   return 0;
}
