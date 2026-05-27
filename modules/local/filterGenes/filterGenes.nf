process filterGenes {
    tag "$sample_id"
    publishDir "${params.outdir}/filtered_genes", mode: 'copy'
    conda "env.yml"

    script:
    """
    cat > filterGenes.R <<EOF
${file("${moduleDir}/filterGenes.R").text}
EOF

    Rscript filterGenes.R \
        --input "${input.genes}" \
        --output "filtered_genes.tsv"
    """
}