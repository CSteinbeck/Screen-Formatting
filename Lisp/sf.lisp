#!/usr/bin/sbcl --script
;;;Colton Steinbeck
;;;Screen Formatting in Lisp;;;
(defvar line)
(defvar charCount)
(defvar charCount 0)
(defvar wordCount)
(setf wordCount 0)
(defvar lineCount)
(setf lineCount 1)
(defvar originalFile)
(defvar long_string)
;;(defvar prev)
;;(setf prev #\p )
(defvar index)
(setf index 0)
;;;;;;;;;;;;;;
;;;;;;;;;;;Input Sequence for the file
(setq originalFile (open (car(cdr *posix-argv* ) ) ) );;;;;;;;;;;;Opens the given file that the user inputs
      (setf long_string (make-string (file-length originalFile))) ;;Sets the new string size to the size of the originalFile
      (loop for instance = (read-char originalFile nil :eof ) ; stream, no error, :eof value
                  until (eq instance :eof )
                  do
                  ;(print instance)
                  (cond 
                        ((or ( char> instance #\9 ) (char< instance #\0 ) )
                  
                        (cond
                              ((and(char/= instance #\NewLine )(char/= instance #\Space )
                              (setf(aref originalFile index ) long_string)    
                              (setf prev instance) ;;Setting previous to current
                              (setf index (+ index 1))))
                        ) ;;End of the Loop
                                              
                        
                        
                        
                        
                        )    
                        
                        
                  
                  )

  
      ) ;;end of instance loop

princ(long_string)
;;(format t "The number of lines is ~2d" lineCount)
;;(terpri)
;;(close fl)