## **РОССИЙСКИЙ УНИВЕРСИТЕТ ДРУЖБЫ НАРОДОВ**

### **Факультет физико-математических и естественных наук**

### **Кафедра прикладной информатики и теории вероятностей**



















## **ОТЧЕТ ПО ЛАБОРАТОРНОЙ РАБОТЕ № 3**

###  *дисциплина: Администрирование локальных сетей*



















Студент:	Логинов Сергей Андреевич

Группа:	  НФИбд-01-18 



​													



​														

​																		 	**МОСКВА**

​															    				2021 г.







## Цель работы:

Познакомится с принципами планирования локальной сети организации.

## Ход работы:

* Создадим диаграмму физического уровня и таблицу портов для сети 172.16.0.0/12(рис.1-рис.2):

![interface](C:\Users\itsok\work\2020-2021\ALN\lab3\interface.png)

​																	Рис.1	Физический уровень

![1](C:\Users\itsok\work\2020-2021\ALN\lab3\screen\1.png)

​																		Рис.2	Таблица портов.

* Распределим VLANы, создадим таблицу и диаграмму(рис.3-рис.4):

![2](C:\Users\itsok\work\2020-2021\ALN\lab3\screen\2.png)

​																		Рис.3	Таблица VLAN![vlan](C:\Users\itsok\work\2020-2021\ALN\lab3\vlan.png)

​														Рис.4 Диаграмма канального уровня(VLAN)

* Разделим сеть на подсети аналогично примеру, назначим ip-адреса и создадим диаграмму сетевого уровня(рис.5-рис.6):

![3](C:\Users\itsok\work\2020-2021\ALN\lab3\screen\3.png)

​																		Рис.5	Таблица IP-адресов![172ip](C:\Users\itsok\work\2020-2021\ALN\lab3\172ip.png)

​																		Рис.6 Схема сетевого уровня

* Проделаем то же самое для сети 192.168.0.0. Отличаться будет таблица адресов и схема сетевого уровня. Все остальные этапы аналогичны предыдущим.(рис.7-рис.8)

![4](C:\Users\itsok\work\2020-2021\ALN\lab3\screen\4.png)

​									Рис.7	Таблица IP-адресов для сети 192.168.0.0/16 и ее подсетей.![192ip](C:\Users\itsok\work\2020-2021\ALN\lab3\192ip.png)

​															Рис.8	Схема сетевого уровня подсетей



**Ответы на контрольные вопросы:**

1. Модель взаимодействия открытых систем(OSI) - модель, определяющая протоколы и распределяющая их по семи уровням: физическому(обмен сигналами между устройствами), канальному(адресация), сетевому(маршрутизация), транспортному(транспортировка пакетов), сеансовому(поддержка связи и сеанса), представления(преобразование пакетов), прикладному(представление данных в понятном человеку виде).

2. Функции коммутатора:

   1. Анализ МАС-адресов
   2. Построение таблицы активных МАС-адресов
   3. Соединяет несколько узлов в сети
   4. Передает данные получателю

3. Функции маршрутизатора

   1. Определение маршрутов
   2. Построение таблиц маршрутизации
   3. Фильтрация пакетов
   4. Отправка пакетов различным сегментам сети

4. Различие коммутаторов 2 и 3 уровня:

   ​	Коммутатор 2 уровня работает только с МАС-адресами, коммутатор 3 уровня работает и с IP-адресами, может выполнять динамическую и статическую маршрутизацию.

5. Сетевой интерфейс - физическое или программное устройство, предназначенное для передачи данных через сеть.

6. Сетевой порт – это сетевой ресурс, отображаемый в виде числа, которое определяет назначение входящих или исходящих сетевых потоков данных на заданном устройстве.

7. Ethernet - совокупность технологий пакетной передачи данных между устройствами для компьютерных сетей.
   Fast Ethernet - похож на Ethernet с увеличенной скоростью(100Мбит/с)

   Gigabit Ethernet - скорость до 1000Мбит/с, работает в полнодуплексном режиме.

8. IP-адрес - это уникальный числовой идентификатор устройства в компьютерной сети, работающий по протоколу TCP/IP. Сеть - объединение устройств с помощью различных приспособлений и технологий для обмена информацией. Подсеть - следствие логического разделения сети. Маска подсети - битовая маска, позволяющая определить адрес подсети и адрес хоста.

9. VLAN - виртуальная сеть, которая существует на канальном уровне. Он позволяет сгруппировать хостов в одну сеть, даже если они не находятся в одной физической сети. Преимуществом является облегченное перемещение по сети, большая степень администрирования с помощью устройства третьего уровня.

10. TRUNK-порт может работать с несколькими VLANами(обычно используется для связи между коммутаторами), а  ACCESS-порт - только с одним(обычно используется для связи между коммутатором и конечным устройством)