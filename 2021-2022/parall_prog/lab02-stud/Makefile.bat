@echo off
chcp 65001

set BINDIR=bin
set TESTDIR=test
set MODDIR=mod

mkdir %TESTDIR% > nul
mkdir %BINDIR% > nul
mkdir %MODDIR% > nul


gfortran -Wall -fopenmp ./%TESTDIR%/test_reduction.f90 -o ./%BINDIR%/test_reduction.exe -J %MODDIR%
gfortran -Wall -fopenmp ./%TESTDIR%/test_trapezoidal.f90 -o ./%BINDIR%/test_trapezoidal.exe -J %MODDIR%


echo Тестируем время выполнения программ в параллельном режиме

echo Тестируем редукцию
%BINDIR%\test_reduction.exe sum | python plot.py -f png -d imgs\reduction_sum
%BINDIR%\test_reduction.exe max | python plot.py -f png -d imgs\reduction_max
%BINDIR%\test_reduction.exe min | python plot.py -f png -d imgs\reduction_min


echo Тестируем test_trapezoidal
%BINDIR%\test_trapezoidal.exe | python plot.py -f png -d imgs\trapezoidal

pause
