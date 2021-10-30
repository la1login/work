#! /usr/bin/env python3
# -*- coding: utf-8 -*-
import sys
import os
import multiprocessing
import argparse

import numpy as np
import matplotlib.pyplot as plt


def speedup(time):
    """Ускорение параллельного алгоритма"""
    return time[0]/time


def effectiveness(time, threads_num):
    """Эффективность параллельного алгоритма"""
    return (time[0] / time) / threads_num


# Разбираем аргументы командной строки
parser = argparse.ArgumentParser()
h = "Число потоков. Отключает проверку оптимального числа потоков"
parser.add_argument('-t', '--threads', type=int, help=h)
h = "Формат картинки"
parser.add_argument('-f', '--format', type=str, choices=('png', 'pdf'), help=h)
h = "Каталог для сохранения картинок"
parser.add_argument('-d', '--directory', type=str, default='img', help=h)

args = parser.parse_args()

# если задан формат картинки, то используем его
FMT = args.format if args.format else 'png'

FOLDER = args.directory + os.sep

threads_num, exec_time = np.loadtxt(sys.stdin, delimiter=',',
                    usecols=(0,1), comments='#', unpack=True)

threads_num = threads_num.astype(int)

if threads_num[-1] != threads_num.size:
    print(f"Число потоков: {threads_num[-1]}\n"
            f"Число строк в таблице: {threads_num.size}\n"
            f"Несоответствие!")
    exit(1)

if any(exec_time <= 10e-9):
    print("Время выполнения программы близко к нулю! Скорее всего вы еще не реализовали функции")
    exit(1)

# Максимальное количество потоков не может быть больше, чем
# количество потоков, переданное в скрипт из программы
if args.threads and args.threads <= threads_num[-1]:
    max_threads = args.threads
    threads_num = threads_num[:max_threads]
    exec_time = exec_time[:max_threads]
else:
    max_threads = threads_num[-1]

cpu_threads = multiprocessing.cpu_count()

# Если заданна опция `threads`, то пользователь знает что делает
# и проверка на оптимальное количество не производится
if max_threads > cpu_threads and not args.threads:
    print(f"Вы задали неоптимальное ({max_threads}) количество потоков!\n"
          f"Ваш процессор эффективно поддерживает лишь {cpu_threads} потоков.")
    exit(1)

print("Считали данные, строим графики...", end=' ')

fig01 = plt.figure(1, figsize=(8, 3), dpi=300)
fig02 = plt.figure(2, figsize=(8, 3), dpi=300)
fig03 = plt.figure(3, figsize=(8, 3), dpi=300)

ax01 = fig01.add_subplot(1, 1, 1)
ax02 = fig02.add_subplot(1, 1, 1)
ax03 = fig03.add_subplot(1, 1, 1)

label01 = "Время выполнения [сек.]"
label02 = "Ускорение $S_{p} = T_1 / T_p$"
label03 = "Эффективность $S_{p} / p$"

style = dict(color='0.1', marker='o', markersize=5)
# Рисуем графики времени выполнения, ускорения и эффективности
# вычисления проводят функции `speedup` и `effectiveness`
ax01.plot(threads_num, exec_time, label=label01, **style)
ax02.plot(threads_num, speedup(exec_time), label=label02, **style)
ax03.plot(threads_num, effectiveness(exec_time, threads_num), label=label03, **style)


for ax in (ax01, ax02, ax03):
    ax.spines['top'].set_visible(False)
    ax.spines['right'].set_visible(False)
    ax.set_xticks(threads_num)
    ax.set_xlabel("Количество потоков $p$")
    ax.grid(color='0.5', ls='--', lw=0.5)
    ax.legend(loc='best')

print("сохраняем изображения")
# Если каталога нет, то создаем
if os.path.exists(FOLDER):
    print(f"{FOLDER} существует")
else:
    print(f"{FOLDER} не существует, создаем")
    os.makedirs(FOLDER)

params = dict(format=FMT, dpi=300, bbox_inches='tight', pad_inches=0.0)
fig01.savefig(f"{FOLDER}time.{FMT}", **params)
fig02.savefig(f"{FOLDER}speedup.{FMT}", **params)
fig03.savefig(f"{FOLDER}effectiveness.{FMT}", **params)
