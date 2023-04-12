SERVER := htwserver-mk
APPDIR := ~/ShinyApps/TestgenauigkeitBayes
SERVER_APP := $(SERVER):$(APPDIR)
RSYNC_COMMON := -rcv --exclude-from=.rsyncexclude

devserver:
	-rm testgenauigkeit.html
	R -e 'renv::install("../adaptivelearnr");rmarkdown::run("testgenauigkeit.Rmd", shiny_args = list(port = 8001, launch.browser = FALSE))'

sync: deploymentfiles
	rsync $(RSYNC_COMMON) . $(SERVER_APP)
	ssh $(SERVER) 'cd $(APPDIR) && mv testgenauigkeit_prod.Rmd testgenauigkeit.Rmd'
	rm testgenauigkeit_prod.Rmd

testsync:
	rsync $(RSYNC_COMMON) -n . $(SERVER_APP)

reload:
	ssh $(SERVER) 'touch $(APPDIR)/restart.txt'

installdeps:
	ssh $(SERVER) 'cd $(APPDIR) && R -e "renv::restore()"'

deploymentfiles:
	sed -- 's/apiserver: http:\/\/localhost:8000\//apiserver: https:\/\/rshiny.f4.htw-berlin.de\/api\//g' testgenauigkeit.Rmd > testgenauigkeit_prod.Rmd