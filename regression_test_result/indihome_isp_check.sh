#!/bin/bash
START=$(date +%s)
TIMESTAMP=`date -u +"%Y-%m-%d %T"`
PARENTDIR="$(dirname "$(pwd)")"
FILE1="judol_myrepublik_query.txt"
FILE2="judol_biznet_query.txt"
FILE3="judol_indihome_query.txt"
echo "# Title: Regression dns query test against local ISP" > $FILE3
echo "# Homepage: https://github.com/BrigsLabs/judol " >> $FILE3
echo "# Issues: https://github.com/BrigsLabs/judol/issues " >> $FILE3
echo "# Expires: 30 days " >> $FILE3
echo "# TIME :" $TIMESTAMP >> $FILE3
echo ' ' >> $FILE3
dig @192.168.1.1 +noall +answer +comments +timeout=10 +tries=5 -f $PARENTDIR/judol_domains.txt >> $FILE3
echo ' '>> $FILE3
BLOCK=`grep -wc "36.86.63.185" $FILE3`
NX=`grep -wc "NXDOMAIN" $FILE3`
FAIL=`grep -wc "SERVFAIL" $FILE3`
echo "# Counted Result " >> $FILE3
echo ' ' >> $FILE3
echo "BLOCK         : $BLOCK" >> $FILE3
echo "NX            : $NX" >> $FILE3
echo "FAIL          : $FAIL" >> $FILE3
END=$(date +%s)
echo "Time consumed : $END-$START seconds"
