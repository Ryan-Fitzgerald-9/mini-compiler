PYTHON="python3"
COMPILER="minicompiler.py"
CC="gcc"

function comp_and_run {
    INPUT_FILE="$1"
    BN=$(basename -s .mini "$INPUT_FILE")
    TTOUTPUT=$(${PYTHON} ${COMPILER} "$INPUT_FILE" 2>&1)
    if [ $? -ne 0 ]; then
        echo "${TTOUTPUT}"
    else
        ${CC} -o "${BN}_output" output.c
        if [ $? -ne 0 ]; then
            echo "Compilation failed"
        else
            ./${BN}_output
        fi
    fi
}

if [ $# -eq 0 ]; then
    echo "No input file provided"
    exit 1
fi

for input_file in "$@"; do
    if [[ $input_file == *.mini ]]; then
        comp_and_run "$input_file"
    else
        echo "Invalid input file: $input_file. Skipping."
    fi
done