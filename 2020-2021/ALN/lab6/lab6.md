## **РОССИЙСКИЙ УНИВЕРСИТЕТ ДРУЖБЫ НАРОДОВ**

### **Факультет физико-математических и естественных наук**

### **Кафедра прикладной информатики и теории вероятностей**



















## **ОТЧЕТ ПО ЛАБОРАТОРНОЙ РАБОТЕ № 6**

###  *дисциплина: Администрирование локальных сетей*



















Студент:	Логинов Сергей Андреевич

Группа:	  НФИбд-01-18 



​													



​														

​																		 	**МОСКВА**

​															    				2021 г.







## Цель работы:

Настроить статическую маршрутизацию VLAN в сети.



## Ход работы:

* В рабочей области разместили маршрутизатор вида 2811 и подключили его к коммутатору(рис.1):![1](C:\Users\itsok\work\2020-2021\ALN\lab6\screen\1.png)

  ​																Рис.1



* Произвели начальную настройку маршрутизатора(рис.2):

![2](C:\Users\itsok\work\2020-2021\ALN\lab6\screen\2.png)

​																								Рис.2



* Настраиваем виртуальные интерфейсы на интерфейсе f0/0  маршрутизатора msk-donskaya-saloginov-gw-1. Задаём ip-адреса на виртуальных интерфейсах(рис.3):

![3](C:\Users\itsok\work\2020-2021\ALN\lab6\screen\3.png)

​																						Рис.3

* Проверяем доступность устройств из разных VLAN(рис.4):![4](C:\Users\itsok\work\2020-2021\ALN\lab6\screen\4.png)

  ​																Рис.4(10.128.3.201 ping to 10.128.5.201)



* Наблюдаем за передвижением пакета в режиме симуляции. Просмотрим заголовки пакета(рис.5):![5](C:\Users\itsok\work\2020-2021\ALN\lab6\screen\5.png)

  ​																							Рис.5



## Вывод:

Настроили статическую маршрутизацию VLAN в сети.



## Контрольные вопросы:



1. IEEE 802.1Q - стандарт, описывающий процедуру тегирования трафика для передачи информации о принадлежности к VLAN

2. Формат кадра IEEE 802.1Q:

   ​	Первые 16 бит - TPID - информация о том, какой протокол используется для тегирования.	

   ​	Вторые 16 бит - TCI:

   ​		PCP(3 бита) - задание приоритета

   ​		DEI(1 бит) - индикатор допустимости удаления

   ​		VID(12 бит) - указывает, какому VLAN принадлежит кадр.

