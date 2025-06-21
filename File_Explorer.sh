#!/bin/bash

while true
do
    echo "===================================================================="
    echo "-----------------------File Explorer-----------------------"
    echo "===================================================================="
    
    echo "Welcome, The Main Menu is given below:"
    echo "1- List all Files and Directories"
    echo "2- Create New Folder"
    echo "3- Create New Files"
    echo "4- Delete Existing Files"
    echo "5- Rename Files"
    echo "6- Edit File Content"
    echo "7- Search Files"
    echo "8- Details of Particular File"
    echo "9- View Content of File"
    echo "10- Sort File Content"
    echo "11- Copy Files"
    echo "12- Move Files"
    echo "13- Backup File"
    echo "14- Restore File"
    echo "15- Check Disk Usage"
    echo "0- Exit"
    echo ""
    echo "What action do you want to perform?"
    echo "Enter 1-14: "
    
    read opt1

    case $opt1 in
        1)
            echo "List all files and directories here.."
            echo "Showing all files and directories...."
            sleep 3
            echo "Loading.."
            sleep 3
            echo "-------------------------------OutPut-------------------------------"
            ls
            echo " "
            echo "Press any key to return to the main menu..."
            read -n 1
            ;;
        2)
                    echo "Enter Folder Name:"
                    read foldername
                    mkdir "$foldername"
                    echo "-------------------------------OutPut-------------------------------"
                    echo "Folder Created Successfully"
                    echo " "
                    echo "Press any key to return to the main menu..."
                    read -n 1
                    ;;   
        3)
            echo "Create New Files here.."
            echo "Which type of file you want to create!"
            echo "1- .txt"
            echo "2- .sh"
            echo "Enter your choice from 1-2"
            read filechoice
            case $filechoice in
                1)
                    echo "Enter File Name without .txt Extension"
                    read filename1
                    touch "$filename1.txt"
                    echo "-------------------------------OutPut-------------------------------"
                    echo "File Created Successfully"
                    echo " "
                    echo "Press any key to return to the main menu..."
                    read -n 1
                    ;;
                2)
                    echo "Enter File Name without .sh Extension"
                    read filename2
                    touch "$filename2.sh"
                    echo "-------------------------------OutPut-------------------------------"
                    echo "File Created Successfully"
                    echo " "
                    echo "Press any key to return to the main menu..."
                    read -n 1
                    ;;
                *)
                    echo "Invalid Input..Try Again."
                    echo " "
                    echo "Press any key to return to the main menu..."
                    read -n 1
                    ;;
            esac
            ;;
        4)
            echo "Delete existing files here.."
            echo "Enter name of File you want to Delete!"
            echo "Note: Please Enter full Name with Extension."
            read -r delfile
            if [ -f "$delfile" ]; then
                echo "Are you sure you want to delete $delfile? (y/n)"
                read confirm
                echo "-------------------------------OutPut-------------------------------"

                if [ "$confirm" = "y" ]; then
                    rm "$delfile"
                    echo "Successfully Deleted."
                    echo " "
                else
                    echo "File deletion cancelled."
                fi
            else
                echo "File Does not Exist..Try again"
            fi
            echo " "
            echo "Press any key to return to the main menu..."
            read -n 1
            ;;
        5)
            echo "Rename files here.."
            echo "Enter Old Name of File with Extension.."
            read old
            echo "Checking for file..."
            sleep 3
            if [ -f "$old" ]; then
                echo "Ok File Exist."
                echo "Now Enter New Name for file with Extension"
                read new
                mv "$old" "$new"
                echo "Successfully Renamed."
                echo "Now Your File Exists with $new Name"
            else
                echo "$old does not exist..Try again with correct filename."
            fi
            echo " "
            echo "Press any key to return to the main menu..."
            read -n 1
            ;;
        6)
            echo "Edit file content here.."
            echo "Enter File Name with Extension : "
            read edit
            echo "-------------------------------OutPut-------------------------------"
            echo "Checking for file.."
            sleep 3
            if [ -f "$edit" ]; then
                echo "Opening file.."
                sleep 3
                xdg-open "$edit"
                echo " "
            else
                echo "$edit File does not exist..Try again."
            fi
            echo "Press any key to return to the main menu..."
            read -n 1
            ;;
        7)
            echo "Search files here.."
            echo "1- By Name"
            echo "2- By Pattern"
            echo "3- By Modification Date"
            echo "4- By Size"
            echo "Enter your choice from 1-4"
            read searchOpt
            case $searchOpt in
                1)
                    echo "Enter File Name with Extension to search"
                    read f
                    echo "Searching for $f File"
                    find / -name "$f" 2>/dev/null
                    ;;
                2)
                    echo "Enter pattern to search (e.g., *.txt):"
                    read pattern
                    echo "Searching for files matching $pattern"
                    find / -name "$pattern" 2>/dev/null
                    ;;
                3)
                    echo "Enter modification time (e.g., -1 for last 1 day):"
                    read time
                    echo "Searching for files modified in the last $time days"
                    find / -mtime "$time" 2>/dev/null
                    ;;
                4)
                    echo "Enter size (e.g., +1M for greater than 1MB):"
                    read size
                    echo "Searching for files larger than $size"
                    find / -size "$size" 2>/dev/null
                    ;;
                *)
                    echo "Invalid Input..Try Again."
                    ;;
            esac
            echo " "
            echo "Press any key to return to the main menu..."
            read -n 1
            ;;
        8)
            echo "Detail of file here.."
            echo "Enter File Name with Extension to see Detail : "
            read detail
            echo "-------------------------------OutPut-------------------------------"
            echo "Checking for file.."
            sleep 4
            if [ -f "$detail" ]; then
                echo "Loading Properties.."
                stat "$detail"
            else
                echo "$detail File does not exist..Try again"
            fi
            echo " "
            echo "Press any key to return to the main menu..."
            read -n 1
            ;;
        9)
            echo "View content of file here.."
            echo "Enter File Name : "
            read readfile
            echo "-------------------------------OutPut-------------------------------"
            if [ -f "$readfile" ]; then
                echo "Showing file content.."
                sleep 3
                cat "$readfile"
            else
                echo "$readfile does not exist"
            fi
            echo " "
            echo "Press any key to return to the main menu..."
            read -n 1
            ;;
        10)
            echo "Sort files content here.."
            echo "Enter File Name with Extension to sort :"
            read sortfile
            echo "-------------------------------OutPut-------------------------------"
            if [ -f "$sortfile" ]; then
                echo "Sorting File Content.."
                sleep 3
                sort "$sortfile"
            else
                echo "$sortfile File does not exist..Try again."
            fi
            echo " "
            echo "Press any key to return to the main menu..."
            read -n 1
            ;;
        11)
            echo "Copy files here.."
            echo "Enter the source file name with extension: "
            read srcfile
            echo "Enter the destination directory: "
            read destdir
            echo "-------------------------------OutPut-------------------------------"
            if [ -f "$srcfile" ]; then
                if [ -d "$destdir" ]; then
                    cp "$srcfile" "$destdir/"
                    echo "File copied successfully to $destdir."
                else
                    echo "$destdir is not a valid directory. Try again."
                fi
            else
                echo "$srcfile does not exist. Try again."
            fi
            echo " "
            echo "Press any key to return to the main menu..."
            read -n 1
            ;;
        12)
            echo "Move files here.."
            echo "Enter the source file name with extension: "
            read srcfile
            echo "Enter the destination directory: "
            read destdir
            echo "-------------------------------OutPut-------------------------------"
            if [ -f "$srcfile" ]; then
                if [ -d "$destdir" ]; then
                    mv "$srcfile" "$destdir/"
                    echo "File moved successfully to $destdir."
                else
                    echo "$destdir is not a valid directory. Try again."
                fi
            else
                echo "$srcfile does not exist. Try again."
            fi
            echo "Press any key to return to the main menu..."
            read -n 1
            echo " "
            echo "Press any key to return to the main menu..."
            read -n 1
            ;;
        13)
            echo "Backup file here.."
            echo "Enter the file name to backup: "
            read backupfile
            echo "-------------------------------OutPut-------------------------------"
            if [ -f "$backupfile" ]; then
                cp "$backupfile" "$backupfile.bak"
                echo "Backup created as $backupfile.bak"
            else
                echo "File does not exist. Try again."
            fi
            echo "Press any key to return to the main menu..."
            read -n 1
            ;;
        14)
            echo "Restore file here.."
            echo "Enter the backup file name to restore: "
            read restorefile
            echo "-------------------------------OutPut-------------------------------"
            if [ -f "$restorefile.bak" ]; then
                cp "$restorefile.bak" "$restorefile"
                echo "File restored from $restorefile.bak"
            else
                echo "Backup file does not exist. Try again."
            fi
            echo "Press any key to return to the main menu..."
            read -n 1
            ;;
        15)
            echo "Checking disk usage..."
            echo "-------------------------------OutPut-------------------------------"
            df -h
            echo "Press any key to return to the main menu..."
            read -n 1
            ;;
        0)
            echo "Good Bye.."
            echo "Successfully Exit"
            break
            ;;
        *)
            echo "Invalid Input..Try again...."
            ;;
    esac
done

