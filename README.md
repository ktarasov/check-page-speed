# check-page-speed

**Language / Язык:** [🇷🇺 Русская версия](#check-page-speed-1) | English

A lightweight Bash script that measures the response time of a web page using `curl` and displays a detailed breakdown of where time is spent: DNS lookup, connection, data transfer, redirects, and time to first byte.

## Features

- Measures key stages of an HTTP request via `curl` write-out variables:
  - **DNS Lookup** — time spent resolving the hostname
  - **Time to connect** — time to establish a TCP connection
  - **Time of data transfer** — time from the start of the transfer until the request is ready
  - **Time of redirect** — total time spent on all redirect steps
  - **Time to First byte (TTFB)** — time until the first byte of the response arrives
  - **Total time** — full request duration
- Follows redirects automatically (`-L` flag)
- Runs in silent mode (`-s`), only the timing report is printed
- No dependencies other than `curl`

## Requirements

- Bash
- [curl](https://curl.se/)

## Installation

Clone the repository (or download `check-page-speed.sh`) and make the script executable:

```bash
chmod +x check-page-speed.sh
```

Optionally, make it available system-wide:

```bash
sudo cp check-page-speed.sh /usr/local/bin/check-page-speed
```

## Usage

```bash
./check-page-speed.sh <url>
```

Example:

```bash
./check-page-speed.sh https://example.com
```

Output:

```text
Testing Website Response Time for:
https://example.com/
===================================
DNS Lookup:              0.012345s
Time to connect:         0.045678s
Time of data transfer:   0.045901s
Time of redirect:        0.000000s
Tite to First byte:      0.123456s
===================================
Total time:              0.200123s
===================================
```

The URL must start with `http://` or `https://` — otherwise the script exits with an error.

## Exit Codes

| Code | Meaning |
|------|---------|
| `0`  | Success |
| `1`  | URL is missing, empty, or does not start with `http://` / `https://` |

## Notes

- The response body is written to a temporary file `/tmp/test-speed` and removed after the run; only the timing report is shown.
- The report labels come directly from `curl`'s `-w` format variables, so their meaning follows the [curl documentation](https://curl.se/docs/manpage.html).

---

# check-page-speed

**Language / Язык:** [🇬🇧 English version](#check-page-speed) | Русский

Лёгкий Bash-скрипт, который измеряет время отклика веб-страницы с помощью `curl` и выводит подробный разбор того, на что было потрачено время: DNS-lookup, соединение, передача данных, редиректы и время до первого байта.

## Возможности

- Измеряет ключевые этапы HTTP-запроса через переменные формата `curl`:
  - **DNS Lookup** — время разрешения имени хоста
  - **Time to connect** — время установления TCP-соединения
  - **Time of data transfer** — время с начала передачи данных до готовности запроса
  - **Time of redirect** — суммарное время всех редиректов
  - **Time to First byte (TTFB)** — время до получения первого байта ответа
  - **Total time** — полное время выполнения запроса
- Автоматически следует редиректам (флаг `-L`)
- Работает в тихом режиме (`-s`) — выводится только отчёт с таймингами
- Единственная зависимость — `curl`

## Требования

- Bash
- [curl](https://curl.se/)

## Установка

Склонируйте репозиторий (или скачайте `check-page-speed.sh`) и сделайте скрипт исполняемым:

```bash
chmod +x check-page-speed.sh
```

При желании сделайте его доступным в системе:

```bash
sudo cp check-page-speed.sh /usr/local/bin/check-page-speed
```

## Использование

```bash
./check-page-speed.sh <url>
```

Пример:

```bash
./check-page-speed.sh https://example.com
```

Вывод:

```text
Testing Website Response Time for:
https://example.com/
===================================
DNS Lookup:              0.012345s
Time to connect:         0.045678s
Time of data transfer:   0.045901s
Time of redirect:        0.000000s
Tite to First byte:      0.123456s
===================================
Total time:              0.200123s
===================================
```

URL должен начинаться с `http://` или `https://` — иначе скрипт завершится с ошибкой.

## Коды выхода

| Код | Значение |
|-----|----------|
| `0` | Успех |
| `1` | URL отсутствует, пустой или не начинается с `http://` / `https://` |

## Примечания

- Тело ответа записывается во временный файл `/tmp/test-speed` и удаляется после выполнения; на экран выводится только отчёт с таймингами.
- Названия метрик в отчёте берутся напрямую из переменных формата `-w` утилиты `curl`, поэтому их значения соответствуют [документации curl](https://curl.se/docs/manpage.html).
