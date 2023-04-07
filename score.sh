#!/bin/bash
score=0

#checking config.xml
(grep -i "/projects/challenge" /var/lib/jenkins/jobs/Maven_reports/config.xml) > /dev/null 2>&1;
if [ $? -eq 0 ]; then
score=$((score + 10)) && echo 'p1'
fi;

(grep -i "H 9 \* \* 1" /var/lib/jenkins/jobs/Maven_reports/config.xml) > /dev/null 2>&1;
if [ $? -eq 0 ]; then
score=$((score + 10)) && echo 'p2'
fi;

(grep -i "test" /var/lib/jenkins/jobs/Maven_reports/config.xml) > /dev/null 2>&1;
if [ $? -eq 0 ]; then
score=$((score + 10)) && echo 'p3'
fi;

(grep -i "\*.xml" /var/lib/jenkins/jobs/Maven_reports/config.xml) > /dev/null 2>&1;
if [ $? -eq 0 ]; then
score=$((score + 10)) && echo 'p4'
fi;

#checking Maven_reports workspace
(sudo find /var/lib/jenkins/workspace/Maven_reports/target/surefire-reports/*.xml) > /dev/null 2>&1;
if [ $? -eq 0 ]; then
score=$((score + 10)) && echo 'p5'
fi;

(sudo find /var/lib/jenkins/workspace/Maven_reports/pom.xml) > /dev/null 2>&1;
if [ $? -eq 0 ]; then
score=$((score + 10)) && echo 'p6'
fi;

#checking the logs
(sudo find /var/lib/jenkins/jobs/Maven_reports/builds -name log -exec grep -o -e "Tests run: 11" -e "Failures: 0" -e "Errors: 0" {} \;) > /dev/null 2>&1;
if [ $? -eq 0 ]; then
score=$((score + 20)) && echo 'p7'
fi;

#checking build SUCCESS
(sudo find /var/lib/jenkins/jobs/Maven_reports/builds -name log -exec grep -o 'Finished: SUCCESS' {} \;) > /dev/null 2>&1;
if [ $? -eq 0 ]; then
score=$((score + 20)) && echo 'p8'
fi;

echo "FS_SCORE:$score%"