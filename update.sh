#!/bin/bash

dir=`dirname $0`

jenkins-jobs --conf ${dir}/jenkins_jobs.ini update ${dir}/jobs/
