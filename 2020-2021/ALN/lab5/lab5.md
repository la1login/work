## **РОССИЙСКИЙ УНИВЕРСИТЕТ ДРУЖБЫ НАРОДОВ**

### **Факультет физико-математических и естественных наук**

### **Кафедра прикладной информатики и теории вероятностей**



















## **ОТЧЕТ ПО ЛАБОРАТОРНОЙ РАБОТЕ № 5*

###  *дисциплина: Администрирование локальных сетей*



















Студент:	Логинов Сергей Андреевич

Группа:	  НФИбд-01-18 



​													



​														

​																		 	**МОСКВА**

​															    				2021 г.







## Цель работы:

Получить основные навыки по настройке VLAN на коммутаторах сети.

## Ход работы: 

- Настраиваем trunk-порты на коммутаторах. Используем следующие команды:

*enable*

*configure terminal*

*interface g0/1*(меняется в зависимости от настраиваемого интерфейса)

*switchport mode trunk*

Результат выполнения(рис.1-рис.5):

![](C:\Users\itsok\work\2020-2021\ALN\lab5\screen\1.png)

​																							Рис.1 

![2](C:\Users\itsok\work\2020-2021\ALN\lab5\screen\2.png)

​																							Рис.2

![3](C:\Users\itsok\work\2020-2021\ALN\lab5\screen\3.png)

​																							Рис.3

![4](C:\Users\itsok\work\2020-2021\ALN\lab5\screen\4.png)

​																							Рис.4

![5](C:\Users\itsok\work\2020-2021\ALN\lab5\screen\5.png)

​																							Рис.5

- Настраиваем коммутатор msk-donskaya-saloginov-sw-1 как VTP-сервер, прописываем на нем номера и названия VLAN(рис.6-рис.7):

![6](C:\Users\itsok\work\2020-2021\ALN\lab5\screen\6.png)

​																						Рис.6

![7](C:\Users\itsok\work\2020-2021\ALN\lab5\screen\7.png)

​																						Рис.7

* Просмотрим список VLAN(рис.8):

![8](C:\Users\itsok\work\2020-2021\ALN\lab5\screen\8.png)

​																						Рис.8

* Настраиваем остальные коммутаторы как VTP-киленты. Используем команды:

*conf terminal*

*vtp mode client*

*interface range f0/1 − 5*(для разных VLAN используется своя последовательность интерфейсов согласно таблице портов)

*switchport mode access*

*switchport access vlan 101*(настраиваются 3,101,102,103 и 104 VLAN)

Результат(рис.9-рис.13):

![9](C:\Users\itsok\work\2020-2021\ALN\lab5\screen\9.png)

​															

​														Рис.9(101, 102,103 VLAN на коммутаторе sw-4 на Донской)

![10](C:\Users\itsok\work\2020-2021\ALN\lab5\screen\10.png)

​																Рис.10(104 VLAN на коммутаторе sw-4 на Донской)

![11](C:\Users\itsok\work\2020-2021\ALN\lab5\screen\11.png)

​															Рис.11(101 и 104 VLAN, коммутатор sw-1 на Павловской)

![12](C:\Users\itsok\work\2020-2021\ALN\lab5\screen\12.png)

​																Рис.12(серверный VLAN, коммутатор sw-2 на Донской)

![13](C:\Users\itsok\work\2020-2021\ALN\lab5\screen\13.png)

​																Рис.13(серверный VLAN, коммутатор sw-3 на Донской)

- Назначаем gateway и ip адреса на хостах.

   gateway:

  ДК 10.128.3.1

  КАФЕДРЫ 10.128.3.1

  АДМИНИСТРАЦИЯ 10.128.3.1

  ДРУГИЕ ПОЛЬЗОВАТЕЛИ 10.128.3.1

  СЕРВЕРЫ 10.128.0.1

  ip-адреса(рис.14-рис.17):

  ![14](C:\Users\itsok\work\2020-2021\ALN\lab5\screen\14.png)

  ​													Рис.14(ДК И ДРУГИЕ ПОЛЬЗОВАТЕЛИ Павловская)![15](C:\Users\itsok\work\2020-2021\ALN\lab5\screen\15.png)

  ​													Рис.15(ДК, КАФЕДРЫ И АДМИНИСТРАЦИЯ Донская)![16](C:\Users\itsok\work\2020-2021\ALN\lab5\screen\16.png)

  ​																Рис.16(ДРУГИЕ ПОЛЬЗОВАТЕЛИ Донская)![17](C:\Users\itsok\work\2020-2021\ALN\lab5\screen\17.png)

  ​																				Рис.17(Серверы)

  

- Проверяем доступность хостов в пределах одного VLAN(рис.18):

![18](C:\Users\itsok\work\2020-2021\ALN\lab5\screen\18.png)

​																							Рис.18

- Проверяем недоступность хоста из другого VLAN(рис.19):

![19](C:\Users\itsok\work\2020-2021\ALN\lab5\screen\19.png)

​																						Рис.19

## Вывод:

Настроили VLAN на всех коммутаторах сети.



## Контрольные вопросы:

1. Для просмотра списка VLAN используется команда *show vlan*

2. VTP - протокол, облегчающий настройку VLAN в сети. Позволяет распространять списки VLAN с сервера на клиентов через trunk-порт.

3. ICMP - протокол третьего уровня, который помогает понять, может ли пакет попасть в точку назначения. Именно этот протокол используется при выполнении команды ping. 

    	Формат: первый байт - тип сообщения, второй - код сообщения, третий и четвертый - контрольная сумма

4. ARP - протокол, позволяющий определить MAC-адрес компьютера по его ip-адресу. 

   ​	Формат: 0 - 15 бит - тип интерфейса, 16-31 бит - тип протокола.

5. MAC-адрес - аппаратный номер устройства, присваивающийся в момент производства. Помогает идентифицировать устройство среди всех других устройств. MAC-адрес представляется в виде 12-значного числа в шестнадцатеричной системе счисления. Первые 6 цифр обозначают производителя сетевых карт, вторые 6 цифр - уникальный номер сетевой карты.
