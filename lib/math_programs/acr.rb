module MathPrograms
  # Arithmetic Calculator with rational numbers
  class ACR
    attr_accessor :expression

    def initialize expression
      @expression = expression
    end

    def calc
      evaluate(parse(lex()))
    end

    private

    # Token kind: num, +, -, *, /, ( and )
    # Space kind is ignored.
    # Token: [token kind, semantic value]
    #   example: [:num, 10], [:'+', nil], ...
    def lex
      s = @expression
      result = []
      while true
        break if s == ""
        case s[0]
        when /[[:digit:]]/
          m = /\A([[:digit:]]+)/.match(s)
          result << [:num, m[1].to_i]
          s = m.post_match
        when /[+\-*\/()]/
          result << [s[0].to_sym, nil]
          s = s[1..-1]
        when /\s/
          s = s[1..-1] 
        else
          raise "Unexpected character."
        end
      end
      result
    end

    # BNF
    # expression: expression '+' factor
    #   | expression '-' factor
    #   | factor
    #   | '-' factor
    #   ;
    # factor: factor1 '*' primary
    #   | factor1 '/' primary
    #   | primary
    #   ;
    # primary: NUM
    #   | '(' expression ')'
    #   ;
    #
    # Node: [:num, value], [operator, node left, node right] or [:uminus, node]
    def parse(tokens)
      expression(tokens)
    end

    def expression(tokens)
      return nil if tokens == []
      case tokens[0][0]
      when :'-'
        tokens.delete_at(0)
        node = factor(tokens)
        return nil unless node
        node = [:uminus, node]
      else
        node = factor(tokens)
        return nil unless node
      end
      while (op = tokens[0].to_a[0]) && (op == :'+' || op == :'-')
        expression = node # reduce
        tokens.delete_at(0)
        case op
        when :'+'
          node = factor(tokens)
          return nil unless node
          node = [:'+', expression, node]
        when :'-'
          node = factor(tokens)
          return nil unless node
          node = [:'-', expression, node]
        end
      end
      node
    end

    def factor(tokens)
      return nil if tokens == []
      node = primary(tokens)
      return nil unless node
      while (op = tokens[0].to_a[0]) && (op == :'*' || op == :'/')
        factor = node # reduce
        tokens.delete_at(0)
        case op
        when :'*'
          node = primary(tokens)
          return nil unless node
          node = [:'*', factor, node]
        when :'/'
          node = factor(tokens)
          return nil unless node
          node = [:'/', factor, node]
        end
      end
      node
    end

    def primary(tokens)
      return nil if tokens == []
      case tokens[0][0]
      when :'num'
        node = [:'num', tokens[0][1]]
        tokens.delete_at(0)
      when :'('
        tokens.delete_at(0)
        node = expression(tokens)
        return nil unless node
        return nil if tokens[0][0] != :')'
        tokens.delete_at(0)
      end
      node
    end

    # Evaluate the tree node
    def evaluate(node)
      return nil unless node
      case node[0]
      when :num
        node[1]
      when :uminus
        -evaluate(node[1])
      when :'+'
        evaluate(node[1])+evaluate(node[2])
      when :'-'
        evaluate(node[1])-evaluate(node[2])
      when :'*'
        evaluate(node[1])*evaluate(node[2])
      when :'/'
        Rational(evaluate(node[1]),evaluate(node[2]))
      else
        nil
      end
    end
  end
end
