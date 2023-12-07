# Erstellen der Baumdiagramme als "dot"-Dateien und PNGs.
#
# Auf Linux muss das Paket "graphviz" dafür installiert sein.
#

library(data.tree)     # für Baumdiagramme
library(DiagrammeR)

DPI <- 300


treeToPng <- function (root, outfile) {
    dotstr <- generate_dot(ToDiagrammeRGraph(root))
    cat(gsub("\'", '"', dotstr, fixed = TRUE), file = sprintf("images/%s.dot", outfile))
    system(sprintf("dot -Tpng -Gdpi=%d images/%s.dot > images/%s.png", DPI, outfile, outfile))
}


# ----- Baum 1 -----

# Knoten und Kanten des Baumdiagramms
root <- Node$new('')
node_k <- root$AddChild("Person krank")
node_k_p <- node_k$AddChild("Test positiv")
node_k_np <- node_k$AddChild("Test negativ")
node_nk <- root$AddChild("Person gesund")
node_nk_p <- node_nk$AddChild("Test positiv")
node_nk_np <- node_nk$AddChild("Test negativ")

# Optische Anpassungen
SetNodeStyle(root, shape = 'point')
SetNodeStyle(node_k, shape = 'ellipse')
SetNodeStyle(node_nk, shape = 'ellipse')
SetGraphStyle(root, rankdir = "LR")   # Baum von links nach rechts statt von oben nach unten

treeToPng(root, "baum1")


# ----- Baum 1 farbig -----

# Knoten und Kanten des Baumdiagramms
root <- Node$new('')
node_k <- root$AddChild("Person krank")
node_k_p <- node_k$AddChild("Test positiv")
node_k_np <- node_k$AddChild("Test negativ")
node_nk <- root$AddChild("Person gesund")
node_nk_p <- node_nk$AddChild("Test positiv")
node_nk_np <- node_nk$AddChild("Test negativ")

# Optische Anpassungen
SetNodeStyle(root, shape = 'point')
SetNodeStyle(node_k, shape = 'ellipse', fontcolor = "#FF0000")
SetNodeStyle(node_nk, shape = 'ellipse', fontcolor = "#0000ff")
SetNodeStyle(node_k_p, shape = 'ellipse', fontcolor = "#8b0000")
SetNodeStyle(node_nk_p, shape = 'ellipse', fontcolor = "#8b0000")
SetNodeStyle(node_k_np, shape = 'ellipse', fontcolor = "#000080")
SetNodeStyle(node_nk_np, shape = 'ellipse', fontcolor = "#000080")
SetGraphStyle(root, rankdir = "LR")   # Baum von links nach rechts statt von oben nach unten

treeToPng(root, "baum1_farbig")


# ----- Baum 2 -----

# Knoten und Kanten des Baumdiagramms
root <- Node$new('')
SetEdgeStyle(root, fontsize = 10)

# oberer Strang (krank)
node_k <- root$AddChild("K")
SetEdgeStyle(node_k, label = "P(K)")
node_k_p <- node_k$AddChild("T")
SetEdgeStyle(node_k_p, label = "P(T|K)")
node_k_np <- node_k$AddChild("T&#773;")
SetEdgeStyle(node_k_np, label = "P(T&#773;|K)")

# unterer Strang (nicht krank)
node_nk <- root$AddChild("K&#773;")
SetEdgeStyle(node_nk, label = "P(K&#773;)")
node_nk_p <- node_nk$AddChild("T")
SetEdgeStyle(node_nk_p, label = "P(T|K&#773;)")
node_nk_np <- node_nk$AddChild("T&#773;")
SetEdgeStyle(node_nk_np, label = "P(T&#773;|K&#773;)")

# Optische Anpassungen
SetNodeStyle(root, shape = 'point')
SetNodeStyle(node_k, shape = 'ellipse')
SetNodeStyle(node_nk, shape = 'ellipse')
SetGraphStyle(root, rankdir = "LR")

treeToPng(root, "baum2")

# ----- Baum 2 farbig -----

# Knoten und Kanten des Baumdiagramms
root <- Node$new('')
SetEdgeStyle(root, fontsize = 10)

# oberer Strang (krank)
node_k <- root$AddChild("K")
SetEdgeStyle(node_k, label = "P(K)")
node_k_p <- node_k$AddChild("T")
SetEdgeStyle(node_k_p, label = "P(T|K)")
node_k_np <- node_k$AddChild("T&#773;")
SetEdgeStyle(node_k_np, label = "P(T&#773;|K)")

# unterer Strang (nicht krank)
node_nk <- root$AddChild("K&#773;")
SetEdgeStyle(node_nk, label = "P(K&#773;)")
node_nk_p <- node_nk$AddChild("T")
SetEdgeStyle(node_nk_p, label = "P(T|K&#773;)")
node_nk_np <- node_nk$AddChild("T&#773;")
SetEdgeStyle(node_nk_np, label = "P(T&#773;|K&#773;)")

# Optische Anpassungen
SetNodeStyle(root, shape = 'point')
SetNodeStyle(node_k, shape = 'ellipse', fontcolor = "#FF0000")
SetNodeStyle(node_nk, shape = 'ellipse', fontcolor = "#0000ff")
SetNodeStyle(node_k_p, shape = 'ellipse', fontcolor = "#8b0000")
SetNodeStyle(node_nk_p, shape = 'ellipse', fontcolor = "#8b0000")
SetNodeStyle(node_k_np, shape = 'ellipse', fontcolor = "#000080")
SetNodeStyle(node_nk_np, shape = 'ellipse', fontcolor = "#000080")
SetGraphStyle(root, rankdir = "LR")

treeToPng(root, "baum2_farbig")



# ----- Baum 3 -----

# Knoten und Kanten des Baumdiagramms
root <- Node$new('')
SetEdgeStyle(root, fontsize = 10)

# oberer Strang (krank)
node_k <- root$AddChild("K")
SetEdgeStyle(node_k, label = "P(K)", color = "red")
node_k_p <- node_k$AddChild("T")
SetNodeStyle(node_k_p, color = "red")
SetEdgeStyle(node_k_p, label = "P(T|K)", color = "red")
node_k_np <- node_k$AddChild("T&#773;")
SetEdgeStyle(node_k_np, label = "P(T&#773;|K)", color = "black")

# unterer Strang (nicht krank)
node_nk <- root$AddChild("K&#773;")
SetEdgeStyle(node_nk, label = "P(K&#773;)", color = "red")
node_nk_p <- node_nk$AddChild("T")
SetNodeStyle(node_nk_p, color = "red")
SetEdgeStyle(node_nk_p, label = "P(T|K&#773;)", color = "red")
node_nk_np <- node_nk$AddChild("T&#773;")
SetEdgeStyle(node_nk_np, label = "P(T&#773;|K&#773;)", color = "black")

# Optische Anpassungen
SetNodeStyle(root, shape = 'point')
SetNodeStyle(node_k, shape = 'ellipse')
SetNodeStyle(node_nk, shape = 'ellipse')
SetGraphStyle(root, rankdir = "LR")

treeToPng(root, "baum3")
