#!/bin/sh

cat <<EOF
<?xml version="1.0" encoding="UTF-8"?>
<testdefinition version="1.0">
    <suite name="telepathy-mission-control-tests">
        <description>Telepathy Mission Control tests</description>
        <set name="telepathy-mission-control-tests-set">
        <pre_steps>
            <step>rm -rf /tmp/telepathy-mission-control-tests</step>
        </pre_steps>
EOF

for suite in $(cat tests/twisted/mc-twisted-tests.list)
do
    suite_name=$(echo $suite|sed 's/\//_/')
    cat <<EOF
        <case name="$suite_name">
            <step>/opt/tests/telepathy-mission-control/twisted/run-test.sh $suite</step>
        </case>
EOF
done

cat <<EOF
        </set>
    </suite>
</testdefinition>
EOF

