#!/bin/bash
# Created with https://github.com/dart-lang/mono_repo

if [ -z "$PKG" ]; then
  echo -e '\033[31mPKG environment variable must be set!\033[0m'
  exit 1
fi

if [ "$#" == "0" ]; then
  echo -e '\033[31mAt least one task argument must be provided!\033[0m'
  exit 1
fi

pushd $PKG
pub upgrade || exit $?

EXIT_CODE=0

while (( "$#" )); do
  TASK=$1
  case $TASK in
  command_0) echo
    echo -e '\033[1mTASK: command_0\033[22m'
    echo -e 'pub run test'
    pub run test || EXIT_CODE=$?
    ;;
  command_1) echo
    echo -e '\033[1mTASK: command_1\033[22m'
    echo -e 'pub run build_runner build --fail-on-severe'
    pub run build_runner build --fail-on-severe || EXIT_CODE=$?
    ;;
  command_2) echo
    echo -e '\033[1mTASK: command_2\033[22m'
    echo -e 'pub run build_runner test -- --platform=chrome -j1'
    pub run build_runner test -- --platform=chrome -j1 || EXIT_CODE=$?
    ;;
  dartanalyzer_0) echo
    echo -e '\033[1mTASK: dartanalyzer_0\033[22m'
    echo -e 'dartanalyzer --fatal-warnings --options=analysis_options.yaml .'
    dartanalyzer --fatal-warnings --options=analysis_options.yaml . || EXIT_CODE=$?
    ;;
  dartanalyzer_1) echo
    echo -e '\033[1mTASK: dartanalyzer_1\033[22m'
    echo -e 'dartanalyzer --fatal-warnings .'
    dartanalyzer --fatal-warnings . || EXIT_CODE=$?
    ;;
  dartanalyzer_2) echo
    echo -e '\033[1mTASK: dartanalyzer_2\033[22m'
    echo -e 'dartanalyzer --fatal-warnings lib test'
    dartanalyzer --fatal-warnings lib test || EXIT_CODE=$?
    ;;
  dartfmt) echo
    echo -e '\033[1mTASK: dartfmt\033[22m'
    echo -e 'dartfmt -n --set-exit-if-changed .'
    dartfmt -n --set-exit-if-changed . || EXIT_CODE=$?
    ;;
  test) echo
    echo -e '\033[1mTASK: test\033[22m'
    echo -e 'pub run test -p vm'
    pub run test -p vm || EXIT_CODE=$?
    ;;
  *) echo -e "\033[31mNot expecting TASK '${TASK}'. Error!\033[0m"
    EXIT_CODE=1
    ;;
  esac

  shift
done

exit $EXIT_CODE
