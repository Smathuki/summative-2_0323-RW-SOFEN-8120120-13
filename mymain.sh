#!/bin/bash

filename="students-list_0333.txt"

while true
do
    echo "Please select an option:"
    echo "1. Add student"
    echo "2. View all students"
    echo "3. Delete student by ID"
    echo "4. Update student by ID"
    echo "5. Exit"
    read option

    case $option in
        1)
            echo "Enter email: "
            read email
            echo "Enter age: "
            read age
            echo "Enter student ID: "
            read id
            echo "$id, $email, $age" >> $filenamey
            ;;
        2)
            cat $filename
            ;;
        3)
            echo "Enter the ID of the student to be deleted: "
            read id
            sed -i "/^$id,/d" $filename
            ;;
        4)
            echo "Enter the ID of the student to be updated: "
            read id
            echo "Enter new email: "
            read email
            echo "Enter new age: "
            read age
            sed -i "/^$id,/c\\$id, $email, $age" $filename
            ;;
        5)
            exit 0
            ;;
        *)
            echo "Invalid option."
            ;;
    esac
done

