#!/usr/bin/sbcl --script
;;;Colton Steinbeck
;;;Screen Formatting in Lisp;;;
(defvar fl) ;; Command-Line arg that will be looped through
(defvar instance "");;Char item that is monitored
(defvar i 0) ;;Sets the index to zero for looping
(defvar j 0)
(defvar index 0)
(defvar word1 "")
(defvar word2)
(defvar long_string)
(defvar ModLine "") ;;line item that the chars are inserted into
(defvar ModSpace "")
(defvar lineMin "")
(defvar lineMax "")
(defvar charCount 0) ;;# of chars taken in
(defvar lineCount 1);; # of lines counted 
(defvar wordcount 0) ;; Word count for the new line
;;;;;;;;;;;;;;
;;;;;;;;;;;Input Sequence for the file
(setq fl (open (car(cdr *posix-argv* ) ) ) );;;;;;;;;;;;Opens the given file that the user inputs
(setq long_string (make-string (file-length fl))) ;;Sets the new string size to the size of the originalFile
;;(setq line(length long_string))
           (loop for instance = (read-char fl nil :eof) ; stream, no error, :eof value
                  until (eq instance :eof)
                        do
                        (cond ((or (char> instance #\9 ) (char< instance #\0 ) )
                              (progn
                              ;;(write-line "Test")
                              (setf (aref long_string i) instance)
                              (incf i)))
                        )            
            )
                              ;;(concatenate 'string long_string (list #\space ))
                  (loop until (= index (length long_string))
                        do
                        (cond ((char= #\space (aref long_string index)) ;; if the long_string[i] = " "
                              (progn
                                    ;;(setq charCount (length ModLine))
                                    (setf word1 (subseq long_string j index)) ;;Sets the word as the length from the j=0 to the index
                                    (setf word1 (string-left-trim '(#\space #\newline) word1) ) ;; Trims spaces
                                    (setf word1 (string-right-trim '(#\space #\newline) word1)) ;; Trims spaces

                                    ;;(princ word1)
                                    ;;
                                    
                              );;end of progn
                              (setf charCount (+ (length ModLine)(length word1)))
                              (if(<= charCount 60)
                                    (progn
                                    (setf wordcount (+ wordcount 1))
                                    (setf ModLine (concatenate 'string ModLine(string word1)))
                                    (if(< charCount 60)
                                          (setf ModLine (concatenate 'string ModLine(string " ")))
                                    )
                                    (setf j index)   
                              )
                              (setf charCount (+ charCount (length word1)))
                              
                              )
                                
                              
                              
                              
                            );;End of char
                        );;end of the cond
                  ; (incf lineCount)
                  ; (setq word1 (make-string 0))
                  ; (setf charCount 0)
                  ; (setf wordcount 0)
                  (incf index) ;;Increments the index
                  );;end of loop
(print ModLine)
(terpri)
;;(print "The word count is:"wordcount)          
;;(format t "~a" line)
(close fl)
;;(format t "The number of lines is ~2d" lineCount)
;;(terpri)
;;(close fl)