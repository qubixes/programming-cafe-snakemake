configfile: "defaults.yaml"  # Configuration can be set from the command line with --config x=...

SEGMENT_SIZE=config["segment_size"]
N_SEGMENTS=config["segments"]

# Rule to create the final delivery notice
rule all:
    input:
        [ ... ]
    params:
        input_files = " ".join( ... )
    output:
        "sinterklaas.txt"
    shell:
        ...

# Rule to create all packages for delivery
rule create:
    output:
        "new_{i_segment}.npy"
    shell:
        ...

# Rule to deliver all prime numbered packages
rule prime:
    input:
        ...
    output:
        ...
    shell:
        "python src/deliver_packages.py ..."

# More rules here