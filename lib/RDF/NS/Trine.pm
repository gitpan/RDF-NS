use strict;
use warnings;
package RDF::NS::Trine;
{
  $RDF::NS::Trine::VERSION = '20111028';
}
#ABSTRACT: Popular RDF namespace prefixes from prefix.cc as RDF::Trine nodes

use RDF::Trine::Node::Resource;

use parent 'RDF::NS';

sub GET {
    RDF::Trine::Node::Resource->new($_[1]);
}

1;


__END__
=pod

=head1 NAME

RDF::NS::Trine - Popular RDF namespace prefixes from prefix.cc as RDF::Trine nodes

=head1 VERSION

version 20111028

=head1 SYNOPSIS

  use RDF::NS::Trine;

  my $ns = RDF::NS::Trine->new('20111028');

  $ns->foaf_Person;        # a RDF::Trine::Node::Resource
  $ns->URI('foaf:Person);  # same
  $ns->foaf_Person->uri;   # http://xmlns.com/foaf/0.1/Person

=head1 DESCRIPTION

In contrast to L<RDF::NS>, which should be consulted for documentation, this
returns no plain string URIs but instances of L<RDF::Trine::Node::Resource>.

Before using this module, make sure to install L<RDF::Trine>, which is not
automatically installed together with L<RDF::NS>!

=head1 AUTHOR

Jakob Voss

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2011 by Jakob Voss.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut

