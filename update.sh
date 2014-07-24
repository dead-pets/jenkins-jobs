#!/bin/bash

dir=`dirname $0`

${dir}/jenkins-jobs --conf ${dir}/jenkins_jobs.ini update ${dir}/jobs/
