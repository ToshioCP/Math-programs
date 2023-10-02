class MathPrograms::ACR
  prechigh
    nonassoc UMINUS
    left '*' '/'
    left '+' '-'
  preclow
  options no_result_var
  token NUM

rule
  expression  : expression '+' expression { val[0] + val[2] }
              | expression '-' expression { val[0] - val[2] }
              | expression '*' expression { val[0] * val[2] }
              | expression '/' expression { if (val[2] != 0) then Rational(val[0], val[2]) else raise("Division by zero.") end }
              | '-' primary  =UMINUS { -(val[1]) }
              | primary
  primary     : '(' expression ')' { val[1] }
              | NUM
end

---- header

require 'strscan'

---- inner

attr_accessor :expression

def initialize expression
  @expression = expression
end

def calc
  @tokens = lex(@expression)
  do_parse
end

def lex(s)
  ss = StringScanner.new(s)
  tokens = []
  until ss.eos?
    if ss.scan(/[[:digit:]]+/)
      tokens << [:NUM, ss[0].to_i]
    elsif ss.scan(/[+\-*\/()=;]/)
      tokens << [ss[0],ss[0]]
    elsif ss.scan(/\s+/)
      # ignore spaces
    else
      raise "Unexpected character."
    end
  end
  tokens << [false, nil] # end mark
  tokens
end

def next_token
  @tokens.shift
end

---- footer
#
