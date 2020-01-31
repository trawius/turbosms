package TurboSMS;
use strict;
use warnings;
use utf8;
use SOAP::Lite;
use HTTP::Cookies;
use vars '$VERSION';
$VERSION = '0.0.1';

sub new {
 my ($class, %args) = @_;
 my $client = SOAP::Lite->service('http://turbosms.in.ua/api/wsdl.html');
 my $cookie_jar = HTTP::Cookies->new();
 $client->proxy('http://turbosms.in.ua/api/', cookie_jar => $cookie_jar);
 $client->Auth($args{login},$args{password});
 return bless {wsdl => $client},$class;
}
sub GetBalance {
 my $self = shift;
 return $self->{wsdl}->GetCreditBalance();
}
sub SendSMS {
 my ($self,%data) = @_;
 my $id_list = $self->{wsdl}->SendSMS($data{sender},$data{destination},$data{text},$data{wappush});
 shift( @{$id_list->{ResultArray}} ); #remove non-id record
 return @{ $id_list->{ResultArray} };
}
sub GetStatus {
 my ($self,$id) = @_;
 return $self->{wsdl}->GetMessageStatus($id);
}
1;
