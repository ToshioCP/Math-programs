# Mathematics programs

This repository includes libraries for mathematics.

- `axby1.rb`: Solves the equation ax+by=1. All the variables are integer. The coefficients a and b must be coprime.
- `unit_fractions`: This library extends Rational class. The method "generate\_unit\_fractions" generates a sum of unit fractions.
This is seen in the Rhind Mathematical Papyrus.
- `e10p.rb`: Solves a extended TenPuzzle like this.
Find an expression with integers 1,2,3,4,5 and +-\*/() and the value equals 9.
One of the answer is -1+2\*3+4=9.
- `acr.rb`: Arithmetic Calculator with Rational numbers.
For example, if "1/2+1/3" is given, it finds 5/6.

# Installation

1. Build the gem. Type "gem build math_programs".
2. Install the gem. Type "gem install math_programs-0.1.gem".

# Demo

A command "mp23" is available.
It has subcommands.

- demo
- axby1
- unit_fractions
- e10p
- acr

The subcommand "demo" demonstrates all the features.

```
$ ruby mp23 demo
----- axby1.rb -----
Input a and b.
Delimit the arguments with blank character.
> 4 9
4 x (7) + 9 x (-3) = 1
----- unit_fractions.rb -----
Input a and b.
Delimit the arguments with blank character.
> 3 5
3/5 = 1/2 + 1/10
----- e10p.rb (extracted TenPuzzle) -----
This app finds an expression with the numbers and basic arithmetic operations and its calculation result equals what you gave.
Delimit the arguments with blank character.
> 2 4 5 6 24
[2, 4, 5, 6], 24
5*6-(2+4)
----- acr.rb (Arithmetic Calculator with Rational numbers) -----
This app calculates an expression with rational numbers.
Give an expression with rational numbers.
For example, 1/2+1/3.
> 2/3+4*5/6
4
```

# License

GPL.
See [License.md](License.md).