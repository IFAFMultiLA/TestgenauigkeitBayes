# Lerndashboard für Anwendung des Satzes von Bayes auf die Genauigkeit von klinischen Tests

Markus Konrad <markus.konrad@htw-berlin.de>, Februar 2023

## Grundlegendes

Dieses Lerndashboard verwendet [learnr](https://rstudio.github.io/learnr/).

Es ist momentan online verfügbar unter https://rshiny.f4.htw-berlin.de/users/mk/TestgenauigkeitBayes/.

## Installation

- zunächst muss das Paket [renv](https://rstudio.github.io/renv/index.html) installiert sein
- dann können alle Paketabhängigkeiten installiert werden mittels `renv::restore()`

## Deployment auf HTW Server

- das Deployment kann über die `Makefile` gesteuert werden
- hierzu müssen ggf. erst die Pfade im `Makefile` angepasst werden, denn die beziehen sich auf den User `mk`
- danach können mittels `make server_installdeps` die benötigten Pakete installiert werden
- mittels `make server_testsync` kann simuliert werden, welche Dateien für das Deployment auf den Server kopiert werden würden
- mittels `make server_sync` werden die Dateien dann tatsächlich auf den Server übertragen
- mittels `make server_reload` wird die App auf dem Server neu gestartet – **das ist notwendig, damit die Änderungen nach einem Upload tatsächlich angezeigt werden**
