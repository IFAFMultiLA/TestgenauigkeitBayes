SERVER_STAGING := htwserver-mk
SERVER_PROD := htwserver-multila
APPDIR := ~/ShinyApps/TestgenauigkeitBayes
SERVER_STAGING_APP := $(SERVER_STAGING):$(APPDIR)
SERVER_PROD_APP := $(SERVER_PROD):$(APPDIR)
RSYNC_COMMON := -rcv --exclude-from=.rsyncexclude

devserver:
	-rm testgenauigkeit.html
	R -e 'renv::install("../learnrextra");rmarkdown::run("testgenauigkeit.Rmd", shiny_args = list(port = 8001, launch.browser = FALSE))'

staging_sync: deploymentfiles
	rsync $(RSYNC_COMMON) . $(SERVER_STAGING_APP)
	ssh $(SERVER_STAGING) 'cd $(APPDIR) && mv testgenauigkeit_prod.Rmd testgenauigkeit.Rmd'
	rm testgenauigkeit_prod.Rmd

staging_testsync:
	rsync $(RSYNC_COMMON) -n . $(SERVER_STAGING_APP)

staging_reload:
	ssh $(SERVER_STAGING) 'touch $(APPDIR)/restart.txt'

staging_installdeps:
	ssh $(SERVER_STAGING) 'cd $(APPDIR) && R -e "renv::restore()"'

prod_sync: deploymentfiles
	rsync $(RSYNC_COMMON) . $(SERVER_PROD_APP)
	ssh $(SERVER_PROD) 'cd $(APPDIR) && mv testgenauigkeit_prod.Rmd testgenauigkeit.Rmd'
	rm testgenauigkeit_prod.Rmd

prod_testsync:
	rsync $(RSYNC_COMMON) -n . $(SERVER_PROD_APP)

prod_reload:
	ssh $(SERVER_PROD) 'touch $(APPDIR)/restart.txt'

prod_installdeps:
	ssh $(SERVER_PROD) 'cd $(APPDIR) && R -e "renv::restore()"'

deploymentfiles:
	sed -- 's/apiserver: http:\/\/localhost:8000\//apiserver: https:\/\/rshiny.f4.htw-berlin.de\/api\//g' testgenauigkeit.Rmd > testgenauigkeit_prod.Rmd
