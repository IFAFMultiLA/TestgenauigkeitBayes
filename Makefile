SERVER := htwserver-mk
APPDIR := ~/ShinyApps/TestgenauigkeitBayes
SERVER_APP := $(SERVER):$(APPDIR)
RSYNC_COMMON := -rcv --exclude-from=.rsyncexclude

devserver:
	R -e 'rmarkdown::run("testgenauigkeit.Rmd", shiny_args = list(port = 8001, launch.browser = FALSE))'

sync:
	rsync $(RSYNC_COMMON) . $(SERVER_APP)

testsync:
	rsync $(RSYNC_COMMON) -n . $(SERVER_APP)

reload:
	ssh $(SERVER) 'touch $(APPDIR)/restart.txt'

installdeps:
	ssh $(SERVER) 'cd $(APPDIR) && R -e "renv::restore()"'
