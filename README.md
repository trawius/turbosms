# turbosms
[TurboSMS](https://turbosms.ua/) lib for perl.
## Dependencies:
`SOAP::Lite, HTTP::Cookies`
## Usage:
```
use strict;
no warnings;
use feature 'say';
use TurboSMS;

my $obj = TurboSMS->new(login => 'mylogin', password => 'mypassword');
#Get balance
say $obj->GetBalance;

#Send message(s)
my @status_id = $obj->SendSMS(
		  sender =>'Larry Wall',
		  destination => '+380123456789,+380912345678',
		  text => 'use perl or die!',
		  wappush => 'http://example.com' #optional wap push
	  	 );
#Get messages states
foreach my $id (@status_id){
 say "ID: $id, Status: ".$obj->GetStatus($id);
}
```
