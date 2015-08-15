#!/bin/bash
set -e
set -o pipefail

project="$(git remote -v | head -n1 | awk '{{print $2}}' | sed -e 's,.*:\(.*/\)\?,,' -e 's/\.git$//')"
export PATH=$PATH:/usr/local/bin/

git_sha1="$(git rev-parse HEAD)"
res_build_date=$(date -u +"%Y-%m-%d_%H-%M-%S")

# set once, functe config file could be use to avoid such hardcoded path
dir_result="$HOME/functest/results"

# Several information are required: date and testbed
# date is generated by functest so on the artifact, the results shall be under functest/<testbed id>/date/
testbed="$(hostname)"
project_artifact=$project/$testbed/$res_build_date

# copy folder to artifact
if [ -d "$dir_result" ]; then
    if [ "$(ls -A $dir_result)" ]; then
          echo "copy result files to artifact $project_artifact"
          gsutil cp -r "$dir_result" gs://artifacts.opnfv.org/"$project_artifact"/
    else
          echo "Result folder is empty"
    fi
else
    echo "No result folder found"
fi
