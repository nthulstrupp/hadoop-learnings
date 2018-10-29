## Step 1: replacing the parameters manually does't work so we do it manually
## https://issues.apache.org/jira/browse/SPARK-13983

FILENAME=$1
#ignore first parameter1
shift

# iterate starting with second parameter
while test ${#} -gt 0
do
	PARAMETER=$1
	#PARAMETER="var1=2"
	A="$(echo $PARAMETER | cut -d'=' -f1)"
	B="$(echo $PARAMETER | cut -d'=' -f2)"

	# replace arguments in file
	sed -i "s/\${$A}/$B/" $FILENAME
	shift
done

## Step 2 : calling beeline
#cat $FILENAME
beeline  -u 'jdbc:hive2://localhost:10001/default;'  -n 'username'  -p 'password' -f $FILENAME --hiveconf test.conf=1