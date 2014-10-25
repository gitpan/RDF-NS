use strict;
use warnings;
package RDF::NS::Trine;
{
  $RDF::NS::Trine::VERSION = '20120917';
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

version 20120917

=head1 SYNOPSIS

  use RDF::NS::Trine;
  use constant NS => RDF::NS::Trine->new('20120917');

  NS->foaf_Person;        # iri('http://xmlns.com/foaf/0.1/Person')
  NS->uri('foaf:Person);  #  same RDF::Trine::Node::Resource
  NS->foaf_Person->uri;   # http://xmlns.com/foaf/0.1/Person

  NS->_;                  # RDF::Trine::Node::Blank
  NS->_abc;               # blank node with id 'abc'
  NS->uri('_:abc');       # same

=head1 DESCRIPTION

RDF::NS::Trine works like L<RDF::NS> but it returns instances of
L<RDF::Trine::Node::Resource> (and L<RDF::Trine::Node::Blank> instead of
strings.

Before using this module, make sure to install L<RDF::Trine>, which is not
installed automatically together with L<RDF::NS>!

=head1 ADDITIONAL METHODS

=head1 BLANK ( [ $short ] )

Returns a new L<RDF::Trine::Node::Blank>.

=head1 AUTHOR

Jakob Voss

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2012 by Jakob Voss.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut

