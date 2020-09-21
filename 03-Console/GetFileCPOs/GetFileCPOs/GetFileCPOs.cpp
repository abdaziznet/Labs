// ConsoleApplication1.cpp : Defines the entry point for the console application.
//



#include <windows.h>
#include <ShlObj.h>
#include "Winuser.h"
#include <iostream>

//#include "stdafx.h"

using namespace std;

int main()
{
	TCHAR szPath[260];
	if (SUCCEEDED(SHGetFolderPath(NULL,
		CSIDL_COMMON_DESKTOPDIRECTORY,
		NULL,
		0,
		szPath)))
	{
		cout << szPath;
		WIN32_FIND_DATA FindFileData;
		HANDLE hFind;
		//"C:/Users/Public/Desktop/*.*"
		hFind = FindFirstFile("C:/Users/Public/Desktop/*.*", &FindFileData);
		if (hFind == INVALID_HANDLE_VALUE)
		{
			printf("FindFirstFile failed (%d)\n", GetLastError());
			return 0;
		}
		else
		{

			int res = 0;
			while (res != -1)
			{
				char fileName[260];
				strcpy_s(fileName, sizeof(fileName), FindFileData.cFileName);

				cout << fileName;

				FindNextFile(hFind, &FindFileData);



			}

		
		}



	}
	else {
		cout << "ERROR";
	}



	return 0;
}

