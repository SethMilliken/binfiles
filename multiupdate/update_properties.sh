#!/bin/bash
#FILE=/Users/sethm/Documents/sandbox/nimblefish/iv4/release/iv4_1.21/conf/prod03/common/catalina_home/common_classes/log4j.properties
DIR=/Users/sethm/Documents/sandbox/nimblefish/iv4/release/iv4_1.21/conf
#find ${DIR} -name log4j.properties -exec echo {} \;
#find ${DIR} -name log4j.properties -exec grep ConversionPattern {} \;
find ${DIR} -name log4j.properties -exec p4 edit -c 22919 {} \;
find ${DIR} -name log4j.properties -exec vim -S new_conversion_pattern.ex {} \;
find ${DIR} -name log4j.properties -exec grep ConversionPattern {} \;
#more ${FILE}
