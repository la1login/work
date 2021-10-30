set BINDIR=bin
set MODDIR=mod
set IMGDIR=imgs

rmdir /q /s %BINDIR%
rmdir /q /s %MODDIR%
rmdir /q /s %IMGDIR%

del /s /q src\*.mod
del /s /q test\*.mod