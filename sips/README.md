# DISCLAIMER

- Please read 'LICENSE.txt' regarding usage, derviative works, and redistribution.
- The bash scripts only operate on the LINUX and UNIX operating systems
- You may need some experience with the LINUX/UNIX command line (see 'NOTES' for resources on the UNIX shell)

# TUTORIAL
## macOSX
	1. Open a Terminal instance
		a. To open Terminal, open your Applications > Utilities folder and find "Terminal" or press `cmd+space` to open Spotlight
		b. In the Spolight Search type "Terminal"
		c. Open Terminal by pressing `Return`
	2. Change directories to the directory with the images to be modified
		a. To change directories, type `cd` followed by the directory name (usage: `cd <directory_name>`)
			i. Additionally, you may type `ls -F` for a list of files in the working directory
	3. Move the bash script you need to the directory with the images to be modified
		a. If you need to reformat images, use `sips-reformat-to-png.sh`
		b. If you need to resample images, use `sips-resample-image.sh`
		c. If you need to use both:
			i. Move `sips-reformat-to-png.sh` to the directory and run it first
			ii. Move `sips-resample-image.sh` to the `reformated-images` directory made by `sips-reformat-to-png.sh` then run `sips-resample-image.sh`
	4. Run either file with the following command:
		a. To reformat images, type `./sips-reformat-to-png.sh`
		b. To resample images, type `./sips-resample-images.sh`

# NOTES
## Learn the UNIX shell
- https://swcarpentry.github.io/shell-novice/

# CONTACT

For questions or concerns, please contact Joshan Rai via [joshan.s.rai@gmail.com](mailto:joshan.s.rai@gmail.com)
