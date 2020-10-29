with Ada.Command_Line;
use Ada.Command_Line;
with Ada.Strings; --used for space trimming
use Ada.Strings;
with Ada.Strings.Unbounded; -- Turning the file into one long string
use Ada.Strings.Unbounded;
with Ada.IO_Exceptions;
use Ada.IO_Exceptions;
with Ada.Text_IO;
use Ada.Text_IO;
with Ada.Text_IO.Unbounded_IO;
use Ada.Text_IO.Unbounded_IO;

procedure sf is

    In_File : Ada.Text_IO.File_Type;
    long_string, word , line :Ada.Strings.Unbounded.Unbounded_String;
    j,k, charCount, lineCount, wordcount : Integer;
    
    X : String := argument (1);

begin
    
    Ada.Text_IO.Open (File => In_File, Mode => Ada.Text_IO.In_File, Name => X);
 
    while not Ada.Text_IO.End_Of_File(In_File) loop --Looping through the file
        --Converting the file into one long string--
        Ada.Strings.Unbounded.Append(Source => long_string, New_Item => Ada.Text_IO.Get_Line(File => In_File)); --Keeps appending the new line until the file is finished
        Ada.Strings.Unbounded.Append(Source => long_string, New_Item => (" "));--Inputs a space so it doesnt append the new line character
     end loop;

     --Number Reformattiong
    for i in 1..Length(long_string) loop
        if element(long_string, i) = '1' then
           replace_element(long_string,i,' ');
        elsif element(long_string, i) = '2' then
           replace_element(long_string,i,' ');
        elsif element(long_string, i) = '3' then
           replace_element(long_string,i,' ');
        elsif element(long_string, i) = '4' then
           replace_element(long_string,i,' ');
        elsif element(long_string, i) = '5' then
           replace_element(long_string,i,' ');
        elsif element(long_string, i) = '6' then
           replace_element(long_string,i,' ');
        elsif element(long_string, i) = '7' then
           replace_element(long_string,i,' ');
        elsif element(long_string, i) = '8' then
           replace_element(long_string,i,' ');
        elsif element(long_string, i) = '9' then
           replace_element(long_string,i,' ');
        elsif element(long_string, i) = '0' then
           replace_element(long_string,i,' ');            
        end if;
    end loop;

    j := 1;
    lineCount := 1;
    wordcount :=1;
    charCount :=1;
    --line := "";
    for i in 1..length(long_string) loop
        if element(long_string,i) = ' ' then
            word := Unbounded_Slice(long_string,j,i);
            --if charCount = 0 then ---Loop to print the cardinals numbers on the line
            trim(word,left);
            trim(word,right);
            --end if;
            if(charCount +length(word) <= 60) then -- If the overall characther count is less than 60
                wordcount := wordcount + 1;
                --Ada.Text_IO.Unbounded_IO.Put_Line(word);
                Ada.Strings.Unbounded.Append(Source => line, New_Item => word); --New item is the item that is appended, source is where it is going
                --FPut(Integer'image(wordcount)); --prints wordcount
                if(charCount <= 60) then
                  Ada.Strings.Unbounded.Append(Source => long_string, New_Item => (" ")); --Creates a space between words
                  charCount := charCount + 1;
                end if;
                charCount := charCount+ length(word);
                j := i;
                Ada.Strings.Unbounded.Append(Source => line, New_Item => (" "));
            else
            Put_Line (line);
            charCount:=0;
            delete(line,1,Length(line));
            linecount := lineCount + 1;
            wordCount:=0;
            end if;
            
        end if;
        
    end loop;
Put_Line (line); --Prints the remaining elements in the line
    --Put_Line(long_string);
end sf;