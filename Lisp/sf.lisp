#!/usr/bin/sbcl --script
;;;Colton Steinbeck
;;;Screen Formatting in Lisp;;;
(defvar fl) ;; Command-Line arg that will be looped through
(defvar instance "");;Char item that is monitored
(defvar i 0) ;;Sets the index to zero for looping
(defvar j 0)
(defvar words)
(defvar long_string)
(defvar line "") ;;line item that the chars are inserted into
(defvar lineMin)
(defvar lineMax)
(defvar charCount 0) ;;# of chars taken in
(defvar lineCount 1);; # of lines counted 
(defvar wordcount 0) ;; Word count for the new line
;;;;;;;;;;;;;;
;;;;;;;;;;;Input Sequence for the file
(setq fl (open (car(cdr *posix-argv* ) ) ) );;;;;;;;;;;;Opens the given file that the user inputs
(setq long_string (make-string (file-length fl))) ;;Sets the new string size to the size of the originalFile
(setq line(length long_string))
           (loop for instance = (read-char fl nil :eof) ; stream, no error, :eof value
                  until (eq instance :eof)
                        do
                        (cond ((or (char> instance #\9 ) (char< instance #\0 ) )
                              (progn
                              ;;(write-line "Test")
                              (setf (aref long_string i) instance)
                              (incf i)
                              (princ instance) 
                              ))
                       )            
            )

;;(write instance)          
;;(format t "~a" line)
(close fl)
;;(format t "The number of lines is ~2d" lineCount)
;;(terpri)
;;(close fl)