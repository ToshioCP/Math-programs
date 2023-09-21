# Mathematics programs

This repository includes programs for mathematics.

- axby1.rb: Solves the equation ax+by=1. All the variables are integer. The coefficients a and b must be coprime.
- unit\_fractions: This library extends Rational class. The method "generate\_unit\_fractions" generates a sum of unit fractions.
This is seen in the Rhind Mathematical Papyrus.
- e10p.rb: Solves a extended TenPuzzle like this.
Find an expression with integers 1,2,3,4,5 and +-\*/() and the value equals 9.
One of the answer is -1+2\*3+4=9.

# Demo

A file "demo.rb" is a demo program.

```
$ ruby demo.rb
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
This app finds an expression with the numbers and basic arithmetic operations and its value equals the sum you gave.
Input integers a, b, ... and sum.
Delimit the arguments with blank character.
> 2 4 5 6 24
[2, 4, 5, 6], 24
5*6-(2+4)
```

# License

GPL.
See [GNU General Public License](https://www.gnu.org/licenses/gpl-3.0.html).