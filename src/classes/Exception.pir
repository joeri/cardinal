.namespace ['CardinalException']

.sub 'onload' :anon :init :load
    .local pmc meta, proto, core_type, hll_type, interp
    meta = get_hll_global ['CardinalObject'], '!CARDINALMETA'
    proto = meta.'new_class'('CardinalException', 'parent'=>'parrot;Exception CardinalObject')

    core_type = get_class 'Exception'
    hll_type = get_class 'CardinalException'

    interp = getinterp
    interp.'hll_map'(core_type, hll_type)

    proto = meta.'new_class'('NoMemoryError', 'parent'=>'CardinalException')
    
    proto = meta.'new_class'('ScriptError', 'parent'=>'CardinalException')
    proto = meta.'new_class'('LoadError', 'parent'=>'ScriptError')
    proto = meta.'new_class'('NotImplementedError', 'parent'=>'ScriptError')
    proto = meta.'new_class'('SyntaxError', 'parent'=>'ScriptError')

    proto = meta.'new_class'('SignalException', 'parent'=>'CardinalException')
    proto = meta.'new_class'('Interrupt', 'parent'=>'SignalException')

    proto = meta.'new_class'('StandardError', 'parent'=>'CardinalException')
    proto = meta.'new_class'('ArgumentError', 'parent'=>'StandardError')
    proto = meta.'new_class'('IOError', 'parent'=>'StandardError')
    proto = meta.'new_class'('EOFError', 'parent'=>'IOError')
    proto = meta.'new_class'('IndexError', 'parent'=>'StandardError')
    proto = meta.'new_class'('LocalJumpError', 'parent'=>'StandardError')
    proto = meta.'new_class'('NameError', 'parent'=>'StandardError')
    proto = meta.'new_class'('NoMethodError', 'parent'=>'NameError')
    proto = meta.'new_class'('RangeError', 'parent'=>'StandardError')
    proto = meta.'new_class'('FloatDomainError', 'parent'=>'RangeError')
    proto = meta.'new_class'('RegexpError', 'parent'=>'StandardError')
    proto = meta.'new_class'('RuntimeError', 'parent'=>'StandardError')
    proto = meta.'new_class'('SecurityError', 'parent'=>'StandardError')
    proto = meta.'new_class'('SystemCallError', 'parent'=>'StandardError')
    proto = meta.'new_class'('SystemStackError', 'parent'=>'StandardError')
    proto = meta.'new_class'('ThreadError', 'parent'=>'StandardError')
    proto = meta.'new_class'('TypeError', 'parent'=>'StandardError')
    proto = meta.'new_class'('ZeroDivisionError', 'parent'=>'StandardError')
    
    proto = meta.'new_class'('SystemExit', 'parent'=>'CardinalException')
    proto = meta.'new_class'('fatal', 'parent'=>'CardinalException')
.end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:

