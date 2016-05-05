This distribution is version 1.0 of the framework for the NIPS 2005 RL
Benchmarking event.

The code in this distribution is based on the University of Alberta
Reinforcement Learing Benchmarks and Bake-offs code
(http://rlai.cs.ualberta.ca/RLBB).  The most significant modification made is to
the format of the task specification string
(see http://rlai.cs.ualberta.ca/RLBB/TaskSpecification.html); we added Rmin and
Rmax (the minimum and maximum instantaneous reward respectively) to the end of
the task specification string.  Thus, the format of the task specification is
now:
    "V:E:O:A:R"
where R is Rmin,Rmax (as floats).

There are two parallel segments to the benchmarking event - the continuous, and
the discrete.  It is assumed that although agents will be developed to learn in
all the continuous domains or all the discrete domains, few if any will be built
for operation in both.  For this reason, separate instructions have been
included for continuous entries and discrete entries (see
ContinuousInstructionsC.txt and DiscreteInstructionsC.txt).  If you do wish to
enter your agent in both the continuous and discrete categories, simply follow
the steps in both instruction files.