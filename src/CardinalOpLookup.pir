=head1 NAME

CardinalOpLookup -- A lookup table for opcodes

=head1 SYNOPSYS

  .sub _main :main
      load_bytecode 'CardinalOpLookup.pir'

      .local pmc oplookup
      .local string op
 
      # Retrieve the subroutine
      oplookup = find_global 'CardinalOpLookup', 'lookup'

      # Translate operator name to PASM opcode name
      op = oplookup($S1)

      ... # Do something with the opcode name

      end
  .end

=head1 DESCRIPTION

CardinalOpLookup is a module for looking up the translation between a Cardinal
operator name (as defined in the operator precedence parser), and the
equivalent PASM opcode name. Eventually this will be implemented as a
data file, possibly in YAML.

=cut

.namespace [ 'CardinalOpLookup' ]

.sub _load :load
    .local pmc lookuptable
    lookuptable = new .Hash
    _add_entry(lookuptable, '+', 'add')
    _add_entry(lookuptable, '-', 'sub')
    _add_entry(lookuptable, '*', 'mul')
    _add_entry(lookuptable, '/', 'div')
    _add_entry(lookuptable, '%', 'mod')

    _add_entry(lookuptable, '<<', 'shl')
    _add_entry(lookuptable, '>>', 'shr')
    _add_entry(lookuptable, '&', 'band')
    _add_entry(lookuptable, '|', 'bor')
    _add_entry(lookuptable, '^', 'bxor')

    _add_entry(lookuptable, '=', 'set')

    # These look odd, I know, but the logic is actually cleaner when
    # it's reversed.
    _add_entry(lookuptable, 'if', 'unless')
    _add_entry(lookuptable, 'unless', 'if')
    _add_entry(lookuptable, 'elsif', 'unless')
    _add_entry(lookuptable, 'infix:+', 'add')
    _add_entry(lookuptable, 'infix:-', 'sub')
    _add_entry(lookuptable, 'infix:*', 'mul')
    _add_entry(lookuptable, 'infix:/', 'div')
    _add_entry(lookuptable, 'infix:%', 'mod')
    _add_entry(lookuptable, 'infix:x', 'repeat')
    _add_entry(lookuptable, 'infix:.', 'concat')

    _add_entry(lookuptable, 'infix:<<', 'shl')
    _add_entry(lookuptable, 'infix:>>', 'shr')
    _add_entry(lookuptable, 'infix:&', 'band')
    _add_entry(lookuptable, 'infix:|', 'bor')
    _add_entry(lookuptable, 'infix:^', 'bxor')

    _add_entry(lookuptable, 'infix:=', 'set')

    # These look odd, I know, but the logic is actually cleaner when
    # it's reversed.
    _add_entry(lookuptable, 'if', 'unless')
    _add_entry(lookuptable, 'unless', 'if')
    _add_entry(lookuptable, 'elsif', 'unless')

    store_global 'CardinalOpLookup', 'lookuptable', lookuptable
.end

.sub lookup
    .param string opname
    .local pmc lookuptable
    lookuptable = find_global 'CardinalOpLookup', 'lookuptable'
    $S1 = lookuptable[ opname ]
    .return ($S1)
.end

.sub _add_entry
    .param pmc lookuptable
    .param string key
    .param string value
    $P1 = new .String
    $P1 = value
    lookuptable[ key ] = $P1
.end


=head1 LICENSE

Copyright (C) 2006, The Perl Foundation.

This is free software; you may redistribute it and/or modify
it under the same terms as Parrot.

=head1 AUTHOR

Allison Randal <allison@perl.org>

=cut