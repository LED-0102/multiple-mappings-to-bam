process RUN_SMALT {

    container 'quay.io/ssd28/gsoc-experimental/run-smalt:0.0.1'

    tag "${name}"
    
    input:
    val ref
    val fastqdir
    val name
    val pairedend
    val runname
    val domapping
    val newsmalt
    val tmpname
    val bam

    output:
    env cmdline, emit: cmdline

    script:
    """

    smaltoutput="bam"
    smaltoutputsuffix="bam"
    rbit=""
    cmdline=""

    if [ "${domapping}" = "true" ]; then

        if [ "${newsmalt}" = "true" ]; then
            smaltoutput="bam"
            smaltoutputsuffix="bam"
        else
            smaltoutput="samsoft"
            smaltoutputsuffix="sam"
        fi

        if [ "${pairedend}" = "true" ]; then
            if [ "${params.maprepeats}" = "true" ]; then
                smalt map -y ${params.nomapid} -x -r 0 -i ${params.maxinsertsize} -j ${params.mininsertsize} -f \$smaltoutput -o ${runname}/tmp1.\$smaltoutputsuffix ${tmpname}.index ${fastqdir}${name}_1.fastq ${fastqdir}${name}_2.fastq
                cmdline="map -y ${params.nomapid} -x -r 0 -i ${params.maxinsertsize} -j ${params.mininsertsize} -f \$smaltoutput -o ${runname}/tmp1.\$smaltoutputsuffix ${tmpname}.index ${fastqdir}${name}_1.fastq ${fastqdir}${name}_2.fastq"
            else
                if [ "${newsmalt}" = "true" ]; then
                    rbit=" -r -1"
                else
                    rbit=""
                fi
                smalt map -y ${params.nomapid}\$rbit -x -i ${params.maxinsertsize} -j ${params.mininsertsize} -f \$smaltoutput -o ${runname}/tmp1.\$smaltoutputsuffix ${tmpname}.index ${fastqdir}${name}_1.fastq ${fastqdir}${name}_2.fastq
                cmdline="map -y ${params.nomapid}\$rbit -x -i ${params.maxinsertsize} -j ${params.mininsertsize} -f \$smaltoutput -o ${runname}/tmp1.\$smaltoutputsuffix ${tmpname}.index ${fastqdir}${name}_1.fastq ${fastqdir}${name}_2.fastq"
            fi
        else
            if [ "${params.maprepeats}" = "true" ]; then
                smalt map -y ${params.nomapid} -x -r 0 -f \$smaltoutput -o ${runname}/tmp1.\$smaltoutputsuffix ${tmpname}.index ${fastqdir}${name}.fastq
                cmdline="map -y ${params.nomapid} -x -r 0 -f \$smaltoutput -o ${runname}/tmp1.\$smaltoutputsuffix ${tmpname}.index ${fastqdir}${name}.fastq"
            else
                if [ "${newsmalt}" = "true" ]; then
                    \$rbit=" -r -1"
                else
                    \$rbit=""
                fi
                smalt map -y ${params.nomapid}\$rbit -x -f \$smaltoutput -o ${runname}/tmp1.\$smaltoutputsuffix ${tmpname}.index ${fastqdir}${name}.fastq
                cmdline="map -y ${params.nomapid}\$rbit -x -f \$smaltoutput -o ${runname}/tmp1.\$smaltoutputsuffix ${tmpname}.index ${fastqdir}${name}.fastq"
            fi
        fi

        if [ "${newsmalt}" = "false" ]; then
            samtools view -b -S ${runname}/tmp1.sam -t ${ref}.fai > ${runname}/tmp1.bam
            rm ${runname}/tmp1.sam
        fi
    else
        cp ${bam} ${runname}/tmp1.bam
    fi

    if [ "${fastqdir}" = "${tmpname}_unzipped/" ]; then
        rm ${fastqdir}${name}_1.fastq ${fastqdir}${name}_2.fastq
    fi
    """
}
