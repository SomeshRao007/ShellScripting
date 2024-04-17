#!/bin/bash
case $1 in
        "--create")
                echo "Creating new file $2"
                echo
                touch $2
                ;;
        "--delete")
                echo "Deleting file $2"
                echo
                rm $2
                ;;
        *)
                echo "Not a valid argument"
                echo
                ;;
esac
