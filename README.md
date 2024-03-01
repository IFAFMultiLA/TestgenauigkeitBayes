# Lernanwendung für Anwendung des Satzes von Bayes auf die Genauigkeit von klinischen Tests

Markus Konrad <markus.konrad@htw-berlin.de>, März 2024

## Grundlegendes

Dieses Lernanwendung verwendet [learnrextra](https://github.com/IFAFMultiLA/learnrextra).

## Installation

- zunächst muss das Paket [renv](https://rstudio.github.io/renv/index.html) installiert sein
- dann können alle Paketabhängigkeiten installiert werden mittels `renv::restore()`

## "learnrextra" Paket

- dieses Lernanwendung ist abhängig von einer selbstentwickelten Erweiterung zu learnr namens *learnrextra*
- die Entwicklungsversion von learnrextra ist in einem [öffentlichen GitHub-Repository](https://github.com/IFAFMultiLA/learnrextra) verfügbar
- wird die Entwicklungsversion von learnrextra aktualisiert, also ein neuer Commit in den Main-Branch des Repositories geladen, kann diese neue Version mittels `devtools::install_github('IFAFMultiLA/learnrextra')` installiert werden (alternativ kann `devtools::install_local(<Pfad-zum-lokalen-Projekt>)` verwendet werden)

