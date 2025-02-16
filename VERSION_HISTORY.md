### ARM
* file adapted to be built on Apple Silicon
  * `ubuntu` `16.04` -> `22.04`
  * `python` `3.5` -> `3.9`
  * `Miniconda2-latest-Linux-x86_64.sh` -> `Miniconda3-latest-MacOSX-arm64.sh`


### v43
* extract-norm
  * `hic2cool` `0.4.1` -> `0.5.1`
  * `hic2cool extract-norms -e <hic file> <cooler file>`
  * A bug in MT exclusion which caused an error in chicken is now fixed.
* cooler
  * `cooler` `0.7.6` -> `0.8.3`
  * `cooler zoomify --balance --balance-argss "--convergence-policy store_nan"`
  * For resolutions where balancing doesn't converge, now it stores NaN as weight vector instead of throwing an error.
  * pairs file coordinates are now considered 0-based (instead of 1-based).
* remove `extract-mcool-normvector-for-juicebox` (remove output file normvector_juicerformat as well)
* nore, nonorm, norenonorm variants are now merged into a single workflow `hi-c-processing-pairs`
* `pairsamtools` `eccd21` -> `pairtools` `0.2.2`
  * The lossless bam file and filtered pairs files are exactly the same between the two versions.

### v42.3
* CWL version `1.0` is used instead of `draft-3`.

### v42.2
* pairix version 0.3.6, that fixed integer overflow for total line count (`pairix -n`)
* cwl and runscript for pairsqc updated to include -M option.

### v42.1
* run-cool2multirescool.sh now has an option -B to skip balancing
* run-juicebox-pre.sh now has an option -B to skip balancing
* Additional cwls : hi-c-processing-pairs-nore.cwl, hi-c-processing-pairs-nonorm.cwl, hi-c-processing-pairs-nore-nonorm.cwl

### v42
* pairsamtools parse now reports double-closed intervals (change in position of reverse-oriented reads)
* newly introduced pairsamtools bug of not reporting lines after dedup-marked ones now fixed
* pairsqc 0.2.3
* `run-addfrag2pairs.sh` has an option to do nothing (-0, not adding frag info).
* `run-juicebox-pre.sh` now has options for mapq filtering (-q) and custom resolutions (-u) and the usage has changed.
* `run-cool2multirescool.sh` now has -j option (juicer resolutions) and -u option (custom resolutions) and the usage has changed.
* juicer_tools version 1.8.9_jcuda8
* `run-mcool2hic.sh` now has custom_res option (-u) and the usage has changed.
* `mcool2hic` updated to handle custom-resolution mcool.

### v41
* version updates for `bwa`, `pairix`, `cooler`, `pairsamtools`, `hic2cool`, `juicebox`
* annotation for software now includes TYPE and SOURCE_URL
* pairsamtools parse now has MAPQ score added.

### v40
* pairsamtools pipeline added

### v39
* bwa-mem 0.7.16a-r1185-dirty
* run-bwa-mem.sh copies input files to output directory, so that unzipping doesn't change input files.
* fastqc temporarily off

### v38
* mmool2hic is modified to avoid readonly input file issue in cwl-runner.

### v37
* pairix 0.2.4 -> 0.2.5
* updated pairsamtools version
* More organized Docker source file format

### v36
* `run-bwa-mem.sh` uses `-SP5M` flag instead of `-SP5`.

### v35
* pairix 0.2.4

### v34
* pairix 0.2.3 : this may be a critical fix for cooler because cooler installation automatically installs pypairix 0.2.3, which used a different index structure from pairix 0.2.2. This causes cooler to attempt to use an infinite amount of memory.

### v33
* run-add-hicnormvector-to-mcool.sh can take other file extensions than .mcool for input.

### v32
* fastqc 0.11.5 is added

### v31
* pairix 0.2.2 (fixed old_merged_nodup2pairs.pl -s option)
* `time` is installed (`/usr/bin/time` can be used to benchmark runtime and maxmem)

### v30
* added chunksize to run-cooler-balance.sh and run-cool2multirescool.sh

### v29
* added max_split to run-cooler.sh

### v28
* added java maxmem to run-juiceboxpre.sh

### v27
* pairsamtools is now installed.

### v26
* pairix 0.2.0 instead of 0.1.9, which fixed split_sort option not working.

### v25
* pairix 0.1.9 instead of 0.1.8, which allows mapq filtering for `merged_nodups2pais.pl`.

### v24
* Tentative mcool2hic is included.
* hic2cool with a script extracting only normvector from hic to add to mcool is added.

### v23
* In this version, a forked version of hic2cool (derived from v0.3.5) is used that fixed a problem.

### v22.5
* In this version a forked version of juicer with parallel sorting option is used.

### v21
* Now run-juicer.sh has number of cores as an argument.

### v20
* Now juicer 1.5.5 is used. A problem of exiting with error code 100 when -S early option is used is now fixed.

### v19
* run-juicer.sh now copies (instead of moving) input files to the output directory (instead of to an internal directory) and directly uses the output directory to run juicer (instead of running it internally and copying the output files later to the output directory)
* run-juicer.sh now can deal with read name difference between mates in SRA-downloaded fastq files (by removing .1 and .2 before feeding to juicer)

### v18
* run-juicer.sh now copies the align directory (instead of just merged_nodups.txt file in the align directory) to output directory

### v17
* hic2cool now installed from repo

### v16
* run-cooler.sh now does not do balancing.
* A new script run-cooler-balance.sh does matrix balancing.

### v15
* juicer_tools for juicebox alias is not juicer_tool.jar to avoid conflict with juicer_tool in juicer directory

### v14
* run-merge-pairs.sh now handles headers.

### v13
* run-juicer.sh now working properly.
* run-juicer.sh has an additional outdir argument.
* pairix/util is added to PATH, so merged_nodup2pairs.pl now works without full path.
* run-juicer.sh now prints out juicer stdout log to stderr.

### v10
* cooler version 0.7.4
* run-cool2multirescool.sh now uses zoomify --balance

### v9
* run-juicer.sh is now included.
* hic2cool is now included.
* pairix 0.1.6 and cooler 0.7.3 (updated version) are now used.
* run-juicebox-pre.sh now has an option to include HiGlass-compatible resolution set
* run-cool2multirescool.sh now uses zoomify instead of coarsegrain

### v8
* juicer and juicer_tools installed.
* run-addfrag2pairs.sh and run-juicebox-pre.sh added 
* pairix version 0.1.1
* bam2pairs depricated (now a part of pairix 0.1.1)

### v7
* fixed run-pairsqc-single.sh issue with output directory '.'
* modified run-cool2multirescool.sh usage (added outprefix so it doesn't try to modify read-only input directory).
* added test for run-cool2multirescool.sh
* added a larger test file for cooler, so the balancing doesn't fail sometimes.

### v6
* updated tests for pairsqc

### v5
* run-pairsqc-single.sh available now.

### v4
* updated cooler (Issues with pairix file input have been resolved)
* run-cool2multirescool.sh available now.
* pairsqc is installed now. R and Java are also installed as dependency (both are needed for nozzle).
* Usage for run-cooler.sh changed (ncores added)

### v3
* updated cooler

### v2
* updated merge-pairs

### v1 (20170303)
* First release
