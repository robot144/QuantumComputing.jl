# QuantumComputing.jl

While reading "Quantum Computer Science" by M. David Mermin, it made sense for me to implement the operators described in there, to gain a better unerstanding of what they entail. The language of Julia seemed a good fit for this because of the ease in which one can express mathematical operators as well as its speed. The latter is somewhat relevant as 'simulators' of quantum computers grow exponentially slower with the number of Qbits involved. This is not a full blown quantum simulator, nor does it incoporate GPU or parallel computing capabilities. It is however, quite simple in implementation and should be(come) useful for moderately sized experiments.

*Note that this is a work in progress. Little is actually working at the moment*

## If you want to try anyway:

- Clone or download this repository
- Cd the folder
- Start Julia
	- `julia --project`
	- or:
		- `julia`
		- `using Pkg`
		- `Pkg.activate(".")`
- Run unit tests
	- Pkg.test("QuantumComputing")

## Some examples

- `using QuantumComputing`
- `x=ket_zero(3)   # x= |000>`
- `X!(x,1)         # x= |001> operator applied in place`
- `X!(x,2)         # x= |011>`
- `v=ket_zero(2,1) # v= |01>`
- `Z!(v,1)         # v=-|01>`
- `w=Z(v,1)        # w= |01>`
- `p=ket_zero(1)   # p= |0>`
- `H!(p,1)         # p= sqrt(1/2) (|0> + |1>)`
