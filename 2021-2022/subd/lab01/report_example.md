### **РОССИЙСКИЙ УНИВЕРСИТЕТ ДРУЖБЫ НАРОДОВ**

### **Факультет физико-математических и естественных наук**

### **Кафедра прикладной информатики и теории вероятностей**











### **Отчет по лабораторной работе № 1**

### *Дисциплина: Системы управления базами данных*









Студент:	Логинов Сергей Андреевич

Группа:	  НФИбд-01-18 



​																							

​															**МОСКВА 2021г**

### Задание

1. Создать с учетом первичных и внешних ключей следующие таблицы:

​	<img src="/Users/sergejloginov/Library/Application Support/typora-user-images/Снимок экрана 2021-12-08 в 01.44.35.png" alt="Снимок экрана 2021-12-08 в 01.44.35" style="zoom:65%;" />

2. Заполнить таблицы: student - 20 записей, group - 4 записи, subject - 5 записей, speciality - 2 записи

3. Вывести количество мужчин и женщин в каждой группе
4. Вывести количество студентов в каждой специальности упорядоченно по убыванию



### Выполнение

1. Создадим требуемые таблицы:

​	Создадим тип enum, который представляет собой набор из 4 нужных нам значений для пола и степени:

<img src="/Users/sergejloginov/Library/Application Support/typora-user-images/Снимок экрана 2021-12-08 в 02.34.23.png" alt="Снимок экрана 2021-12-08 в 02.34.23" style="zoom:50%;" />



​	Группы. Первичный ключ - id_group, внешний - id_speciality:

![Снимок экрана 2021-12-08 в 02.06.40](/Users/sergejloginov/Library/Application Support/typora-user-images/Снимок экрана 2021-12-08 в 02.06.40.png)

Специальности. Первичный ключ - id_speciality:

![Снимок экрана 2021-12-08 в 02.09.36](/Users/sergejloginov/Library/Application Support/typora-user-images/Снимок экрана 2021-12-08 в 02.09.36.png)

Студенты. Первичный ключ - id_student, внешний - id_group:

![Снимок экрана 2021-12-08 в 02.10.18](/Users/sergejloginov/Library/Application Support/typora-user-images/Снимок экрана 2021-12-08 в 02.10.18.png)



Выбранные студентами дисциплины. Первичный ключ здесь составной - student_id + choice_subject_id:

![Снимок экрана 2021-12-08 в 02.14.20](/Users/sergejloginov/Library/Application Support/typora-user-images/Снимок экрана 2021-12-08 в 02.14.20.png)

Дисциплины. Первичный ключ - id_subject, внешний - speciality_id:

![Снимок экрана 2021-12-08 в 02.14.42](/Users/sergejloginov/Library/Application Support/typora-user-images/Снимок экрана 2021-12-08 в 02.14.42.png)





2. Заполняем таблицы записями:

   

   Студенты:

   ![Снимок экрана 2021-12-08 в 02.32.08](/Users/sergejloginov/Library/Application Support/typora-user-images/Снимок экрана 2021-12-08 в 02.32.08.png)

​	

​		Группы:

​							<img src="/Users/sergejloginov/Library/Application Support/typora-user-images/Снимок экрана 2021-12-08 в 02.39.47.png" alt="Снимок экрана 2021-12-08 в 02.39.47" style="zoom:50%;" />



​		Специальности:

<img src="/Users/sergejloginov/Library/Application Support/typora-user-images/Снимок экрана 2021-12-08 в 02.39.20.png" alt="Снимок экрана 2021-12-08 в 02.39.20" style="zoom:50%;" />



​		Дисциплины:

<img src="/Users/sergejloginov/Library/Application Support/typora-user-images/Снимок экрана 2021-12-08 в 02.40.39.png" alt="Снимок экрана 2021-12-08 в 02.40.39" style="zoom:50%;" />



3. Вывести количество мужчин и женщин в каждой группе:

Количество мужчин:

![Снимок экрана 2021-12-08 в 03.14.52](/Users/sergejloginov/Library/Application Support/typora-user-images/Снимок экрана 2021-12-08 в 03.14.52.png)

Количество женщин:

![Снимок экрана 2021-12-08 в 03.15.30](/Users/sergejloginov/Library/Application Support/typora-user-images/Снимок экрана 2021-12-08 в 03.15.30.png)



4. Вывести количество студентов в каждой специальности упорядоченно по убыванию

   ![Снимок экрана 2021-12-08 в 03.11.56](/Users/sergejloginov/Library/Application Support/typora-user-images/Снимок экрана 2021-12-08 в 03.11.56.png)
