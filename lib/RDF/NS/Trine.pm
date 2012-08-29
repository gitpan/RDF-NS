use strict;
use warnings;
package RDF::NS::Trine;
{
  $RDF::NS::Trine::VERSION = '20120829';
}
#ABSTRACT: Popular RDF namespace prefixes from prefix.cc as RDF::Trine nodes

use RDF::Trine::Node::Resource;
use RDF::Trine::Node::Blank;

use base 'RDF::NS';

sub GET {
    RDF::Trine::Node::Resource->new($_[1]);
}

sub BLANK {
	RDF::Trine::Node::Blank->new($2) if $_[1] =~ /^_(:(.*))?$/;
}

1;


__END__
=pod

=head1 NAME

RDF::NS::Trine - Popular RDF namespace prefixes from prefix.cc as RDF::Trine nodes

=head1 VERSION

version 20120829

=head1 SYNOPSIS

  use RDF::NS::Trine;
  use constant NS => RDF::NS::Trine->new('20120829');

  NS->foaf_Person;        # a RDF::Trine::Node::Resource
  NS->URI('foaf:Person);  # same
  NS->foaf_Person->uri;   # http://xmlns.com/foaf/0.1/Person

  NS->_;                  # a RDF::Trine::Node::Blank
  NS->_abc;               # a blank node with id 'abc'
  NS->URI('_:abc');       # same

=head1 DESCRIPTION

In contrast to L<RDF::NS>, which should be consulted for documentation, this
returns no plain string URIs but instances of L<RDF::Trine::Node::Resource>
or L<RDF::Trine::Node::Blank>.

Before using this module, make sure to install L<RDF::Trine>, which is not
installed automatically together with L<RDF::NS>!

=head1 AUTHOR

Jakob Voss

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2012 by Jakob Voss.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut

