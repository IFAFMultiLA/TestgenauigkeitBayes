SERVER := htwserver-mk
APPDIR := ~/ShinyApps/TestgenauigkeitBayes
SERVER_APP := $(SERVER):$(APPDIR)
RSYNC_COMMON := -rcv --exclude-from=.rsyncexclude


sync:
	rsync $(RSYNC_COMMON) . $(SERVER_APP)

testsync:
	rsync $(RSYNC_COMMON) -n . $(SERVER_APP)

reload:
	ssh $(SERVER) 'touch $(APPDIR)/restart.txt'

installdeps:
	ssh $(SERVER) 'cd $(APPDIR) && R -e "renv::restore()"'
