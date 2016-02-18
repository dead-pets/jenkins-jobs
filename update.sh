#!/bin/bash

dir=`dirname $0`

if [ -f ${dir}/venv/bin/activate ]; then
  . ${dir}/venv/bin/activate
fi

jenkins-jobs --conf ${dir}/jenkins_jobs.ini update ${dir}/jobs/
