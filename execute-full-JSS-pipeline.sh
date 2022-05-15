# JSS 2021 Experiments


# Get subjects sources and executables
./get_evaluation_project_subjects.bash

# Get RepliComment 2.0 and move in its folder
echo -e "[ cloning RepliComment 2.0 ]\n"
git clone -q https://github.com/ariannab/replicomment.git
mv subjects/ replicomment
cd replicomment/

# Generate RepliComment output folder
mkdir output
 
# Assembly RepliComment 2.0 jar with dependencies
mvn clean compile assembly:single

# Launch RepliComment 2.0 to get outputs to be fed to upDoc
java -jar target/replicomment-2.0-all.jar org.replicomment.JavadocClonesFinder
cd ..

# Get upDoc 1.0 
 curl -L -o upDoc-1.0-all.jar https://github.com/ariannab/replicomment-JSS21-experiments/releases/download/upDoc1.0/upDoc-1.0-all.jar

# Launch upDoc 1.0 on RepliComment outputs
mkdir JSS-outputs && mkdir JSS-outputs/fields 
mv replicomment/output replicomment-csv

echo "\n[ running upDoc ]\n"
echo "(expect some WARNING messages, this is fine)\n"
echo "(expect some 'unexpected empty sentence: []' messages, this is fine too)\n"

java -cp "upDoc-1.0-all.jar" "parser.RepliCmntInterpreter"

echo "\n[ experiment end ]\n"

