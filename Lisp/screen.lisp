#!/usr/bin/sbcl --script
;;;Colton Steinbeck
;;;Screen Formatting in Lisp;;;
(defvar fl)
(defvar line)
(defvar charCount)
(defvar )
(defvar lineCount)
(setf lineCount 0)
;;;;;;;;;;;;;;
(defun formatNum(string)
(setf fstring "") 
    (loop for index across string 
        do(if(or(and(>= (char-code index) 48(<= char-code index) 57) and() ))))
        )

)




;;;;;;;;;;;Input Sequence for the file
(setq fl (open "test.txt" ) )

      (loop for line = (read fl nil :eof) ; stream, no error, :eof value
                  until (eq line :eof)
                        do (write line )
                        (incf lineCount)
      )
(format t "The number of lines is ~2d" lineCount)
(terpri)
(close fl)