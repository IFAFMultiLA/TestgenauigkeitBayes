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

## "learnrextra" Paket

- dieses Lerndashboard ist abhängig von einer selbstentwickelten Erweiterung zu learnr namens *learnrextra*
- learnrextra fügt u.a. JavaScript hinzu, um eine Anpassbarkeit des Lerndashboards via JSON zu gewährleisten
- momentan wird die Entwicklungsversion von learnrextra in ein [öffentliches GitHub-Repository](https://github.com/IFAFMultiLA/learnrextra) geladen
- wird die Entwicklungsversion von learnrextra aktualisiert, also ein neuer Commit in den Main-Branch des Repositories geladen, kann diese neue Version mittels `devtools::install_github('IFAFMultiLA/learnrextra')` installiert werden (alternativ kann `devtools::install_local(<Pfad-zum-lokalen-Projekt>)` verwendet werden)

