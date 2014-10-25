use strict;
use warnings;
package App::rdfns;
{
  $App::rdfns::VERSION = '20130924';
}
#ABSTRACT: quickly get common URI namespaces
#VERSION

use v5.10;

use RDF::NS;

sub new {
    bless {}, shift;
}

sub run {
    my ($self, @ARGV) = @_;
    my $format = '';
    my $version = 'any';

    return $self->usage if !@ARGV or $ARGV[0] =~ /^(-[?h]|--help)$/;

    foreach my $a (@ARGV) {
        if ( $a =~ /^(\d{8})$/ ) {
            $version = $a;
            next;
        }
        my $ns = RDF::NS->new($version);
        my $rev;
        if ( $a =~ qr{^https?://} ) {
            $rev ||= $ns->REVERSE;
            say $rev->{$a} if $rev->{$a};
        } elsif ( $a =~ /:/ ) {
            print map { $ns->URI($_)."\n" } split(/[|, ]+/, $a);
        } elsif ( $a =~ s/\.([^.]+)$// ) {
            my $f = $1;
            if ( $f eq 'prefix' ) {
               $rev ||= $ns->REVERSE;
               print map { "$_\n" if defined $_ } map {
                   $rev->{$_}
               } $ns->FORMAT( $format, $a );
               next;
            } elsif ( $f =~ $RDF::NS::FORMATS ) {
                $format = $f;
            } else {
                print STDERR "Unknown format: $f\n";
            }
        }
        print map {"$_\n"} $ns->FORMAT( $format, $a );
    }
}

sub usage {
    print <<'USAGE';
USAGE: rdfns { [YYYYMMDD] ( <prefix[es]>[.format] | prefix:name | URL ) }+

  formats: txt, sparql, ttl, n3, xmlns, beacon, prefix
 
  examples:
    rdfns 20111102 foaf,owl.ttl
    rdfns foaf.xmlns foaf.n3
	rdfns rdfs:seeAlso
    rdfns http://www.w3.org/2003/01/geo/wgs84_pos#
    rdfns wgs.prefix
USAGE
}

1;

__END__

=pod

=head1 NAME

App::rdfns - quickly get common URI namespaces

=head1 VERSION

version 20130924

=head1 AUTHOR

Jakob Voß

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2013 by Jakob Voß.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut
