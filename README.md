# biclustering
R-Codes for the paper 'Submatrix Localization: Minimaxity of Scan Estimator and Rank Methods' by Ery Arias-Castro and Yuchao Liu

Files:
- shabalin.R : Provides functions associated with the local hill-climbing algorithm (Shabalin et al, (2009)) for finding the certain sized submatrix with the largest entry sum. 
- randomMatrx.R : Functions generating random matrix with one submatrix with elevated parameter. Functions generating Normal and Poisson entries are provided.
- normal_bala.R / normal_imba.R / poi.R : Codes for simulations (balanced matrix size, Normal entries / imbalanced matrix size, Normal entries / Poisson entries). Row and column error rates are recorded and saved.
- evalBala.R / evalImba.R / evalPoi.R : Codes for graph generation and result illustration.


Reference:

Shabalin, A. A., V. J. Weigman, C. M. Perou, and A. B. Nobel (2009). Finding large average submatrices in high dimensional data. The Annals of Applied Statistics 3 (3), 985-1012. (http://arxiv.org/abs/0905.1682)
