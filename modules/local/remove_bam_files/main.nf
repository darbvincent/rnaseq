process REMOVE_BAM_FILES {	
    input:
    tuple val(meta), path(bam)
    tuple val(meta), path(bai)
	
    shell:
    """
    #!/usr/bin/env bash

    rm -rf ${params.outdir}/${params.aligner}/*bam
    rm -rf ${params.outdir}/${params.aligner}/*bai
    """
}
