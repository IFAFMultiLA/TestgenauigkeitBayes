# Lerndashboard für Anwendung des Satzes von Bayes auf die Genauigkeit von klinischen Tests

Markus Konrad <markus.konrad@htw-berlin.de>, Februar 2023

## Grundlegendes

Dieses Lerndashboard verwendet [learnr](https://rstudio.github.io/learnr/).

Es ist momentan online verfügbar unter https://rshiny.f4.htw-berlin.de/users/mk/TestgenauigkeitBayes/.

## Installation

- zunächst muss das Paket [renv](https://rstudio.github.io/renv/index.html) installiert sein
- dann können alle Paketabhängigkeiten installiert werden mittels `renv::restore()`

## Entwicklung

- alternativ zum "Run document" Knopf in RStudio kann `make devserver` verwendet werden, womit die Anwendung auf `http://localhost:8000` zur Verfügung gestellt wird

## Deployment auf HTW Server

- das Deployment kann über die `Makefile` gesteuert werden
- hierzu müssen ggf. erst die Pfade im `Makefile` angepasst werden, denn die beziehen sich auf den User `mk`
- danach können mittels `make installdeps` die benötigten Pakete installiert werden
- mittels `make testsync` kann simuliert werden, welche Dateien für das Deployment auf den Server kopiert werden würden
- mittels `make sync` werden die Dateien dann tatsächlich auf den Server übertragen
- mittels `make reload` wird die App auf dem Server neu gestartet – **das ist notwendig, damit die Änderungen nach einem Upload tatsächlich angezeigt werden**
