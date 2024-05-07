CPATH='.:lib/hamcrest-core-1.3.jar:lib/junit-4.13.2.jar'

rm -rf student-submission

#Clone the repository of the student submission to a well-known directory name (provided in starter code)
git clone $1 student-submission 
echo 'Finished cloning'

#Check that the student code has the correct file submitted. If they didn’t, detect and give helpful feedback about it.
cd student-submission

if [[ -e ListExamples.java ]]
    then echo "ListExamples found"
else
    echo "ListExamples missing" >&2
    exit 1
fi

#Somehow get the student code and your test .java file into the same directory
mkdir lib
cp ../lib/* ./lib
cp ../*.java .

echo 'Finished setting tester'

#Compile your tests and the student’s code from the appropriate directory with the appropriate classpath commands. 
#If the compilation fails, detect and give helpful feedback about it.
javac -cp $CPATH *.java 2> javac-err.txt
if [[ $? -ne 0 ]]
then
    cat javac-err.txt 
fi
echo 'finished checking compilation'

#Run the tests and report the grade based on the JUnit output.
java -cp $CPATH org.junit.runner.JUnitCore TestListExamples
echo 'finished running'


# Draw a picture/take notes on the directory structure that's set up after
# getting to this point

# Then, add here code to compile and run, and do any post-processing of the
# tests
