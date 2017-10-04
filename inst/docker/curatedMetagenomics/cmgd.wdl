task pipeline {
  String sample
  Array[String] runs

  command {
    /root/curatedMetagenomicData_pipeline.sh ${sample} "${sep=' ' runs}"
  }

  output { 
    File genefamilies           = "genefamilies/${sample}.tsv"
    File genefamilies_relab     = "genefamilies_relab/${sample}.tsv"
    File marker_abundance       = "marker_abundance/${sample}.tsv"
    File marker_presence        = "marker_presence/${sample}.tsv"
    File metaphlan_bugs_list    = "metaphlan_bugs_list/${sample}.tsv"
    File pathabundance          = "pathabundance/${sample}.tsv"
    File pathabundance_relab    = "pathabundance_relab/${sample}.tsv"
    File pathcoverage           = "pathcoverage/${sample}.tsv"
    Array[File] humann2_temp    = glob("humann2_temp/*")
  }
  runtime {
    docker: "teamcgc/curatedmetagenomicdata"
    memory: "8GB"
    cpu: "2"
    disks: "local-disk 150 SSD"
    bootDiskSizeGb: 50
  }
}	

workflow test {
  String sample
  Array[String] runs

  call pipeline {
    input: sample=sample, runs=runs
  }
}
