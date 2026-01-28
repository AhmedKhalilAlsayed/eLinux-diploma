#include <stdio.h>
#include <stdlib.h>
#include <fcntl.h>
#include <sys/stat.h>
#include <sys/types.h>
#include <string.h>
#include <errno.h>
#include <libgen.h>

// todo:done safe creating files
// todo: safe creating dir
// todo: safe creating dir with paret

#define FAIL "✗"
#define PASS "✓"

#define BUF 1024
#define MAX_REC_DIRS 10

size_t pathnameToNames(const char *pathname, char *names[MAX_REC_DIRS])
{
	char cpathname[BUF];
	strncpy(cpathname, pathname, BUF);

	size_t nameIdx = 0;
	names[nameIdx] = strtok(cpathname, "/");

	while (names[nameIdx] != NULL)
	{
		nameIdx++;
		names[nameIdx] = strtok(NULL, "/");
	}

	return nameIdx; // length
}

int main(int argc, char *argv[])
{

	char *path = "asd.a/asd";
	char *dirs[MAX_REC_DIRS];

	size_t len = pathnameToNames(path, dirs);
	printf("len: %ld\n", len);

	for (size_t i = 0; i < len; i++)
	{
		printf("%s\n", dirs[i]);
	}

	return 0;
}