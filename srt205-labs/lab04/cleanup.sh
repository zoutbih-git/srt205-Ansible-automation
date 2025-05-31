#!/bin/bash
#this script deletes the /tmp/test_file_delete.tmp file if it exists

if [ -f /tmp/test_file_delete.tmp ]; then
	rm /tmp/test_file_delete.tmp
fi
