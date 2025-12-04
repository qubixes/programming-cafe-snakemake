# Programming café: snakemake exercises

The aim of this repository is to introduce some of the more basic features of SnakeMake. The `Snakefile` file is incomplete and the exercise is to complete it to find the primes. Documentation for snakemake on writing rules is available [here](https://snakemake.readthedocs.io/en/stable/snakefiles/rules.html).

## The exercise

Sint wants to deliver 10 million packages to households in the Netherlands, using his Pieten to distribute them. Unfortunately, Sint has an authority problem; the Pieten think Sint has run the show for long enough and though they agree to distribute the packages, numbered 0 to 9999999, this time it will be on their terms. They will deliver the packages in this order and under their terms:

- Atom Piet: Only indivisable (prime) numbers
- Professor Piet: only numbers that end with a three
- Average Piet: only numbers with an average digit of 5
- Drunk Piet: only numbers with consecutive repeated digits
- Astrology Piet: only numbers that do not have a 9 in them
- Lazy Piet: everything else, but he dumps the presents in the canal

How big is the pile of packages in the canal? Do the computation in parallel.

## Overview of the repository

- `src/create_packages.py $segment_id $segment_size $file_out`: Create packages for delivery.
- `src/deliver_packages.py $segment_id $file_in $file_out $method`: Deliver (part of the) packages, methods are 'prime', 'end_three', 'average_five', 'repeat', 'nine'.
- `src/count_remaining.py $in_file1 $in_file2 ... $out_file`: Count how many packages were delivered.
- `Snakefile`: The workflow file that you need to edit.
- `defaults.yaml`: A file with default max_prime and segments.

## Steps into getting a working workflow

### Step 1: Install Snakemake

It is recommended to install snakemake into a conda environment, although snakemake will also work with a native Python installation. Installation instruction are on the Snakemake [website](https://snakemake.readthedocs.io/en/stable/getting_started/installation.html). In addition install numpy:

```sh
conda install numpy
```

### Step 2: Copy/clone this repository

You can of course create your own workflow from scratch, but since we will probably not have enough time, the scripts to run the individual tasks are already present, see the overview above on what they do.

### Step 3: Edit the `Snakefile`

The `Snakefile` is similar to a `Makefile` for those familiar with it. There is already a skeleton so that you don't have to look through the whole documentation. Fill in the blanks of this skeleton to make the workflow run.

### Step 4: Run the workflow

To run the workflow type the following on the command line:

```sh
snakemake --cores 4
```