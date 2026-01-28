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
int main(int argc, char *argv[])
{
	char *path = "a/b/ c";
	char copypath[BUF];
	strncpy(copypath, path, BUF);

	char *s = strchr(copypath, '/');
	// char *s = strrchr(copypath, '/');
	printf("%ld\n", s - copypath );
	printf("%s\n", s);
	return 0;
}