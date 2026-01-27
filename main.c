#include <fcntl.h>
#include <sys/stat.h>
#include <unistd.h>
#include <stdio.h>
#include <stdlib.h>

#include <errno.h>
#include <string.h>

// task: to cp source file to dest (arg1, arg2)

int main(int argc, char *argv[])
{

	// should argc = 3, 1 cmd, 2 source, 3 dest
	if (argc != 3)
	{
		printf("Should enter source file then the destenation!\n");
		exit(1);
	}

	// the sholud be exist!
	int sourcefd = open(argv[1], O_RDONLY);
	if (sourcefd == -1)
	{
		perror(strerror(errno));
		exit(2);
	}
	else
	{
		printf("Catch the source file...\n");
	}
	// the file shouldn't exist but can be exist!
	// todo: if exist should stop, trachc, overflow
	// todo: permissions
	int desfd = open(argv[2], O_WRONLY | O_CREAT | O_TRUNC | O_SYNC, 0644);
	if (desfd == -1)
	{
		perror(strerror(errno));
		exit(3);
	}
	else
	{
		printf("Catch the dest file...\n");
	}

	// everything is good to cp

#define BUF_SIZE (4096)

	printf("Copying...\n");

	char data[BUF_SIZE];

	ssize_t readbytes;
	ssize_t writebytes;

	while ((readbytes = read(sourcefd, data, BUF_SIZE)) != 0)
	{
		if (readbytes == -1)
		{
			perror(strerror(errno));
			exit(4);
		}

		writebytes = write(desfd, data, readbytes);

		if (writebytes == -1)
		{
			perror(strerror(errno));
			exit(5);
		}
	}

	printf("Done\n");

	close(sourcefd);
	close(desfd);

	return 0;
}