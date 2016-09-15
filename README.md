<!--[![Platforms](http://www.bioconductor.org/shields/availability/devel/curatedMetagenomicData.svg)](https://www.bioconductor.org/packages/devel/bioc/html/curatedMetagenomicData.html#archives)-->
[![Travis-CI Build Status](https://travis-ci.org/schifferl/curatedMetagenomicData.svg?branch=master)](https://travis-ci.org/schifferl/curatedMetagenomicData)
[![AppVeyor Build Status](https://ci.appveyor.com/api/projects/status/github/schifferl/curatedMetagenomicData?branch=master&svg=true)](https://ci.appveyor.com/project/schifferl/curatedMetagenomicData)
[![Coverage Status](https://img.shields.io/codecov/c/github/schifferl/curatedMetagenomicData/master.svg)](https://codecov.io/github/schifferl/curatedMetagenomicData?branch=master)
<!--[![Commits](http://www.bioconductor.org/shields/commits/bioc/curatedMetagenomicData.svg)](https://www.bioconductor.org/packages/devel/bioc/html/curatedMetagenomicData.html#svn_source)-->
<!--[![Downloads](http://www.bioconductor.org/shields/downloads/curatedMetagenomicData.svg)](https://bioconductor.org/packages/stats/bioc/curatedMetagenomicData)-->

# curatedMetagenomicData

`curatedMetagenomicData` is an `ExperimentHub` package for accessing a large 
number (n ~ 3000) of human microbiome samples gathered from various sources.

## Using Existing Data

`curatedMetagenomicData` and its related data are accessed through `R` using 
`BioConductor` & `ExperimentHub`.
    
## Adding New Data

### Input Files
    
Input files are `*.tar.gz` files sourced from `HUMAnN2` & `MetaPhlAn2` outputs 
with the expectation of a specific directory structure. An example directory 
structure from which an actual dataset was created is shown below. The name of 
each directory is used in the creation of its related data product, with `*.tsv`
(tab seperated values) files representing each sample. Additionally, a 
`metadata.tsv` file containing phenotype data is expected in the `metadata` 
directory. The `*.tar.gz` of the directory structure shown below (i.e. 
`LomanNJ_2013_Mi.tar.gz`) would represent the input file needed to create 
`ExpressionSet` objects.

```
LomanNJ_2013_Mi/
├── genefamilies_relab
│   ├── OBK1122.tsv
│   ├── OBK1196.tsv
│   ├── OBK1253.tsv
│   ├── OBK2535.tsv
│   ├── OBK2638.tsv
│   ├── OBK2723.tsv
│   ├── OBK4096.tsv
│   ├── OBK4328.tsv
│   └── OBK4961.tsv
├── marker_abundance
│   ├── OBK1122.tsv
│   ├── OBK1196.tsv
│   ├── OBK1253.tsv
│   ├── OBK2535.tsv
│   ├── OBK2638.tsv
│   ├── OBK2723.tsv
│   ├── OBK4096.tsv
│   ├── OBK4328.tsv
│   └── OBK4961.tsv
├── marker_presence
│   ├── OBK1122.tsv
│   ├── OBK1196.tsv
│   ├── OBK1253.tsv
│   ├── OBK2535.tsv
│   ├── OBK2638.tsv
│   ├── OBK2723.tsv
│   ├── OBK4096.tsv
│   ├── OBK4328.tsv
│   └── OBK4961.tsv
├── metadata
│   └── metadata.tsv
├── metaphlan_bugs_list
│   ├── OBK1122.tsv
│   ├── OBK1196.tsv
│   ├── OBK1253.tsv
│   ├── OBK2535.tsv
│   ├── OBK2638.tsv
│   ├── OBK2723.tsv
│   ├── OBK4096.tsv
│   ├── OBK4328.tsv
│   └── OBK4961.tsv
├── pathabundance_relab
│   ├── OBK1122.tsv
│   ├── OBK1196.tsv
│   ├── OBK1253.tsv
│   ├── OBK2535.tsv
│   ├── OBK2638.tsv
│   ├── OBK2723.tsv
│   ├── OBK4096.tsv
│   ├── OBK4328.tsv
│   └── OBK4961.tsv
└── pathcoverage
    ├── OBK1122.tsv
    ├── OBK1196.tsv
    ├── OBK1253.tsv
    ├── OBK2535.tsv
    ├── OBK2638.tsv
    ├── OBK2723.tsv
    ├── OBK4096.tsv
    ├── OBK4328.tsv
    └── OBK4961.tsv
```

### `ExpressionSet` Objects

`ExpressionSet` objects are created, serialized, and saved using the `make_data()` 
function. A single argument, `tar_gz_file`, representing the path of `*.tar.gz` 
file is passed to the function. For example:

```
make_data("~/LomanNJ_2013_Mi.tar.gz")
```

Internally the `make_data()` function will unzip the file into the `./tmp` 
directory of the package and read in the sample & experiment data. The process 
happens in parallel and will take minutes to hours depending on CPU cores & the 
number of samples within the dataset. Once read in the samples and metadata and 
processed and coerced into `ExpressionSet` objects. These objects are then split 
into smaller `ExpressionSet` objects by bodysite and saved as compressed `Rda` 
files in the `./data` directory of the package.

### `ExpressionSet` Documentation



### `ExperimentHub` Metadata



### `ExperimentHub` Upload


