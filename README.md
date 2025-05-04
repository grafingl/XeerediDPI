<div align="center">


*"Plug & Play"* обход блокировок <img src="https://cdn-icons-png.flaticon.com/128/5968/5968756.png" height=15 /> Discord и <img src="https://cdn-icons-png.flaticon.com/128/1384/1384060.png" height=15 /> YouTube для Windows

Альтернатива https://github.com/Flowseal/zapret-discord-youtube
</div>

> **Выдержка из [`readme.md`](https://github.com/bol-van/zapret-win-bundle/blob/master/readme.md#%D0%B0%D0%BD%D1%82%D0%B8%D0%B2%D0%B8%D1%80%D1%83%D1%81%D1%8B) репозитория [bol-van/zapret-win-bundle](https://github.com/bol-van/zapret-win-bundle)*

> [!IMPORTANT]
> Все файлы в папке [`bin`](./bin) взяты из [zapret-win-bundle/zapret-winws](https://github.com/bol-van/zapret-win-bundle/tree/master/zapret-winws). Вы можете это проверить с помощью хэшей/контрольных сумм.

## ⚙️Использование

1. Загрузите архив (7z) со [страницы последнего релиза](https://github.com/grafingl/XeerediDPI/releases/latest)

2. Распакуйте содержимое архива по пути, который не содержит кириллицу/спец. символы

3. Запустите нужный файл

## ℹ️Краткие описания файлов

- [**`1. Установить (Дефолт).7z`**](..7z) по [**`99999. Установить (Другой 10).bat`**](./https://github.com/grafingl/XeerediDPI/blob/main/99999.%20%D0%A3%D1%81%D1%82%D0%B0%D0%BD%D0%BE%D0%B2%D0%B8%D1%82%D1%8C%20(%D0%94%D1%80%D1%83%D0%B3%D0%BE%D0%B9%2010).bat.7z) - создание и запуск службы XeerediDPI для обхода блокировок

- [**`Удалить.bat`**](./Удалить.bat) - удаление службы и его процессов

> [!IMPORTANT]
> **Стратегии блокировок со временем изменяются.**
> Определенная стратегия обхода zapret может работать какое-то время, но если меняется способ блокировки или обнаружения обхода блокировки, то она перестанет работать.
> В репозитории представлены множество различных стратегий для обхода. Если ни одна из них вам не помогает, то вам необходимо создать новую, взяв за основу одну из представленных здесь и изменив её параметры.
> Информацию про параметры стратегий вы можете найти [тут](https://github.com/bol-van/zapret/blob/master/docs/readme.md#nfqws).

- Обновите файлы в папке [`bin`](./bin), взяв новые из [zapret-win-bundle/zapret-winws](https://github.com/bol-van/zapret-win-bundle/tree/master/zapret-winws)

### Требуется цифровая подпись драйвера WinDivert (Windows 7)

- Замените файлы `WinDivert.dll` и `WinDivert64.sys` в папке [`bin`](./bin) на одноименные из [zapret-win-bundle/win7](https://github.com/bol-van/zapret-win-bundle/tree/master/win7)

### Не работает вместе с VPN

- Отключите функцию **TUN** (Tunneling) в настройках вашего VPN

## ⚖️Лицензирование

Проект распространяется на условиях лицензии [MIT](https://github.com/grafingl/XeerediDPI/blob/main/LICENSE.txt)
