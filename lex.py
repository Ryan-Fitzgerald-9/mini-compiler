class Lexer:
    def _init_(self, source):
        self.source = source + '\n'  # Source code to lex as a string
        self.curChar = ''
        self.curPos = -1
        self.nextChar()

    # Process the next character
    def nextChar(self):
        self.curPos += 1
        if self.curPos >= len(self.source):
            self.curChar = '\0'  # EOF
        else:
            self.curChar = self.source[self.curPos]

    # Return the lookahead character
    def peek(self):
        if self.curPos + 1 >= len(self.source):
            return '\0'
        return self.source[self.curPos+1]

    # Invalid token found, print error message and exit
    def abort(self, message):
        pass

    # Skip whitespace except new lines, use to indicate the end of a statement
    def skipWhitespace(self):
        pass

    # Skip comments in code
    def skipComment(self):
        pass

    # Return the next token
    def getToken(self):
        pass