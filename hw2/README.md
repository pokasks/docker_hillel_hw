"Заметки на полях"
Image mysql:latest "заточен" по умолчанию на каталог '/var/lib/mysql' и для данных, и для логов. 
Если для volum-ов использовать '/var/lib/mysql/data' инициализация базы данных аварийно завершается. 
('/var/lib/mysql' должен быть пустой на момент инициализации)
'/var/log/mysql' оставил в задании, но он не нужен, если mysql не реконфигурировать 
все логи (проверял, много нового узнал, хорошая практика полазить по контейнерам) 
пишутся в '/var/lib/mysql'

Обязательно нужно указывать 
	command: --default-authentication-plugin=mysql_native_password
	для контейнера базы данных, иначе обычным логином/паролем не подключиться, 
	нужна либа caching_sha2_password.so

	В скрипт заливки данных не придумал ничего лучше чем внести первым оператором 'sleep 30'
	При первом запуске, контейнеры стартовали, зависимости отработали, т.е. клиент стартовал только 
	после того как стартовал контейнер БД, но процесс начальной инициализации MySQL занимает некоторое время, 
	на моей машине 15-20 секунд, до того как MySQL напишет в логах что готов принимать соединения.
	ЗЫ образ MySQL жутко урезан, нет буквально ничего, диагностика - боль :)


