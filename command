#                                      _  _   _  _   _  _  __  _  _     ___   _
#              .                      | || | | || \ | || |/ /_| || |_  / _ \ / |
#         ,rX77;;i:.               _  | || | | ||  \| || ' /|_  ..  _|| | | || |
#       SB0Z2S77rr;.              | |_| || |_| || |\  || . \|_      _|| |_| || |
#     iWBZ2XX7r;;i                 \___/  \___/ |_| \_||_|\_\ |_||_|   \___/ |_|
#    :MBa2SXX7;;i:
#    B@Za2SXXrr;;i
#    MBZaaSSXXrr;r:             ...using parts which work and parts which don't!
#    MW8Z22SSXXrrrri
#    WM0ZZaaSSXXX7r777;;7,
#---- @B8ZZa2SSXXXX777XSr ------ Как последовательно накатывать WEB-сервер nginx
#---------------- под UBUNTU... с всякими свистульками для Python/Django и пр...
#
# Утанавливает компилятор С++ (GCC) и собираем библиотеки (c исходниками):
#    * libpcre3 -- 
#    * libpcre3-dev -- 
#    * libpcrecpp0 --
#    * libssl-dev -- библиотека функций для поддержки ssl
#    * zlib1g-dev -- библиотека функций компрессии/декомпрессии
#    * libfreetype6-dev -- библиотека работы со шрифтами 
#    * build-essential --
#    * libjpeg-dev --бибиотека функций для работы с изображениями JPEG
#
apt-get install gcc make libpcre3 libpcre3-dev libpcrecpp0 libssl-dev zlib1g-dev libfreetype6-dev build-essential libjpeg-dev

# 
apt-get install libjpeg

# Устанавливаем MC -- это что-то нортон-командера
# Устанавливаем HTOP -- это что-то типа системного монитора... есть еще и TOP то HTOP прикольнее
# Устанавливаем GIT
apt-get install mc htop git-core htop

# Устанавиваем python с исходниками и библиотеками:
apt-get install python-dev
apt-get install python-pip
apt-get install libxml2-dev
apt-get install libxslt-dev
apt-get install python-mysqldb
apt-get install python-imaging
apt-get install python-setuptools
apt-get install python-virtualenv

## Или все это можно было установить одной командлой
# apt-get install python-dev python-pip libxml2-dev libxslt-dev  python-mysqldb python-imaging python-setuptools python-virtualenv

# Устанавливаем DJANGO
apt-get install python-django

#
easy_install lxml==2.3

# Установить MySQL c библиотеками для nging и python через uwsgi
apt-get install mysql-server nginx libmysqlclient15-dev uwsgi uwsgi-plugin-python
 

# установливаем uWSGI
pip install uwsgi
 

# Делаем симлинки на библиотеки. Как альтернатива можно включить пути к ним в переменную PATH 
# Бибиотека функций для работы с изображениями JPEG
sudo ln -s /usr/lib/i386-linux-gnu/libjpeg.so /usr/lib/

# Библиотека функций компрессии/декомпрессии
sudo ln -s /usr/lib/i386-linux-gnu/libz.so /usr/lib/

# Библиотека функций работы со шрифтами apps-available а папку apps-enabled
sudo ln -s /usr/lib/i386-linux-gnu/libfreetype.so /usr/lib/

# делаем симлинк с конфига uWSGI из папки 
ln -s /etc/uwsgi/apps-available/abc_cube2_ru.ini /etc/uwsgi/apps-enabled

# говорим uWSGI запуститься считав настройки с /etc/uwsgi/apps-enabled/abc_cube2_ru.ini
sudo uwsgi -y /etc/uwsgi/apps-enabled/abc_cube2_ru.ini
# после перезагрузки этот скрипт не запуститься и сайт не будет работать
# поэтому добавляем эту стрку в содержимое /etc/rc.local (это список комманд которые надо
# отработать при загрузке). Для каждого сайта надо указывать отдельную строку 
