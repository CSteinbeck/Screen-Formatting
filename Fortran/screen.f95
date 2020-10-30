!!Colton Steinbeck
!!Screen formatting using Fortran
program Screen
 !!Define Globals
character(:), allocatable :: long_string, word, line, lineMin, lineMax
integer :: charCount, lineCount, i, j, wordCount, filesize
!!real, dimension(0:60) :: min_size, max_size

!!Calling subroutines (functions)
interface
!!Pulls in input file
subroutine read_file( string, filesize )
character(:), allocatable :: string
integer :: filesize
end subroutine read_file

function FormatNum(in) result(out)
character(*),intent(in) :: in
character(:), allocatable :: out, string, Fstring
integer :: index, findex
end function FormatNum


end interface

!!Main Program
call read_file(long_string,filesize)
long_string = FormatNum(long_string)
!!print*, long_string

line=""
i=1
j=1
charCount=0
lineCount=1
wordCount=0
do while(j .ne. filesize + 1)
    if((long_string(j:j) .eq. " ") .or. (iachar(long_string(j:j)) .eq. 10)) then !!!if the long_string(j) equals a space or end line
        allocate(character(j-i):: word) !!Allocate space in memory for a word    
        word=long_string(i:j) !!Define the word as a string between i and j
    if(charCount .eq. 0) then
        write(*, fmt="(i9,a2)", advance="no")lineCount," " !!Creation of cardinal lines
    endif
    if(charCount+len(trim(word)).le. 60) then
        wordcount= wordcount+ 1
        line =line//trim(adjustl(word))  !!Appending the new word to the blank line
        if(charCount .lt. 60) then
        line =line // " "
        charCount= charCount + 1
        i=j
        endif
        charCount= charCount+len(trim(word))
        
    else
        if(lineCount .eq. 1) then
            lineMin = lineMin // line
            lineMax = lineMax // line
        endif
        !!Max Check
        if(len(line) .le. len(lineMax)) then
            lineMax =  line
        endif
        !!!!! Min Check
        if(len(line) .le. len(lineMin)) then
            lineMin = line
        endif  
    print*,line
    charCount=0
    line=""
    lineCount= lineCount+1
    wordCount=0
    endif
    deallocate(word)

  endif
    j=j+1
enddo
    if(len(line) .ge. len(lineMax)) then
        lineMax =  line
    endif
    !!!!! Min Check
    if(len(line) .le. len(lineMin)) then
        lineMin =line
    endif
print*,line
print*, "Here is the longest line:", lineMax
print*, "Here is the shortest line:", lineMin
end program Screen

!!Subroutine Definitions!!
subroutine read_file(string, filesize)
    character(:), allocatable       :: string
    character(50)                   :: filename
    integer                         :: counter
    integer                         :: filesize

    character(LEN=1)                :: input
    !!Calls Users input on the command line while running the code
    call get_command_argument(1, filename)
    inquire(file=filename, size=filesize)
    open(unit=5,status="old",access="direct",form="unformatted",recl=1,file=filename)
    allocate(character(filesize)    :: string)

    counter = 1
    100 read (5, rec = counter, err = 200) input
    if(iachar(input) .eq. 10) then
    input= " "
    endif
    string(counter:counter) = input
    counter = counter + 1
    goto 100

    200 continue

    counter = counter - 1
    close(5)
end subroutine read_file

function FormatNum(in) result(out)
character(*),intent(in) :: in
character(:), allocatable :: out, tempString, Fstring
integer :: index, findex

tempString=in
allocate(character(len(tempString)) :: Fstring)
index = 1
findex = 1
do while(index .le. len(tempString))
    !!Ignores numbers 0-9
    if ( iachar(tempString(index:index)) .le. 47 .or. iachar(tempString(index:index)) .ge. 58) then
         Fstring(findex:findex) = tempString(index:index) !!
         findex=findex+1
    endif
    index= index + 1
enddo
out = Fstring
end function FormatNum



