server_sync:
	rsync -rcv --exclude-from=.rsyncexclude . htwserver-mk:/home/mk/ShinyApps/TestgenauigkeitBayes

server_testsync:
	rsync -rcvn --exclude-from=.rsyncexclude . htwserver-mk:/home/mk/ShinyApps/TestgenauigkeitBayes

server_installdeps:
	ssh htwserver-mk 'cd ~/ShinyApps/TestgenauigkeitBayes && R -e "renv::restore()"'

