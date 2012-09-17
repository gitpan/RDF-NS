use strict;
use warnings;
package RDF::NS::URIS;
{
  $RDF::NS::URIS::VERSION = '20120917';
}
#ABSTRACT: Popular RDF namespace prefixes from prefix.cc as URI objects

use URI;
use base 'RDF::NS';

sub GET {
    URI->new($_[1]);
}

1;


__END__
=pod

=head1 NAME

RDF::NS::URIS - Popular RDF namespace prefixes from prefix.cc as URI objects

=head1 VERSION

version 20120917

=head1 SYNOPSIS

  use RDF::NS::URIS;
  use constant NS => RDF::NS::URIS->new('20120917');

  NS->foaf_Person;             # an URI object
  NS->uri('foaf:Person);       # same
  NS->foaf_Person->as_string;  # http://xmlns.com/foaf/0.1/Person

=head1 DESCRIPTION

RDF::NS::URIS works like L<RDF::NS> but it returns instances of L<URI> instead
of plain strings. You must have installed module L<URI> to use this package.

=head1 SEE ALSO

L<URI::NamespaceMap>

=head1 AUTHOR

Jakob Voss

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2012 by Jakob Voss.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut

