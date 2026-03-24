library(sna); library(PLNmodels)

dataDir = '/home/robin/RECHERCHE/ECOLOGIE/CountPCA/sparsepca/Data/BBVA/'
dataName = 'BarentsFish_Group'
load(paste0(dataDir, dataName, '.Rdata'))
X = Data$covariates; 
Y = Data$count; p = ncol(Y)

# lambda = exp(seq(2, -4, by=-.1)); PLNnet = PLNnetwork(Y ~ X, penalties=lambda)
PLNnet = PLNnetwork(Y ~ X)
PLNnet$plot()
PLNbest = PLNnet$getBestModel()
G = 1*(PLNbest$model_par$Omega !=0)
pdf(paste0(dataName, '-PLNnet.pdf'))
gplot(G, gmode='graph', label=colnames(Y), label.cex=2)
dev.off()

head(X)
head(Y[, 1:6])
