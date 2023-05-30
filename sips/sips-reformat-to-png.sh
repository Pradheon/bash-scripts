#!/bin/bash

#
# Copyright (c) 2023-2025 Joshan Rai <joshan.s.rai@gmail.com>
# All rights reserved
# 
# Redistribution and use in source and binary forms, with or without modification, 
# are permitted (subject to the limitations in the disclaimer below) provided that 
# the following conditions are met:
#	* Redistributions of source code must retain the above copyright notice, 
#	  this list of conditions and the following disclaimer.
#	* Redistributions in binary form must reproduce the above copyright notice, 
#	  this list of conditions and the following disclaimer in the documentation 
#	  and/or other materials provided with the distribution.
#	* Neither the name of Joshan Rai nor the names of its contributors 
#	  may be used to endorse or promote products derived from this software without 
#	  specific prior written permission. 
#
# NO EXPRESS OR IMPLIED LICENSES TO ANY PARTY'S PATENT RIGHTS ARE GRANTED BY THIS LICENSE. 
# THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND ANY 
# EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF 
# MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL 
# THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, 
# SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT 
# OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) 
# HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR 
# TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, 
# EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
#

old_regex="\.(jpeg|jpg)\.(png)$"

reformat_image() {
	for file in *; do
		if [[ "$file" == *.jpeg ]]; then
			for i in *.jpeg; do
				sips -s format png $i --out ./reformated-images/$i.png
			done
		fi
	
		if [[ "$file" == *.jpg ]]; then
			for j in *.jpg; do
				sips -s format png $j --out ./reformated-images/$j.png
			done
		fi
	done
}

copy_png() {
	for file in *; do
		if [[ "$file" == *.png ]]; then
			for k in *.png; do
				cp "$k" "./reformated-images/$k"
			done
		fi
	done
}

rename_extension() {
	for file in ./reformated-images/*; do
		if [[ "$file" =~ ${old_regex} ]]; then
			if [[ "$file" == *.jpeg.png ]]; then
				mv -- "$file" "${file%.jpeg.png}.png"
			fi
			
			if [[ "$file" == *.jpg.png ]]; then
				mv -- "$file" "${file%.jpg.png}.png"
			fi
		fi
	done
}

while true; do
	read -p "Reformat all JPEG/JPG images in current directory to PNG? (y/n) " choice
	
	echo	

	case $choice in
		[Yy]* ) mkdir "reformated-images"
			copy_png
			reformat_image
			rename_extension
			echo
			echo "Images reformated successfully"
			echo "Reformated images can be found in the 'reformated-images' directory"
			echo
			break;;
		[Nn]* ) echo "Exiting..."
			echo
			exit;;
		* ) echo "Please answer yes or no."
		    echo;;
	esac
done

