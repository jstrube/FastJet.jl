# FastJet.jl
Wrapper for using http://www.fastjet.fr/ in julia

[![Build Status](https://travis-ci.com/jstrube/FastJet.jl.svg?branch=master)](https://travis-ci.com/jstrube/FastJet.jl)

## Building from source
- Check out the binary distribution of FastJet from https://github.com/JuliaBinaryWrappers/Fastjet_jll.jl/releases
- set the environment variable FASTJET_DIR to the location of the libraries
- check out this package in julia
	```
	]
	add https://github.com/jstrube/FastJet.jl#master
	build FastJet
	test FastJet
	```
