# CROSSBAR 

Обеспечивает коммутацию 4 MASTER и 4 SLAVE устройств.

`crossbar.v` —  модуль коммутатора

`arbiter.v` — циклический арбитр (round-robin)

`run.do` —  файл для быстрого запуска в Modelsim

## Testbench

`crossbar_testbench.v` — тестовый модуль

Тестбенч выполняет симуляцию поведения 4 MASTER и 4 SLAVE устройств. 

## Инструменты

* ModelSim SE-64 10.6d

* Quartus Prime 21.1.0 Build 842 10/21/2021 SJ Lite Edition
___

## [Описание интерфейса](https://github.com/romantitovmephi/Crossbar/blob/main/docs/interface.md)

## [Структурная частичная схема](https://github.com/romantitovmephi/Crossbar/blob/main/docs/scheme.jpg)

## [Отчет о синтезе (Cyclone IV E)](https://github.com/romantitovmephi/Crossbar/blob/main/docs/synthesis.md)

___

## Использование

Для запуска в Modelsim можно использовать файл run.do. В нем достаточно указать путь к файлам crossbar.v, arbiter.v, crossbar_testbench.v. Затем в Modelsim в окне Transcript выполнить: do "filepath"/run.do указав путь к файлу run.do.







