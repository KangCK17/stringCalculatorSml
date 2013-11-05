String calculator kata (wip)

if you use vim to run the tests you can use this map, opening both the files in two split areas:
:map ,t :w! \| !cat calculator.sml test.sml \| sml \| less 

issues: naming convention, more tests for negative behavior (invalid separators)

