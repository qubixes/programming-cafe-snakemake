configfile: "defaults.yaml"  # Configuration can be set from the command line with --config x=...

SEGMENT_SIZE=config["segment_size"]
N_SEGMENTS=config["segments"]

# Rule to execute the whole workflow and create the density figure.
rule all:
    input:
        [f"nine_{i_segment}.npy" for i_segment in range(N_SEGMENTS)]
    params:
        input_files = " ".join(f"nine_{i}.npy" for i in range(N_SEGMENTS))
    output:
        "sinterklaas.txt"
    shell:
        "python src/count_remaining.py {params.input_files} {output}"

rule create:
    output:
        "new_{i_segment}.npy"
    shell:
        "python src/create_packages.py {wildcards.i_segment} " + str(SEGMENT_SIZE) + " {output}"

rule prime:
    input:
        "new_{i_segment}.npy"
    output:
        "prime_{i_segment}.npy"
    shell:
        "python src/deliver_packages.py {wildcards.i_segment} {input} {output} prime"

rule three:
    input:
        "prime_{i_segment}.npy"
    output:
        "three_{i_segment}.npy"
    shell:
        "python src/deliver_packages.py {wildcards.i_segment} {input} {output} end_three"

rule five:
    input:
        "three_{i_segment}.npy"
    output:
        "five_{i_segment}.npy"
    shell:
        "python src/deliver_packages.py {wildcards.i_segment} {input} {output} average_five"

rule repeat:
    input:
        "five_{i_segment}.npy"
    output:
        "repeat_{i_segment}.npy"
    shell:
        "python src/deliver_packages.py {wildcards.i_segment} {input} {output} repeat"

rule nine:
    input:
        "repeat_{i_segment}.npy"
    output:
        "nine_{i_segment}.npy"
    shell:
        "python src/deliver_packages.py {wildcards.i_segment} {input} {output} nine"
