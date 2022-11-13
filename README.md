# ИДЗ по АВС №2 / Вариант №13
## Васильев Андрей Михайлович / БПИ215

Работа выполнена с соблюдением всех критериев на **6 БАЛЛОВ**.

## Порядок действий при выполнении работы
- Написана программа на C ([main.c](https://github.com/makeitokay/avs-ihw-2/blob/master/main.c))
    - Используются функции с передачей данных через параметры (функция `convert`)
    - Используются локальные переменные (и в функции `main`, и в `convert`)
- Программа дизассемблирована ([main.s](https://github.com/makeitokay/avs-ihw-2/blob/master/main.s)) в GAS с помощью команды `gcc -masm=intel -fno-asynchronous-unwind-tables -fno-jump-tables -fno-stack-protector -fno-exceptions ./main.c -S -o ./main.s`
- В дизассемблированной программе проведены следующие модификации:
    - Убрано все лишнее (`.file`, все после `ret` в конце, `cdqe`)
    - Произведен рефакторинг за счет максимального использования регистров процессора
- В отрефакторенную и модифицированную ассемблерную программу ([main_refactored.s](https://github.com/makeitokay/avs-ihw-2/blob/master/main_refactored.s)) добавлены комментарии, поясняющие всю работу программы и связь с программой на C
- Программа на C и модифицированная программа на ассемблере откомпилированы для тестирования с помощью команд:
    - Компиляция `gcc ./main_refactored.s -c -o ./main.o` и компоновка `gcc ./main.o -o asm_program` ассемблерной программы
    - Компиляция `gcc ./main.c -o c_program` программы на C
- Созданы файлы с тестовыми входными данными ([input1](https://github.com/makeitokay/avs-ihw-2/blob/master/input1), [input2](https://github.com/makeitokay/avs-ihw-2/blob/master/input2), [input3](https://github.com/makeitokay/avs-ihw-2/blob/master/input3), [input4](https://github.com/makeitokay/avs-ihw-2/blob/master/input4))
- Тесты прогнаны, получен ожидаемый результат
- Написан этот отчет :)

## Сравнение размеров файлов

Размер файла с кодом на ассемблере до рефакторинга = **2407 байт**

Размер файла с кодом на ассемблере после рефакторинга (без комментариев) = **1841 байт**

## Результаты тестовых прогонов

Формируем файл с входными данными. Всего создано четыре тестовых набора:
- Первый набор проверяет общую работоспобность программы, в нем находятся как заглавные, так и строчные буквы английского алфавита. Ожидается, что заглавные поменяются на строчные и наоборот.
- Второй набор проверяет, что программа оставляет небуквенные символы неизменными. Ожидается, что ABCDE поменяется на abcde, а abcde на ABCDE (в первой строчке).

И еще два набора для того, чтобы убедиться, что программа работает в боевых условиях:
- Программа на С (input3)
- Программа (без рефакторинга) на ассемблере (input4)

Результаты тестовых прогонов можно увидеть на скриншотах:

### ПРОГРАММА НА C

- ![c_1](https://user-images.githubusercontent.com/34311075/201494988-7f283015-ab6a-4be3-82d0-c4badca16ac0.png)

- ![c_2](https://user-images.githubusercontent.com/34311075/201494991-c30d53e8-e7f7-4848-98df-b031509918cc.png)

- ![c_3](https://user-images.githubusercontent.com/34311075/201494997-7128ef46-3931-43c2-a31f-5a8c4eb141d5.png)

- ![c_4](https://user-images.githubusercontent.com/34311075/201495001-0517b28c-94b6-49fe-a3fd-eb1458634022.png)

### ПРОГРАММА НА АССЕМБЛЕРЕ
- ![asm_1](https://user-images.githubusercontent.com/34311075/201495019-e9d8da50-e04e-4c76-abeb-df7988d79833.png)

- ![asm_2](https://user-images.githubusercontent.com/34311075/201495022-1eb364bf-fc4d-479d-96d0-d4703829e7d5.png)

- ![asm_3](https://user-images.githubusercontent.com/34311075/201495023-022c1ca0-1896-40a2-b29b-98ffb4a860bb.png)

- ![asm_4](https://user-images.githubusercontent.com/34311075/201495027-dd76a351-743e-4b74-bfc2-c3bb33b52328.png)
