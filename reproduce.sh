#!/bin/bash

sbt run
cp a.scala a.scala.bak

echo "NOW ADDING EXTRA DEFAULT FIELD TO CASE CLASS A"
cp a_with_new_default_field a.scala
diff a.scala.bak a.scala
sleep 5
sbt run

if [ $? != 0 ] ; then
	echo 
	echo "SBT did NOT recompile main.scala while it should (due to case class signature change)"
fi
cp a.scala.bak a.scala
