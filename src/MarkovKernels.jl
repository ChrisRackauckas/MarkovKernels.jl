module MarkovKernels

using LinearAlgebra, Statistics, Random, RecipesBase

import Base: *, +, eltype, length, size, log, ==, similar, filter

import LinearAlgebra: logdet, norm_sqr
import Statistics: mean, cov, var, std
import Random: rand, GLOBAL_RNG

abstract type AbstractDistribution end

abstract type AbstractMarkovKernel end

export AbstractDistribution, AbstractMarkovKernel

# defines observation likelihoods
include("likelihoods.jl")
export AbstractLikelihood, Likelihood, FlatLikelihood

# defines marginal normal distributions
include("normal/normal.jl")
export AbstractNormal, Normal, dim, mean, cov, var, std, residual, logpdf, entropy, kldivergence, Dirac

# plotting marginal normal distributions
include("normal/normal_plotting.jl")

# defines conditional mean for normal kernels
include("normal/conditionalmean.jl")
export AbstractConditionalMean, ConditionalMean, AbstractAffineMap, AffineMap, nin, nout, slope, intercept, compose

# defines normal kernels (conditional normal distributions)
include("normal/normalkernel.jl")
export NormalKernel, condition, compose, marginalise, invert, DiracKernel

# general sampling functions for kernels and Markov processes
include("sampling.jl")

# prediction step for Bayesian filtering and smoothing
include("inference/predict.jl")
export predict

# update step for Bayesian filtering and smoothing
include("inference/update.jl")
export update

# Bayesian filtering
include("inference/state_estimation.jl")
export AbstractStateEstimationProblem, HomogeneousStateEstimationProblem, filter, smoother

# helper functions
include("utilities.jl")

end
