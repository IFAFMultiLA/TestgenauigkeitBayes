server_sync:
	rsync -rcv --exclude-from=.rsyncexclude . htwserver-mk:/home/mk/ShinyApps/TestgenauigkeitBayes

server_testsync:
	rsync -rcvn --exclude-from=.rsyncexclude . htwserver-mk:/home/mk/ShinyApps/TestgenauigkeitBayes

server_reload:
	ssh htwserver-mk 'touch ~/ShinyApps/TestgenauigkeitBayes/restart.txt'

server_installdeps:
	ssh htwserver-mk 'cd ~/ShinyApps/TestgenauigkeitBayes && R -e "renv::restore()"'

