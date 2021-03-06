for i in {1..10}
do 
	for j in {1..10}
	do 	
		mkdir k'_'$i'_'$j
		cp ../structure_input k'_'$i'_'$j/
		cp ../mainparams k'_'$i'_'$j/
		cp ../structure k'_'$i'_'$j/
		cp ../extraparams k'_'$i'_'$j/
		sed -i '15s/.*/#define MAXPOPS    '$i'      \/\/ (int) number of populations assumed/' k'_'$i'_'$j/mainparams
		sed -i '22s/.*/#define OUTFILE  WB166_SNP426_structure_output_K'$i'_run_'$j' \/\/(str) name of output data file/' k'_'$i'_'$j/mainparams
		echo './structure' > k'_'$i'_'$j/run.sh
		chmod +x k'_'$i'_'$j/run.sh
		cd k'_'$i'_'$j
		run_script run.sh
		cd ..
	done
done
