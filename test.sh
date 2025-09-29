#!/bin/bash
# Bash shell script to run tests. 
# Runs the test and then compares the output to what is expected
# Single .c file, which expects user inputs, and then prints a final output which is checked
# This tests multiple different inputs and outputs
#
# Note to students: You dont need to fully understand this! 


echo "#####################################"
echo "       d[o_0]b ELEC2645 Bot          "
echo "#####################################"
echo "Running tests..."
echo

echo "Checking for errors..."

cases=(
  $'3\n4\n5\n6\n:15'
  $'2\n10\n20\n:30'
  $'4\n1\n2\n3\n4\n:10'
  $'1\n5\n:5'
)

failed=0

for case in "${cases[@]}"; do
  input="${case%%:*}"
  expected="${case##*:}"

  # run program, capture stdout+stderr
  output=$(echo "$input" | ./loops.out 2>&1)
  status=$?

  # remove CRs that can break matching (Windows line endings)
  clean=$(printf '%s' "$output" | tr -d '\r')

  # extract the last occurrence of "Sum = N" (allow optional spaces)
  # grep -o returns only the matched part, so we get "Sum = 15" or "Sum=15"
  actual=$(printf '%s\n' "$clean" | grep -o -E 'Sum *= *-?[0-9]+' | tail -n1)

  # normalize spacing to "Sum = N"
  actual_norm=$(printf '%s' "$actual" | sed -E 's/ *= */ = /')

  if [ $status -ne 0 ]; then
    echo "Fail: crashed (exit $status) for input -> $(echo "$input" | tr '\n' ' ')"
    echo "  Raw output: $clean"
    failed=1
    continue
  fi

  if [ -z "$actual" ]; then
    echo "Fail: no 'Sum = N' found in output for input -> $(echo "$input" | tr '\n' ' ')"
    echo "  Raw output: $clean"
    failed=1
    continue
  fi

  if [ "$actual_norm" = "Sum = $expected" ]; then
    echo "Pass: $(echo "$input" | tr '\n' ' ') => $actual_norm"
  else
    echo "Fail: $(echo "$input" | tr '\n' ' ')"
    echo "  Got:      $actual_norm"
    echo "  Expected: Sum = $expected"
    echo "  Raw output: $clean"
    failed=1
  fi
done

echo
if [ $failed -eq 0 ]; then
  echo "#####################################"
  echo "     d[o_0]b All tests passed :D    "
  echo "#####################################"
  exit 0
else
  echo "#####################################"
  echo "     d[o_0]b Some tests failed :(   "
  echo "#####################################"
  exit 1
fi
