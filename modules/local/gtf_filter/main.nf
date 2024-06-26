process GTF_FILTER {
    tag "$fasta"


    input:
    path fasta
    path gtf

    output:
    path "*.filtered.gtf", emit: genome_gtf
    path "versions.yml"  , emit: versions

    when:
    task.ext.when == null || task.ext.when

    script: // filter_gtf.py is bundled with the pipeline, in nf-core/rnaseq/bin/
    """
    filter_gtf.py \\
        --gtf $gtf \\
        --fasta $fasta \\
        --prefix ${fasta.baseName}

    cat <<-END_VERSIONS > versions.yml
    "${task.process}":
        python: \$(python --version | sed 's/Python //g')
    END_VERSIONS
    """
}
