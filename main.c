#include <fcntl.h>
#include <sys/stat.h>
#include <unistd.h>
#include <stdio.h>
#include <stdlib.h>

#include <errno.h>
#include <string.h>

// task: to cp source file to dest (arg1, arg2)

// wrong idea!
// char errorCode =

int main(int argc, char *argv[])
{

	// should argc = 3, 1 cmd, 2 source, 3 dest
	if (argc != 3)
	{
		printf("Should enter: cmd source_file dest_file \n");
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

	// todo:done if exist should stop
	// todo:done if exist should trachc, overflow, append
	int checkdesfd = open(argv[2], O_RDONLY);
	if (checkdesfd == -1)
	{
		// not exist
	}
	else
	{
		printf("There is a destenation file with this name!\n");

		char c;
		printf("Type c to continue, else to exit safely: \n");
		scanf("%c", &c);

		if (c != 'c')
		{
			exit(6);
		}
	}

	int oflag = 0;
	char o;
	printf("Type a to append, t to tranc, o to overwrite: \n");
	scanf("\n%c", &o);
	switch (o)
	{
	case 'a':
		oflag |= O_APPEND;
		break;
	case 't':
		oflag |= O_TRUNC;
		break;
	case 'o':
		oflag |= 0;
		break;

	default:
		break;
	}

	// todo:done permissions
	int per = 0;
	printf("Add permissions (octal) (e to default rw-r--r--): \n");
	if (scanf("%d", &per) != 0)
	{
		per = 0644;
	}

	// start operation

	int desfd = open(argv[2], O_WRONLY | O_CREAT | oflag | O_SYNC, per);
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
	close(checkdesfd);

	return 0;
}
