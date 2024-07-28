#!/bin/bash
START=$(date +%s)
TIMESTAMP=`date -u +"%Y-%m-%d %T"`
PARENTDIR="$(dirname "$(pwd)")"
FILE1="judol_myrepublik_query.txt"
FILE2="judol_biznet_query.txt"
FILE3="judol_indihome_query.txt"
echo "# Title: Regression dns query test against local ISP" > $FILE2
echo "# Homepage: https://github.com/BrigsLabs/judol " >> $FILE2
echo "# Issues: https://github.com/BrigsLabs/judol/issues " >> $FILE2
echo "# Expires: 30 days " >> $FILE2
echo "# TIME :" $TIMESTAMP >> $FILE2
echo ' ' >> $FILE2
dig @192.168.18.1 +noall +answer +comments +timeout=10 +tries=5 -f $PARENTDIR/judol_domains.txt >> $FILE2
echo ' '>> $FILE2
BLOCK=`grep -wc "202.169.44.80" $FILE2`
NX=`grep -wc "NXDOMAIN" $FILE2`
FAIL=`grep -wc "SERVFAIL" $FILE2`
echo "# Counted Result " >> $FILE2
echo ' ' >> $FILE2
echo "BLOCK         : $BLOCK" >> $FILE2
echo "NX            : $NX" >> $FILE2
echo "FAIL          : $FAIL" >> $FILE2
END=$(date +%s)
echo "Time consumed : $(($END-$START)) seconds" >> $FILE2
