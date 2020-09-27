ς
kC:\Users\Berkay Yerdelen\source\repos\berkayyerdelen\Sample.Api\Sample.Infrastructure\ApplicationContext.cs
	namespace 	
Sample
 
. 
Infrastructure 
{		 
public

 

class

 
ApplicationContext

 #
:

$ %
IdentityDbContext

& 7
<

7 8
User

8 <
,

< =
Role

= A
,

A B
Guid

B F
>

F G
,

G H!
IApplicationDbContext

I ^
{ 
public 
ApplicationContext !
(! "
DbContextOptions" 2
<2 3
ApplicationContext3 E
>E F
optionsG N
)N O
:P Q
baseR V
(V W
optionsW ^
)^ _
{ 	
} 	
public 
DbSet 
< 
Product 
> 
Products &
{' (
get) ,
;, -
set. 1
;1 2
}3 4
	protected 
override 
void 
OnModelCreating  /
(/ 0
ModelBuilder0 <
modelBuilder= I
)I J
{ 	
base 
. 
OnModelCreating  
(  !
builder! (
:( )
modelBuilder) 5
)5 6
;6 7
modelBuilder 
. 
Seed 
( 
) 
;  
} 	
} 
} Λ
”C:\Users\Berkay Yerdelen\source\repos\berkayyerdelen\Sample.Api\Sample.Infrastructure\Identity\Domain\Commands\AddUserToRole\AddUserToRoleRequest.cs
	namespace 	
Sample
 
. 
Infrastructure 
.  
Identity  (
.( )
Domain) /
./ 0
Commands0 8
.8 9
AddUserToRole9 F
{ 
public 

class  
AddUserToRoleRequest %
:% &
IRequest& .
<. /
BaseResponseDto/ >
<> ?
bool? C
>C D
>D E
{ 
public 
string 
UserMail 
{  
get! $
;$ %
set& )
;) *
}+ ,
public		 
string		 
RoleName		 
{		  
get		! $
;		$ %
set		& )
;		) *
}		+ ,
}

 
} Ξ
›C:\Users\Berkay Yerdelen\source\repos\berkayyerdelen\Sample.Api\Sample.Infrastructure\Identity\Domain\Commands\AddUserToRole\AddUserToRoleRequestHandler.cs
	namespace		 	
Sample		
 
.		 
Infrastructure		 
.		  
Identity		  (
.		( )
Domain		) /
.		/ 0
Commands		0 8
.		8 9
AddUserToRole		9 F
{

 
public 

class '
AddUserToRoleRequestHandler ,
:, -
IRequestHandler- <
<< = 
AddUserToRoleRequest= Q
,Q R
BaseResponseDtoR a
<a b
boolb f
>f g
>g h
{ 
private 
readonly 
UserManager $
<$ %
User% )
>) *
_userManager+ 7
;7 8
public '
AddUserToRoleRequestHandler *
(* +
UserManager+ 6
<6 7
User7 ;
>; <
userManager= H
)H I
{ 	
_userManager 
= 
userManager &
;& '
} 	
public 
async 
Task 
< 
BaseResponseDto )
<) *
bool* .
>. /
>/ 0
Handle1 7
(7 8 
AddUserToRoleRequest8 L
requestM T
,T U
CancellationTokenV g
cancellationTokenh y
)y z
{ 	
var 
result 
= 
new 
BaseResponseDto ,
<, -
bool- 1
>1 2
(2 3
)3 4
;4 5
try 
{ 
var 
user 
= 
_userManager '
.' (
Users( -
.- .
SingleOrDefault. =
(= >
x> ?
=>@ B
xC D
.D E
UserNameE M
==N P
requestQ X
.X Y
UserMailY a
)a b
;b c
var 
resultRoleInsertion '
=( )
await* /
_userManager0 <
.< =
AddToRoleAsync= K
(K L
userL P
,P Q
requestR Y
.Y Z
RoleNameZ b
)b c
;c d
if 
( 
resultRoleInsertion '
.' (
	Succeeded( 1
)1 2
{ 
result 
. 
Data 
=  !
true" &
;& '
} 
} 
catch 
( 
	Exception 
e 
) 
{   
result!! 
.!! 
Data!! 
=!! 
false!! #
;!!# $
result"" 
."" 
Errors"" 
."" 
Add"" !
(""! "
e""" #
.""# $
Message""$ +
)""+ ,
;"", -
}## 
return%% 
result%% 
;%% 
}'' 	
}(( 
})) £
C:\Users\Berkay Yerdelen\source\repos\berkayyerdelen\Sample.Api\Sample.Infrastructure\Identity\Domain\Commands\CreateRole\CreateRoleRequest.cs
	namespace 	
Sample
 
. 
Infrastructure 
.  
Identity  (
.( )
Domain) /
./ 0
Commands0 8
.8 9

CreateRole9 C
{ 
public 

class 
CreateRoleRequest "
:" #
IRequest# +
<+ ,
BaseResponseDto, ;
<; <
bool< @
>@ A
>A B
{ 
public 
string 
RoleName 
{  
get! $
;$ %
set& )
;) *
}+ ,
}		 
}

 ¶
•C:\Users\Berkay Yerdelen\source\repos\berkayyerdelen\Sample.Api\Sample.Infrastructure\Identity\Domain\Commands\CreateRole\CreateRoleRequestHandler.cs
	namespace 	
Sample
 
. 
Infrastructure 
.  
Identity  (
.( )
Domain) /
./ 0
Commands0 8
.8 9

CreateRole9 C
{		 
public

 

class

 $
CreateRoleRequestHandler

 )
:

* +
IRequestHandler

, ;
<

; <
CreateRoleRequest

< M
,

M N
BaseResponseDto

O ^
<

^ _
bool

_ c
>

c d
>

d e
{ 
private 
readonly 
RoleManager $
<$ %
Role% )
>) *
_roleManager+ 7
;7 8
public $
CreateRoleRequestHandler '
(' (
RoleManager( 3
<3 4
Role4 8
>8 9
roleManager: E
)E F
{ 	
_roleManager 
= 
roleManager &
;& '
} 	
public 
async 
Task 
< 
BaseResponseDto )
<) *
bool* .
>. /
>/ 0
Handle1 7
(7 8
CreateRoleRequest8 I
requestJ Q
,Q R
CancellationTokenS d
cancellationTokene v
)v w
{ 	
var 
result 
= 
new 
BaseResponseDto ,
<, -
bool- 1
>1 2
(2 3
)3 4
;4 5
if 
( 
string 
. 
IsNullOrEmpty $
($ %
request% ,
., -
RoleName- 5
)5 6
)6 7
{ 
throw 
new 
	Exception #
(# $
$str$ C
)C D
;D E
} 
var 
newRole 
= 
new 
Role "
(" #
)# $
{ 
Name 
= 
request 
. 
RoleName '
} 
; 
try 
{ 
var 

roleResult 
=  
await! &
_roleManager' 3
.3 4
CreateAsync4 ?
(? @
newRole@ G
)G H
;H I
if   
(   

roleResult   
.   
	Succeeded   (
)  ( )
result!! 
.!! 
Data!! 
=!!  !
true!!" &
;!!& '
}"" 
catch## 
(## 
	Exception## 
e## 
)## 
{$$ 
result%% 
.%% 
Data%% 
=%% 
false%% #
;%%# $
result&& 
.&& 
Errors&& 
.&& 
Add&& !
(&&! "
e&&" #
.&&# $
Message&&$ +
)&&+ ,
;&&, -
}'' 
return)) 
result)) 
;)) 
}++ 	
},, 
}-- 
†C:\Users\Berkay Yerdelen\source\repos\berkayyerdelen\Sample.Api\Sample.Infrastructure\Identity\Domain\Commands\SignUp\SignUpRequest.cs
	namespace 	
Sample
 
. 
Infrastructure 
.  
Identity  (
.( )
Domain) /
./ 0
Commands0 8
.8 9
SignUp9 ?
{ 
public 

class 
SignUpRequest 
: 
IRequest '
<' (
BaseResponseDto( 7
<7 8
bool8 <
>< =
>= >
{ 
public 
string 
Email 
{ 
get !
;! "
set# &
;& '
}( )
public		 
string		 
UserName		 
{		  
get		! $
;		$ %
set		& )
;		) *
}		+ ,
public

 
string

 
	FirstName

 
{

  !
get

" %
;

% &
set

' *
;

* +
}

, -
public 
string 
LastName 
{  
get! $
;$ %
set& )
;) *
}+ ,
public 
string 
Password 
{  
get! $
;$ %
set& )
;) *
}+ ,
} 
} Χ
C:\Users\Berkay Yerdelen\source\repos\berkayyerdelen\Sample.Api\Sample.Infrastructure\Identity\Domain\Commands\SignUp\SignUpRequestHandler.cs
	namespace

 	
Sample


 
.

 
Infrastructure

 
.

  
Identity

  (
.

( )
Domain

) /
.

/ 0
Commands

0 8
.

8 9
SignUp

9 ?
{ 
public 

class  
SignUpRequestHandler %
:& '
IRequestHandler( 7
<7 8
SignUpRequest8 E
,E F
BaseResponseDtoG V
<V W
boolW [
>[ \
>\ ]
{ 
private 
readonly 
UserManager $
<$ %
User% )
>) *
_userManager+ 7
;7 8
private 
readonly 
IMapper  
_mapper! (
;( )
public  
SignUpRequestHandler #
(# $
IMapper$ +
mapper, 2
,2 3
UserManager4 ?
<? @
User@ D
>D E
userManagerF Q
)Q R
{ 	
_mapper 
= 
mapper 
; 
_userManager 
= 
userManager &
;& '
} 	
public 
async 
Task 
< 
BaseResponseDto )
<) *
bool* .
>. /
>/ 0
Handle1 7
(7 8
SignUpRequest8 E
requestF M
,M N
CancellationTokenO `
cancellationTokena r
)r s
{ 	
var 
result 
= 
new 
BaseResponseDto +
<+ ,
bool, 0
>0 1
(1 2
)2 3
;3 4
try 
{ 
var 
user 
= 
_mapper "
." #
Map# &
<& '
SignUpRequest' 4
,4 5
User6 :
>: ;
(; <
request< C
)C D
;D E
var 
userCreateRequest %
=& '
await( -
_userManager. :
.: ;
CreateAsync; F
(F G
userG K
,K L
requestM T
.T U
PasswordU ]
)] ^
;^ _
result 
. 
Data 
= 
userCreateRequest /
./ 0
	Succeeded0 9
;9 :
} 
catch 
( 
	Exception 
e 
) 
{ 
result   
.   
Errors   
.   
Add   !
(  ! "
e  " #
.  # $

StackTrace  $ .
)  . /
;  / 0
}!! 
return## 
result## 
;## 
}%% 	
}&& 
}'' —
’C:\Users\Berkay Yerdelen\source\repos\berkayyerdelen\Sample.Api\Sample.Infrastructure\Identity\Domain\Commands\SignUp\Validator\SignUpValidator.cs
	namespace 	
Sample
 
. 
Infrastructure 
.  
Identity  (
.( )
Domain) /
./ 0
Commands0 8
.8 9
SignUp9 ?
.? @
	Validator@ I
{ 
public 

class 
SignUpValidator  
:! "
AbstractValidator# 4
<4 5
SignUpRequest5 B
>B C
{ 
public 
SignUpValidator 
( 
)  
{ 	
RuleFor		 
(		 
x		 
=>		 
x		 
.		 
Password		 #
)		# $
.		$ %
NotNull		% ,
(		, -
)		- .
.		. /
NotEmpty		/ 7
(		7 8
)		8 9
;		9 :
RuleFor

 
(

 
x

 
=>

 
x

 
.

 
Email

  
)

  !
.

! "
EmailAddress

" .
(

. /
)

/ 0
;

0 1
RuleFor 
( 
x 
=> 
x 
. 
	FirstName $
)$ %
.% &
NotNull& -
(- .
). /
./ 0
NotEmpty0 8
(8 9
)9 :
;: ;
RuleFor 
( 
x 
=> 
x 
. 
LastName #
)# $
.$ %
NotNull% ,
(, -
)- .
.. /
NotEmpty/ 7
(7 8
)8 9
;9 :
} 	
} 
} ς
–C:\Users\Berkay Yerdelen\source\repos\berkayyerdelen\Sample.Api\Sample.Infrastructure\Identity\Domain\Commands\UpdatePassword\UpdatePasswordRequest.cs
	namespace 	
Sample
 
. 
Infrastructure 
.  
Identity  (
.( )
Domain) /
./ 0
Commands0 8
.8 9
UpdatePassword9 G
{ 
public 

class !
UpdatePasswordRequest &
:& '
IRequest' /
</ 0
BaseResponseDto0 ?
<? @
bool@ D
>D E
>E F
{ 
public 
string 
Email 
{ 
get !
;! "
set# &
;& '
}( )
public		 
string		 
CurrentPassword		 %
{		& '
get		( +
;		+ ,
set		- 0
;		0 1
}		2 3
public

 
string

 
NewPassword

 !
{

" #
get

$ '
;

' (
set

) ,
;

, -
}

. /
} 
} Ξ
C:\Users\Berkay Yerdelen\source\repos\berkayyerdelen\Sample.Api\Sample.Infrastructure\Identity\Domain\Commands\UpdatePassword\UpdatePasswordRequestHandler.cs
	namespace 	
Sample
 
. 
Infrastructure 
.  
Identity  (
.( )
Domain) /
./ 0
Commands0 8
.8 9
UpdatePassword9 G
{ 
public		 

class		 (
UpdatePasswordRequestHandler		 -
:		. /
IRequestHandler		0 ?
<		? @!
UpdatePasswordRequest		@ U
,		U V
BaseResponseDto		W f
<		f g
bool		g k
>		k l
>		l m
{

 
private 
readonly 
UserManager $
<$ %
User% )
>) *
_userManager+ 7
;7 8
private 
readonly 
SignInManager &
<& '
User' +
>+ ,
_signInManager- ;
;; <
public (
UpdatePasswordRequestHandler +
(+ ,
UserManager, 7
<7 8
User8 <
>< =
userManager> I
,I J
SignInManagerK X
<X Y
UserY ]
>] ^
signInManager_ l
)l m
{ 	
_userManager 
= 
userManager &
;& '
_signInManager 
= 
signInManager *
;* +
} 	
public 
async 
Task 
< 
BaseResponseDto )
<) *
bool* .
>. /
>/ 0
Handle1 7
(7 8!
UpdatePasswordRequest8 M
requestN U
,U V
CancellationTokenW h
cancellationTokeni z
)z {
{ 	
var 
result 
= 
new 
BaseResponseDto ,
<, -
bool- 1
>1 2
(2 3
)3 4
;4 5
var 
user 
= 
await 
_userManager )
.) *
FindByEmailAsync* :
(: ;
request; B
.B C
EmailC H
)H I
;I J
var "
resultOfChangePassword &
=' (
await) .
_userManager/ ;
.; <
ChangePasswordAsync< O
(O P
userP T
,T U
requestV ]
.] ^
CurrentPassword^ m
,m n
requesto v
.v w
NewPassword	w ‚
)
‚ ƒ
;
ƒ „
if 
( "
resultOfChangePassword &
.& '
	Succeeded' 0
==1 3
true4 8
)8 9
{ 
result 
. 
Data 
= 
true "
;" #
await 
_userManager "
." #$
UpdateSecurityStampAsync# ;
(; <
user< @
)@ A
;A B
await 
_signInManager $
.$ %
RefreshSignInAsync% 7
(7 8
user8 <
)< =
;= >
} 
return 
result 
; 
} 	
}   
}!! Ί
•C:\Users\Berkay Yerdelen\source\repos\berkayyerdelen\Sample.Api\Sample.Infrastructure\Identity\Domain\Queries\ForgetPassword\Dto\ForgetPasswordDto.cs
	namespace 	
Sample
 
. 
Infrastructure 
.  
Identity  (
.( )
Domain) /
./ 0
Queries0 7
.7 8
ForgetPassword8 F
.F G
DtoG J
{ 
public 

class 
ForgetPasswordDto "
{ 
public 
string 
Token 
{ 
get !
;! "
set# &
;& '
}( )
} 
} »
•C:\Users\Berkay Yerdelen\source\repos\berkayyerdelen\Sample.Api\Sample.Infrastructure\Identity\Domain\Queries\ForgetPassword\ForgetPasswordRequest.cs
	namespace 	
Sample
 
. 
Infrastructure 
.  
Identity  (
.( )
Domain) /
./ 0
Queries0 7
.7 8
ForgetPassword8 F
{ 
public 

class !
ForgetPasswordRequest &
:& '
IRequest' /
</ 0
BaseResponseDto0 ?
<? @
ForgetPasswordDto@ Q
>Q R
>R S
{ 
public		 
string		 
Email		 
{		 
get		 !
;		! "
set		# &
;		& '
}		( )
}

 
} »"
C:\Users\Berkay Yerdelen\source\repos\berkayyerdelen\Sample.Api\Sample.Infrastructure\Identity\Domain\Queries\ForgetPassword\ForgetPasswordRequestHandler.cs
	namespace 	
Sample
 
. 
Infrastructure 
.  
Identity  (
.( )
Domain) /
./ 0
Queries0 7
.7 8
ForgetPassword8 F
{ 
public 

class (
ForgetPasswordRequestHandler -
:. /
IRequestHandler0 ?
<? @!
ForgetPasswordRequest@ U
,U V
BaseResponseDtoW f
<f g
ForgetPasswordDtog x
>x y
>y z
{ 
private 
readonly 
UserManager $
<$ %
User% )
>) *
_userManager+ 7
;7 8
private 
readonly 
SignInManager &
<& '
User' +
>+ ,
_signInManager- ;
;; <
public (
ForgetPasswordRequestHandler +
(+ ,
UserManager, 7
<7 8
User8 <
>< =
userManager> I
,I J
SignInManagerK X
<X Y
UserY ]
>] ^
signInManager_ l
)l m
{ 	
_signInManager 
= 
signInManager *
;* +
_userManager 
= 
userManager &
;& '
} 	
public 
async 
Task 
< 
BaseResponseDto )
<) *
ForgetPasswordDto* ;
>; <
>< =
Handle> D
(D E!
ForgetPasswordRequestE Z
request[ b
,b c
CancellationTokend u
cancellationToken	v ‡
)
‡ 
{ 	
var 
result 
= 
new 
BaseResponseDto ,
<, -
ForgetPasswordDto- >
>> ?
(? @
)@ A
;A B
var 
user 
= 
await 
_userManager )
.) *
FindByEmailAsync* :
(: ;
request; B
.B C
EmailC H
)H I
;I J
if 
( 
user 
!= 
null 
) 
{ 
string 

resetToken !
=" #
await$ )
_userManager* 6
.6 7+
GeneratePasswordResetTokenAsync7 V
(V W
userW [
)[ \
;\ ]
result 
. 
Data 
. 
Token !
=" #

resetToken$ .
;. /
MailMessage!! 
mail!!  
=!!! "
new!!# &
MailMessage!!' 2
(!!2 3
)!!3 4
{"" 

IsBodyHtml## 
=##  
true##! %
,##% &
To$$ 
=$$ 
{$$ 
user$$ 
.$$  
Email$$  %
}$$& '
,$$' (
From%% 
=%% 
new%% 
MailAddress%% *
(%%* +
$str%%+ G
,%%G H
$str%%I Y
)%%Y Z
,%%Z [
Subject&& 
=&& 
$str&& 6
,&&6 7
Body'' 
='' 

resetToken'' %
,''% &
})) 
;)) 

SmtpClient++ 
smp++ 
=++  
new++! $

SmtpClient++% /
(++/ 0
)++0 1
;++1 2
smp,, 
.,, 
Credentials,, 
=,,  !
new,," %
NetworkCredential,,& 7
(,,7 8
$str,,8 @
,,,@ A
$str,,B I
),,I J
;,,J K
smp-- 
.-- 
Port-- 
=-- 
$num-- 
;-- 
smp.. 
... 
Host.. 
=.. 
$str.. +
;..+ ,
smp// 
.// 
	EnableSsl// 
=// 
true//  $
;//$ %
smp00 
.00 
Send00 
(00 
mail00 
)00 
;00 
}22 
return55 
result55 
;55 
}66 	
}77 
}88 
…C:\Users\Berkay Yerdelen\source\repos\berkayyerdelen\Sample.Api\Sample.Infrastructure\Identity\Domain\Queries\SignIn\Dto\SignInDto.cs
	namespace 	
Sample
 
. 
Infrastructure 
.  
Identity  (
.( )
Domain) /
./ 0
Queries0 7
.7 8
SignIn8 >
.> ?
Dto? B
{ 
public 

class 
	SignInDto 
{ 
public 
string 
Jwt 
{ 
get 
;  
set! $
;$ %
}& '
} 
} ―
…C:\Users\Berkay Yerdelen\source\repos\berkayyerdelen\Sample.Api\Sample.Infrastructure\Identity\Domain\Queries\SignIn\SignInRequest.cs
	namespace 	
Sample
 
. 
Infrastructure 
.  
Identity  (
.( )
Domain) /
./ 0
Queries0 7
.7 8
SignIn8 >
{ 
public 

class 
SignInRequest 
: 
IRequest '
<' (
BaseResponseDto( 7
<7 8
	SignInDto8 A
>A B
>B C
{ 
public		 
string		 
Email		 
{		 
get		 !
;		! "
set		# &
;		& '
}		( )
public

 
string

 
Password

 
{

  
get

! $
;

$ %
set

& )
;

) *
}

+ ,
} 
} Ε(
C:\Users\Berkay Yerdelen\source\repos\berkayyerdelen\Sample.Api\Sample.Infrastructure\Identity\Domain\Queries\SignIn\SignInRequestHandler.cs
	namespace 	
Sample
 
. 
Infrastructure 
.  
Identity  (
.( )
Domain) /
./ 0
Queries0 7
.7 8
SignIn8 >
{ 
public 

class  
SignInRequestHandler %
:& '
IRequestHandler( 7
<7 8
SignInRequest8 E
,E F
BaseResponseDtoG V
<V W
	SignInDtoW `
>` a
>a b
{ 
private 
readonly 
UserManager $
<$ %
User% )
>) *
_userManager+ 7
;7 8
private 
readonly 
ITokenGenerator (
_tokenGenerator) 8
;8 9
private 
readonly 
SignInManager &
<& '
User' +
>+ ,
_signInManager- ;
;; <
public  
SignInRequestHandler #
(# $
UserManager$ /
</ 0
User0 4
>4 5
userManager6 A
,A B
ITokenGeneratorC R
tokenGeneratorS a
,a b
SignInManagerc p
<p q
Userq u
>u v
signInManager	w „
)
„ …
{ 	
_userManager 
= 
userManager &
;& '
_tokenGenerator 
= 
tokenGenerator ,
;, -
_signInManager 
= 
signInManager *
;* +
} 	
public 
async 
Task 
< 
BaseResponseDto )
<) *
	SignInDto* 3
>3 4
>4 5
Handle6 <
(< =
SignInRequest= J
requestK R
,R S
CancellationTokenT e
cancellationTokenf w
)w x
{ 	
var 
result 
= 
new 
BaseResponseDto ,
<, -
	SignInDto- 6
>6 7
(7 8
)8 9
;9 :
try 
{ 
var 
user 
= 
await  
_userManager! -
.- .
FindByEmailAsync. >
(> ?
request? F
.F G
EmailG L
)L M
;M N
if   
(   
user   
is   
null    
)    !
throw!! 
new!! 
	Exception!! '
(!!' (
$str!!( =
)!!= >
;!!> ?
var"" 
userSignInResult"" $
=""% &
await""' ,
_userManager""- 9
.""9 :
CheckPasswordAsync"": L
(""L M
user""M Q
,""Q R
request""S Z
.""Z [
Password""[ c
)""c d
;""d e
if## 
(## 
userSignInResult## $
)##$ %
{$$ 
await%% 
_userManager%% &
.%%& ''
ResetAccessFailedCountAsync%%' B
(%%B C
user%%C G
)%%G H
;%%H I
var&& 
roles&& 
=&& 
await&&  %
_userManager&&& 2
.&&2 3
GetRolesAsync&&3 @
(&&@ A
user&&A E
)&&E F
;&&F G
result'' 
.'' 
Data'' 
.''  
Jwt''  #
=''$ %
_tokenGenerator''& 5
.''5 6
GenerateJwt''6 A
(''A B
user''B F
,''F G
roles''H M
)''M N
;''N O
})) 
else** 
{++ 
await,, 
_userManager,, &
.,,& '
AccessFailedAsync,,' 8
(,,8 9
user,,9 =
),,= >
;,,> ?
int-- 
	failcount-- !
=--" #
await--$ )
_userManager--* 6
.--6 7%
GetAccessFailedCountAsync--7 P
(--P Q
user--Q U
)--U V
;--V W
if.. 
(.. 
	failcount.. !
==.." $
$num..% &
)..& '
{// 
await00 
_userManager00 *
.00* +"
SetLockoutEndDateAsync00+ A
(00A B
user00B F
,00F G
new00H K
DateTimeOffset00L Z
(00Z [
DateTime00[ c
.00c d
Now00d g
.00g h

AddMinutes00h r
(00r s
$num00s t
)00t u
)00u v
)00v w
;00w x
}11 
}22 
}33 
catch44 
(44 
	Exception44 
e44 
)44 
{55 
result66 
.66 
Errors66 
.66 
Add66 !
(66! "
e66" #
.66# $
Message66$ +
)66+ ,
;66, -
}77 
return88 
result88 
;88 
}:: 	
};; 
}<< υ
uC:\Users\Berkay Yerdelen\source\repos\berkayyerdelen\Sample.Api\Sample.Infrastructure\Identity\Jwt\ITokenGenerator.cs
	namespace 	
Sample
 
. 
Infrastructure 
.  
Identity  (
.( )
Jwt) ,
{ 
public 

	interface 
ITokenGenerator $
{ 
string 
GenerateJwt 
( 
User 
user  $
,$ %
IList& +
<+ ,
string, 2
>2 3
roles4 9
)9 :
;: ;
} 
}		 Ω
qC:\Users\Berkay Yerdelen\source\repos\berkayyerdelen\Sample.Api\Sample.Infrastructure\Identity\Jwt\JwtSettings.cs
	namespace 	
Sample
 
. 
Infrastructure 
.  
Identity  (
.( )
Jwt) ,
{ 
public 

class 
JwtSettings 
{ 
public 
string 
Issuer 
{ 
get "
;" #
set$ '
;' (
}) *
public 
string 
Secret 
{ 
get "
;" #
set$ '
;' (
}) *
public 
int 
ExpirationInDays #
{$ %
get& )
;) *
set+ .
;. /
}0 1
} 
}		 ª#
tC:\Users\Berkay Yerdelen\source\repos\berkayyerdelen\Sample.Api\Sample.Infrastructure\Identity\Jwt\TokenGenerator.cs
	namespace

 	
Sample


 
.

 
Infrastructure

 
.

  
Identity

  (
.

( )
Jwt

) ,
{ 
public 

class 
TokenGenerator 
:  
ITokenGenerator  /
{ 
public 
readonly 
JwtSettings #
JwtSettings$ /
;/ 0
public 
TokenGenerator 
( 
IOptionsSnapshot .
<. /
JwtSettings/ :
>: ;
jwtSettings< G
)G H
{ 	
JwtSettings 
= 
jwtSettings $
.$ %
Value% *
;* +
} 	
public 
string 
GenerateJwt !
(! "
User" &
user' +
,+ ,
IList- 2
<2 3
string3 9
>9 :
roles; @
)@ A
{ 	
var 
claims 
= 
new 
List !
<! "
Claim" '
>' (
{ 
new 
Claim 
( #
JwtRegisteredClaimNames 1
.1 2
Sub2 5
,5 6
user7 ;
.; <
Id< >
.> ?
ToString? G
(G H
)H I
)I J
,J K
new 
Claim 
( 

ClaimTypes $
.$ %
Name% )
,) *
user+ /
./ 0
UserName0 8
)8 9
,9 :
new 
Claim 
( #
JwtRegisteredClaimNames 1
.1 2
Jti2 5
,5 6
Guid7 ;
.; <
NewGuid< C
(C D
)D E
.E F
ToStringF N
(N O
)O P
)P Q
,Q R
new 
Claim 
( 

ClaimTypes $
.$ %
NameIdentifier% 3
,3 4
user5 9
.9 :
Id: <
.< =
ToString= E
(E F
)F G
)G H
} 
; 
var 

roleClaims 
= 
roles "
." #
Select# )
() *
r* +
=>, .
new/ 2
Claim3 8
(8 9

ClaimTypes9 C
.C D
RoleD H
,H I
rJ K
)K L
)L M
;M N
claims 
. 
AddRange 
( 

roleClaims &
)& '
;' (
var   
key   
=   
new    
SymmetricSecurityKey   .
(  . /
Encoding  / 7
.  7 8
UTF8  8 <
.  < =
GetBytes  = E
(  E F
JwtSettings  F Q
.  Q R
Secret  R X
)  X Y
)  Y Z
;  Z [
var!! 
creds!! 
=!! 
new!! 
SigningCredentials!! .
(!!. /
key!!/ 2
,!!2 3
SecurityAlgorithms!!4 F
.!!F G

HmacSha256!!G Q
)!!Q R
;!!R S
var"" 
expires"" 
="" 
DateTime"" "
.""" #
Now""# &
.""& '
AddDays""' .
("". /
Convert""/ 6
.""6 7
ToDouble""7 ?
(""? @
JwtSettings""@ K
.""K L
ExpirationInDays""L \
)""\ ]
)""] ^
;""^ _
var$$ 
token$$ 
=$$ 
new$$ 
JwtSecurityToken$$ ,
($$, -
issuer%% 
:%% 
JwtSettings%% #
.%%# $
Issuer%%$ *
,%%* +
audience&& 
:&& 
JwtSettings&& %
.&&% &
Issuer&&& ,
,&&, -
claims'' 
,'' 
expires(( 
:(( 
expires((  
,((  !
signingCredentials)) "
:))" #
creds))$ )
)** 
;** 
return,, 
new,, #
JwtSecurityTokenHandler,, .
(,,. /
),,/ 0
.,,0 1

WriteToken,,1 ;
(,,; <
token,,< A
),,A B
;,,B C
}.. 	
}// 
}00 ƒ
~C:\Users\Berkay Yerdelen\source\repos\berkayyerdelen\Sample.Api\Sample.Infrastructure\Identity\Mapper\IdentityMapperProfile.cs
	namespace 	
Sample
 
. 
Infrastructure 
.  
Identity  (
.( )
Mapper) /
{ 
public 

class !
IdentityMapperProfile &
:' (
Profile) 0
{ 
public		 !
IdentityMapperProfile		 $
(		$ %
)		% &
{

 	
	CreateMap 
< 
SignUpRequest #
,# $
User% )
>) *
(* +
)+ ,
., -
	ForMember- 6
(6 7
x7 8
=>9 ;
x< =
.= >
Email> C
,C D
cE F
=>G I
cJ K
.K L
MapFromL S
(S T
kT U
=>V X
kY Z
.Z [
Email[ `
)` a
)a b
. 
	ForMember 
( 
x 
=> 
x 
. 
UserName &
,& '
c( )
=>* ,
c- .
.. /
MapFrom/ 6
(6 7
k7 8
=>9 ;
k< =
.= >
UserName> F
)F G
)G H
. 
	ForMember 
( 
x 
=> 
x 
. 
	FirstName '
,' (
c) *
=>+ -
c. /
./ 0
MapFrom0 7
(7 8
k8 9
=>: <
k= >
.> ?
	FirstName? H
)H I
)I J
.J K
	ForMemberK T
(T U
xU V
=>W Y
xZ [
.[ \
LastName\ d
,d e
cf g
=>h j
ck l
.l m
MapFromm t
(t u
ku v
=>w y
kz {
.{ |
LastName	| „
)
„ …
)
… †
. 
	ForMember 
( 
x 
=> 
x 
. 
PasswordHash *
,* +
c, -
=>. 0
c1 2
.2 3
MapFrom3 :
(: ;
k; <
=>= ?
k@ A
.A B
PasswordB J
)J K
)K L
;L M
	CreateMap 
< 
SignUpRequest #
,# $
User% )
>) *
(* +
)+ ,
;, -
} 	
} 
} «
fC:\Users\Berkay Yerdelen\source\repos\berkayyerdelen\Sample.Api\Sample.Infrastructure\Identity\Role.cs
	namespace 	
Sample
 
. 
Infrastructure 
.  
Identity  (
{ 
public 

class 
Role 
: 
IdentityRole "
<" #
Guid# '
>' (
{ 
}		 
}

 δ
fC:\Users\Berkay Yerdelen\source\repos\berkayyerdelen\Sample.Api\Sample.Infrastructure\Identity\User.cs
	namespace 	
Sample
 
. 
Infrastructure 
.  
Identity  (
{ 
public 

class 
User 
: 
IdentityUser "
<" #
Guid# '
>' (
{ 
public 
string 
	FirstName 
{  !
get" %
;% &
set' *
;* +
}, -
public		 
string		 
LastName		 
{		  
get		! $
;		$ %
set		& )
;		) *
}		+ ,
} 
} σί
€C:\Users\Berkay Yerdelen\source\repos\berkayyerdelen\Sample.Api\Sample.Infrastructure\Migrations\20200612104550_create_tables.cs
	namespace 	
Sample
 
. 
Infrastructure 
.  

Migrations  *
{ 
public 

partial 
class 
create_tables &
:' (
	Migration) 2
{ 
	protected 
override 
void 
Up  "
(" #
MigrationBuilder# 3
migrationBuilder4 D
)D E
{		 	
migrationBuilder

 
.

 
CreateTable

 (
(

( )
name 
: 
$str #
,# $
columns 
: 
table 
=> !
new" %
{ 
Id 
= 
table 
. 
Column %
<% &
Guid& *
>* +
(+ ,
nullable, 4
:4 5
false6 ;
); <
,< =
Name 
= 
table  
.  !
Column! '
<' (
string( .
>. /
(/ 0
	maxLength0 9
:9 :
$num; >
,> ?
nullable@ H
:H I
trueJ N
)N O
,O P
NormalizedName "
=# $
table% *
.* +
Column+ 1
<1 2
string2 8
>8 9
(9 :
	maxLength: C
:C D
$numE H
,H I
nullableJ R
:R S
trueT X
)X Y
,Y Z
ConcurrencyStamp $
=% &
table' ,
., -
Column- 3
<3 4
string4 :
>: ;
(; <
nullable< D
:D E
trueF J
)J K
} 
, 
constraints 
: 
table "
=># %
{ 
table 
. 

PrimaryKey $
($ %
$str% 5
,5 6
x7 8
=>9 ;
x< =
.= >
Id> @
)@ A
;A B
} 
) 
; 
migrationBuilder 
. 
CreateTable (
(( )
name 
: 
$str #
,# $
columns 
: 
table 
=> !
new" %
{ 
Id 
= 
table 
. 
Column %
<% &
Guid& *
>* +
(+ ,
nullable, 4
:4 5
false6 ;
); <
,< =
UserName 
= 
table $
.$ %
Column% +
<+ ,
string, 2
>2 3
(3 4
	maxLength4 =
:= >
$num? B
,B C
nullableD L
:L M
trueN R
)R S
,S T
NormalizedUserName &
=' (
table) .
.. /
Column/ 5
<5 6
string6 <
>< =
(= >
	maxLength> G
:G H
$numI L
,L M
nullableN V
:V W
trueX \
)\ ]
,] ^
Email 
= 
table !
.! "
Column" (
<( )
string) /
>/ 0
(0 1
	maxLength1 :
:: ;
$num< ?
,? @
nullableA I
:I J
trueK O
)O P
,P Q
NormalizedEmail   #
=  $ %
table  & +
.  + ,
Column  , 2
<  2 3
string  3 9
>  9 :
(  : ;
	maxLength  ; D
:  D E
$num  F I
,  I J
nullable  K S
:  S T
true  U Y
)  Y Z
,  Z [
EmailConfirmed!! "
=!!# $
table!!% *
.!!* +
Column!!+ 1
<!!1 2
bool!!2 6
>!!6 7
(!!7 8
nullable!!8 @
:!!@ A
false!!B G
)!!G H
,!!H I
PasswordHash""  
=""! "
table""# (
.""( )
Column"") /
<""/ 0
string""0 6
>""6 7
(""7 8
nullable""8 @
:""@ A
true""B F
)""F G
,""G H
SecurityStamp## !
=##" #
table##$ )
.##) *
Column##* 0
<##0 1
string##1 7
>##7 8
(##8 9
nullable##9 A
:##A B
true##C G
)##G H
,##H I
ConcurrencyStamp$$ $
=$$% &
table$$' ,
.$$, -
Column$$- 3
<$$3 4
string$$4 :
>$$: ;
($$; <
nullable$$< D
:$$D E
true$$F J
)$$J K
,$$K L
PhoneNumber%% 
=%%  !
table%%" '
.%%' (
Column%%( .
<%%. /
string%%/ 5
>%%5 6
(%%6 7
nullable%%7 ?
:%%? @
true%%A E
)%%E F
,%%F G 
PhoneNumberConfirmed&& (
=&&) *
table&&+ 0
.&&0 1
Column&&1 7
<&&7 8
bool&&8 <
>&&< =
(&&= >
nullable&&> F
:&&F G
false&&H M
)&&M N
,&&N O
TwoFactorEnabled'' $
=''% &
table''' ,
.'', -
Column''- 3
<''3 4
bool''4 8
>''8 9
(''9 :
nullable'': B
:''B C
false''D I
)''I J
,''J K

LockoutEnd(( 
=((  
table((! &
.((& '
Column((' -
<((- .
DateTimeOffset((. <
>((< =
(((= >
nullable((> F
:((F G
true((H L
)((L M
,((M N
LockoutEnabled)) "
=))# $
table))% *
.))* +
Column))+ 1
<))1 2
bool))2 6
>))6 7
())7 8
nullable))8 @
:))@ A
false))B G
)))G H
,))H I
AccessFailedCount** %
=**& '
table**( -
.**- .
Column**. 4
<**4 5
int**5 8
>**8 9
(**9 :
nullable**: B
:**B C
false**D I
)**I J
,**J K
	FirstName++ 
=++ 
table++  %
.++% &
Column++& ,
<++, -
string++- 3
>++3 4
(++4 5
nullable++5 =
:++= >
true++? C
)++C D
,++D E
LastName,, 
=,, 
table,, $
.,,$ %
Column,,% +
<,,+ ,
string,,, 2
>,,2 3
(,,3 4
nullable,,4 <
:,,< =
true,,> B
),,B C
}-- 
,-- 
constraints.. 
:.. 
table.. "
=>..# %
{// 
table00 
.00 

PrimaryKey00 $
(00$ %
$str00% 5
,005 6
x007 8
=>009 ;
x00< =
.00= >
Id00> @
)00@ A
;00A B
}11 
)11 
;11 
migrationBuilder33 
.33 
CreateTable33 (
(33( )
name44 
:44 
$str44  
,44  !
columns55 
:55 
table55 
=>55 !
new55" %
{66 
Id77 
=77 
table77 
.77 
Column77 %
<77% &
int77& )
>77) *
(77* +
nullable77+ 3
:773 4
false775 :
)77: ;
.88 

Annotation88 #
(88# $
$str88$ 8
,888 9
$str88: @
)88@ A
,88A B
Name99 
=99 
table99  
.99  !
Column99! '
<99' (
string99( .
>99. /
(99/ 0
nullable990 8
:998 9
true99: >
)99> ?
,99? @
CreatedDate:: 
=::  !
table::" '
.::' (
Column::( .
<::. /
DateTime::/ 7
>::7 8
(::8 9
nullable::9 A
:::A B
false::C H
)::H I
};; 
,;; 
constraints<< 
:<< 
table<< "
=><<# %
{== 
table>> 
.>> 

PrimaryKey>> $
(>>$ %
$str>>% 2
,>>2 3
x>>4 5
=>>>6 8
x>>9 :
.>>: ;
Id>>; =
)>>= >
;>>> ?
}?? 
)?? 
;?? 
migrationBuilderAA 
.AA 
CreateTableAA (
(AA( )
nameBB 
:BB 
$strBB (
,BB( )
columnsCC 
:CC 
tableCC 
=>CC !
newCC" %
{DD 
IdEE 
=EE 
tableEE 
.EE 
ColumnEE %
<EE% &
intEE& )
>EE) *
(EE* +
nullableEE+ 3
:EE3 4
falseEE5 :
)EE: ;
.FF 

AnnotationFF #
(FF# $
$strFF$ 8
,FF8 9
$strFF: @
)FF@ A
,FFA B
RoleIdGG 
=GG 
tableGG "
.GG" #
ColumnGG# )
<GG) *
GuidGG* .
>GG. /
(GG/ 0
nullableGG0 8
:GG8 9
falseGG: ?
)GG? @
,GG@ A
	ClaimTypeHH 
=HH 
tableHH  %
.HH% &
ColumnHH& ,
<HH, -
stringHH- 3
>HH3 4
(HH4 5
nullableHH5 =
:HH= >
trueHH? C
)HHC D
,HHD E

ClaimValueII 
=II  
tableII! &
.II& '
ColumnII' -
<II- .
stringII. 4
>II4 5
(II5 6
nullableII6 >
:II> ?
trueII@ D
)IID E
}JJ 
,JJ 
constraintsKK 
:KK 
tableKK "
=>KK# %
{LL 
tableMM 
.MM 

PrimaryKeyMM $
(MM$ %
$strMM% :
,MM: ;
xMM< =
=>MM> @
xMMA B
.MMB C
IdMMC E
)MME F
;MMF G
tableNN 
.NN 

ForeignKeyNN $
(NN$ %
nameOO 
:OO 
$strOO F
,OOF G
columnPP 
:PP 
xPP  !
=>PP" $
xPP% &
.PP& '
RoleIdPP' -
,PP- .
principalTableQQ &
:QQ& '
$strQQ( 5
,QQ5 6
principalColumnRR '
:RR' (
$strRR) -
,RR- .
onDeleteSS  
:SS  !
ReferentialActionSS" 3
.SS3 4
CascadeSS4 ;
)SS; <
;SS< =
}TT 
)TT 
;TT 
migrationBuilderVV 
.VV 
CreateTableVV (
(VV( )
nameWW 
:WW 
$strWW (
,WW( )
columnsXX 
:XX 
tableXX 
=>XX !
newXX" %
{YY 
IdZZ 
=ZZ 
tableZZ 
.ZZ 
ColumnZZ %
<ZZ% &
intZZ& )
>ZZ) *
(ZZ* +
nullableZZ+ 3
:ZZ3 4
falseZZ5 :
)ZZ: ;
.[[ 

Annotation[[ #
([[# $
$str[[$ 8
,[[8 9
$str[[: @
)[[@ A
,[[A B
UserId\\ 
=\\ 
table\\ "
.\\" #
Column\\# )
<\\) *
Guid\\* .
>\\. /
(\\/ 0
nullable\\0 8
:\\8 9
false\\: ?
)\\? @
,\\@ A
	ClaimType]] 
=]] 
table]]  %
.]]% &
Column]]& ,
<]], -
string]]- 3
>]]3 4
(]]4 5
nullable]]5 =
:]]= >
true]]? C
)]]C D
,]]D E

ClaimValue^^ 
=^^  
table^^! &
.^^& '
Column^^' -
<^^- .
string^^. 4
>^^4 5
(^^5 6
nullable^^6 >
:^^> ?
true^^@ D
)^^D E
}__ 
,__ 
constraints`` 
:`` 
table`` "
=>``# %
{aa 
tablebb 
.bb 

PrimaryKeybb $
(bb$ %
$strbb% :
,bb: ;
xbb< =
=>bb> @
xbbA B
.bbB C
IdbbC E
)bbE F
;bbF G
tablecc 
.cc 

ForeignKeycc $
(cc$ %
namedd 
:dd 
$strdd F
,ddF G
columnee 
:ee 
xee  !
=>ee" $
xee% &
.ee& '
UserIdee' -
,ee- .
principalTableff &
:ff& '
$strff( 5
,ff5 6
principalColumngg '
:gg' (
$strgg) -
,gg- .
onDeletehh  
:hh  !
ReferentialActionhh" 3
.hh3 4
Cascadehh4 ;
)hh; <
;hh< =
}ii 
)ii 
;ii 
migrationBuilderkk 
.kk 
CreateTablekk (
(kk( )
namell 
:ll 
$strll (
,ll( )
columnsmm 
:mm 
tablemm 
=>mm !
newmm" %
{nn 
LoginProvideroo !
=oo" #
tableoo$ )
.oo) *
Columnoo* 0
<oo0 1
stringoo1 7
>oo7 8
(oo8 9
nullableoo9 A
:ooA B
falseooC H
)ooH I
,ooI J
ProviderKeypp 
=pp  !
tablepp" '
.pp' (
Columnpp( .
<pp. /
stringpp/ 5
>pp5 6
(pp6 7
nullablepp7 ?
:pp? @
falseppA F
)ppF G
,ppG H
ProviderDisplayNameqq '
=qq( )
tableqq* /
.qq/ 0
Columnqq0 6
<qq6 7
stringqq7 =
>qq= >
(qq> ?
nullableqq? G
:qqG H
trueqqI M
)qqM N
,qqN O
UserIdrr 
=rr 
tablerr "
.rr" #
Columnrr# )
<rr) *
Guidrr* .
>rr. /
(rr/ 0
nullablerr0 8
:rr8 9
falserr: ?
)rr? @
}ss 
,ss 
constraintstt 
:tt 
tablett "
=>tt# %
{uu 
tablevv 
.vv 

PrimaryKeyvv $
(vv$ %
$strvv% :
,vv: ;
xvv< =
=>vv> @
newvvA D
{vvE F
xvvG H
.vvH I
LoginProvidervvI V
,vvV W
xvvX Y
.vvY Z
ProviderKeyvvZ e
}vvf g
)vvg h
;vvh i
tableww 
.ww 

ForeignKeyww $
(ww$ %
namexx 
:xx 
$strxx F
,xxF G
columnyy 
:yy 
xyy  !
=>yy" $
xyy% &
.yy& '
UserIdyy' -
,yy- .
principalTablezz &
:zz& '
$strzz( 5
,zz5 6
principalColumn{{ '
:{{' (
$str{{) -
,{{- .
onDelete||  
:||  !
ReferentialAction||" 3
.||3 4
Cascade||4 ;
)||; <
;||< =
}}} 
)}} 
;}} 
migrationBuilder 
. 
CreateTable (
(( )
name
€€ 
:
€€ 
$str
€€ '
,
€€' (
columns
 
:
 
table
 
=>
 !
new
" %
{
‚‚ 
UserId
ƒƒ 
=
ƒƒ 
table
ƒƒ "
.
ƒƒ" #
Column
ƒƒ# )
<
ƒƒ) *
Guid
ƒƒ* .
>
ƒƒ. /
(
ƒƒ/ 0
nullable
ƒƒ0 8
:
ƒƒ8 9
false
ƒƒ: ?
)
ƒƒ? @
,
ƒƒ@ A
RoleId
„„ 
=
„„ 
table
„„ "
.
„„" #
Column
„„# )
<
„„) *
Guid
„„* .
>
„„. /
(
„„/ 0
nullable
„„0 8
:
„„8 9
false
„„: ?
)
„„? @
}
…… 
,
…… 
constraints
†† 
:
†† 
table
†† "
=>
††# %
{
‡‡ 
table
 
.
 

PrimaryKey
 $
(
$ %
$str
% 9
,
9 :
x
; <
=>
= ?
new
@ C
{
D E
x
F G
.
G H
UserId
H N
,
N O
x
P Q
.
Q R
RoleId
R X
}
Y Z
)
Z [
;
[ \
table
‰‰ 
.
‰‰ 

ForeignKey
‰‰ $
(
‰‰$ %
name
 
:
 
$str
 E
,
E F
column
‹‹ 
:
‹‹ 
x
‹‹  !
=>
‹‹" $
x
‹‹% &
.
‹‹& '
RoleId
‹‹' -
,
‹‹- .
principalTable
 &
:
& '
$str
( 5
,
5 6
principalColumn
 '
:
' (
$str
) -
,
- .
onDelete
  
:
  !
ReferentialAction
" 3
.
3 4
Cascade
4 ;
)
; <
;
< =
table
 
.
 

ForeignKey
 $
(
$ %
name
 
:
 
$str
 E
,
E F
column
‘‘ 
:
‘‘ 
x
‘‘  !
=>
‘‘" $
x
‘‘% &
.
‘‘& '
UserId
‘‘' -
,
‘‘- .
principalTable
’’ &
:
’’& '
$str
’’( 5
,
’’5 6
principalColumn
““ '
:
““' (
$str
““) -
,
““- .
onDelete
””  
:
””  !
ReferentialAction
””" 3
.
””3 4
Cascade
””4 ;
)
””; <
;
””< =
}
•• 
)
•• 
;
•• 
migrationBuilder
—— 
.
—— 
CreateTable
—— (
(
——( )
name
 
:
 
$str
 (
,
( )
columns
™™ 
:
™™ 
table
™™ 
=>
™™ !
new
™™" %
{
 
UserId
›› 
=
›› 
table
›› "
.
››" #
Column
››# )
<
››) *
Guid
››* .
>
››. /
(
››/ 0
nullable
››0 8
:
››8 9
false
››: ?
)
››? @
,
››@ A
LoginProvider
 !
=
" #
table
$ )
.
) *
Column
* 0
<
0 1
string
1 7
>
7 8
(
8 9
nullable
9 A
:
A B
false
C H
)
H I
,
I J
Name
 
=
 
table
  
.
  !
Column
! '
<
' (
string
( .
>
. /
(
/ 0
nullable
0 8
:
8 9
false
: ?
)
? @
,
@ A
Value
 
=
 
table
 !
.
! "
Column
" (
<
( )
string
) /
>
/ 0
(
0 1
nullable
1 9
:
9 :
true
; ?
)
? @
}
 
,
 
constraints
   
:
   
table
   "
=>
  # %
{
΅΅ 
table
ΆΆ 
.
ΆΆ 

PrimaryKey
ΆΆ $
(
ΆΆ$ %
$str
ΆΆ% :
,
ΆΆ: ;
x
ΆΆ< =
=>
ΆΆ> @
new
ΆΆA D
{
ΆΆE F
x
ΆΆG H
.
ΆΆH I
UserId
ΆΆI O
,
ΆΆO P
x
ΆΆQ R
.
ΆΆR S
LoginProvider
ΆΆS `
,
ΆΆ` a
x
ΆΆb c
.
ΆΆc d
Name
ΆΆd h
}
ΆΆi j
)
ΆΆj k
;
ΆΆk l
table
££ 
.
££ 

ForeignKey
££ $
(
££$ %
name
¤¤ 
:
¤¤ 
$str
¤¤ F
,
¤¤F G
column
¥¥ 
:
¥¥ 
x
¥¥  !
=>
¥¥" $
x
¥¥% &
.
¥¥& '
UserId
¥¥' -
,
¥¥- .
principalTable
¦¦ &
:
¦¦& '
$str
¦¦( 5
,
¦¦5 6
principalColumn
§§ '
:
§§' (
$str
§§) -
,
§§- .
onDelete
¨¨  
:
¨¨  !
ReferentialAction
¨¨" 3
.
¨¨3 4
Cascade
¨¨4 ;
)
¨¨; <
;
¨¨< =
}
©© 
)
©© 
;
©© 
migrationBuilder
«« 
.
«« 

InsertData
«« '
(
««' (
table
¬¬ 
:
¬¬ 
$str
¬¬ !
,
¬¬! "
columns
­­ 
:
­­ 
new
­­ 
[
­­ 
]
­­ 
{
­­  
$str
­­! %
,
­­% &
$str
­­' 4
,
­­4 5
$str
­­6 <
}
­­= >
,
­­> ?
values
®® 
:
®® 
new
®® 
object
®® "
[
®®" #
]
®®# $
{
®®% &
$num
®®' (
,
®®( )
new
®®* -
DateTime
®®. 6
(
®®6 7
$num
®®7 ;
,
®®; <
$num
®®= >
,
®®> ?
$num
®®@ B
,
®®B C
$num
®®D F
,
®®F G
$num
®®H J
,
®®J K
$num
®®L N
,
®®N O
$num
®®P S
,
®®S T
DateTimeKind
®®U a
.
®®a b
Local
®®b g
)
®®g h
.
®®h i
AddTicks
®®i q
(
®®q r
$num
®®r v
)
®®v w
,
®®w x
$str
®®y ~
}®® €
)®®€ 
;®® ‚
migrationBuilder
°° 
.
°° 

InsertData
°° '
(
°°' (
table
±± 
:
±± 
$str
±± !
,
±±! "
columns
²² 
:
²² 
new
²² 
[
²² 
]
²² 
{
²²  
$str
²²! %
,
²²% &
$str
²²' 4
,
²²4 5
$str
²²6 <
}
²²= >
,
²²> ?
values
³³ 
:
³³ 
new
³³ 
object
³³ "
[
³³" #
]
³³# $
{
³³% &
$num
³³' (
,
³³( )
new
³³* -
DateTime
³³. 6
(
³³6 7
$num
³³7 ;
,
³³; <
$num
³³= >
,
³³> ?
$num
³³@ B
,
³³B C
$num
³³D F
,
³³F G
$num
³³H J
,
³³J K
$num
³³L N
,
³³N O
$num
³³P S
,
³³S T
DateTimeKind
³³U a
.
³³a b
Local
³³b g
)
³³g h
.
³³h i
AddTicks
³³i q
(
³³q r
$num
³³r v
)
³³v w
,
³³w x
$str
³³y 
}³³€ 
)³³ ‚
;³³‚ ƒ
migrationBuilder
µµ 
.
µµ 

InsertData
µµ '
(
µµ' (
table
¶¶ 
:
¶¶ 
$str
¶¶ !
,
¶¶! "
columns
·· 
:
·· 
new
·· 
[
·· 
]
·· 
{
··  
$str
··! %
,
··% &
$str
··' 4
,
··4 5
$str
··6 <
}
··= >
,
··> ?
values
ΈΈ 
:
ΈΈ 
new
ΈΈ 
object
ΈΈ "
[
ΈΈ" #
]
ΈΈ# $
{
ΈΈ% &
$num
ΈΈ' (
,
ΈΈ( )
new
ΈΈ* -
DateTime
ΈΈ. 6
(
ΈΈ6 7
$num
ΈΈ7 ;
,
ΈΈ; <
$num
ΈΈ= >
,
ΈΈ> ?
$num
ΈΈ@ B
,
ΈΈB C
$num
ΈΈD F
,
ΈΈF G
$num
ΈΈH J
,
ΈΈJ K
$num
ΈΈL N
,
ΈΈN O
$num
ΈΈP S
,
ΈΈS T
DateTimeKind
ΈΈU a
.
ΈΈa b
Local
ΈΈb g
)
ΈΈg h
.
ΈΈh i
AddTicks
ΈΈi q
(
ΈΈq r
$num
ΈΈr v
)
ΈΈv w
,
ΈΈw x
$str
ΈΈy }
}
ΈΈ~ 
)ΈΈ €
;ΈΈ€ 
migrationBuilder
ΊΊ 
.
ΊΊ 
CreateIndex
ΊΊ (
(
ΊΊ( )
name
»» 
:
»» 
$str
»» 2
,
»»2 3
table
ΌΌ 
:
ΌΌ 
$str
ΌΌ )
,
ΌΌ) *
column
½½ 
:
½½ 
$str
½½  
)
½½  !
;
½½! "
migrationBuilder
ΏΏ 
.
ΏΏ 
CreateIndex
ΏΏ (
(
ΏΏ( )
name
ΐΐ 
:
ΐΐ 
$str
ΐΐ %
,
ΐΐ% &
table
ΑΑ 
:
ΑΑ 
$str
ΑΑ $
,
ΑΑ$ %
column
ΒΒ 
:
ΒΒ 
$str
ΒΒ (
,
ΒΒ( )
unique
ΓΓ 
:
ΓΓ 
true
ΓΓ 
,
ΓΓ 
filter
ΔΔ 
:
ΔΔ 
$str
ΔΔ 6
)
ΔΔ6 7
;
ΔΔ7 8
migrationBuilder
ΖΖ 
.
ΖΖ 
CreateIndex
ΖΖ (
(
ΖΖ( )
name
ΗΗ 
:
ΗΗ 
$str
ΗΗ 2
,
ΗΗ2 3
table
ΘΘ 
:
ΘΘ 
$str
ΘΘ )
,
ΘΘ) *
column
ΙΙ 
:
ΙΙ 
$str
ΙΙ  
)
ΙΙ  !
;
ΙΙ! "
migrationBuilder
ΛΛ 
.
ΛΛ 
CreateIndex
ΛΛ (
(
ΛΛ( )
name
ΜΜ 
:
ΜΜ 
$str
ΜΜ 2
,
ΜΜ2 3
table
ΝΝ 
:
ΝΝ 
$str
ΝΝ )
,
ΝΝ) *
column
ΞΞ 
:
ΞΞ 
$str
ΞΞ  
)
ΞΞ  !
;
ΞΞ! "
migrationBuilder
ΠΠ 
.
ΠΠ 
CreateIndex
ΠΠ (
(
ΠΠ( )
name
ΡΡ 
:
ΡΡ 
$str
ΡΡ 1
,
ΡΡ1 2
table
ÒÒ 
:
ÒÒ 
$str
ÒÒ (
,
ÒÒ( )
column
ΣΣ 
:
ΣΣ 
$str
ΣΣ  
)
ΣΣ  !
;
ΣΣ! "
migrationBuilder
ΥΥ 
.
ΥΥ 
CreateIndex
ΥΥ (
(
ΥΥ( )
name
ΦΦ 
:
ΦΦ 
$str
ΦΦ "
,
ΦΦ" #
table
ΧΧ 
:
ΧΧ 
$str
ΧΧ $
,
ΧΧ$ %
column
ΨΨ 
:
ΨΨ 
$str
ΨΨ )
)
ΨΨ) *
;
ΨΨ* +
migrationBuilder
ΪΪ 
.
ΪΪ 
CreateIndex
ΪΪ (
(
ΪΪ( )
name
ΫΫ 
:
ΫΫ 
$str
ΫΫ %
,
ΫΫ% &
table
άά 
:
άά 
$str
άά $
,
άά$ %
column
έέ 
:
έέ 
$str
έέ ,
,
έέ, -
unique
ήή 
:
ήή 
true
ήή 
,
ήή 
filter
ίί 
:
ίί 
$str
ίί :
)
ίί: ;
;
ίί; <
}
ΰΰ 	
	protected
ββ 
override
ββ 
void
ββ 
Down
ββ  $
(
ββ$ %
MigrationBuilder
ββ% 5
migrationBuilder
ββ6 F
)
ββF G
{
γγ 	
migrationBuilder
δδ 
.
δδ 
	DropTable
δδ &
(
δδ& '
name
εε 
:
εε 
$str
εε (
)
εε( )
;
εε) *
migrationBuilder
ηη 
.
ηη 
	DropTable
ηη &
(
ηη& '
name
θθ 
:
θθ 
$str
θθ (
)
θθ( )
;
θθ) *
migrationBuilder
κκ 
.
κκ 
	DropTable
κκ &
(
κκ& '
name
λλ 
:
λλ 
$str
λλ (
)
λλ( )
;
λλ) *
migrationBuilder
νν 
.
νν 
	DropTable
νν &
(
νν& '
name
ξξ 
:
ξξ 
$str
ξξ '
)
ξξ' (
;
ξξ( )
migrationBuilder
ππ 
.
ππ 
	DropTable
ππ &
(
ππ& '
name
ρρ 
:
ρρ 
$str
ρρ (
)
ρρ( )
;
ρρ) *
migrationBuilder
σσ 
.
σσ 
	DropTable
σσ &
(
σσ& '
name
ττ 
:
ττ 
$str
ττ  
)
ττ  !
;
ττ! "
migrationBuilder
φφ 
.
φφ 
	DropTable
φφ &
(
φφ& '
name
χχ 
:
χχ 
$str
χχ #
)
χχ# $
;
χχ$ %
migrationBuilder
ωω 
.
ωω 
	DropTable
ωω &
(
ωω& '
name
ϊϊ 
:
ϊϊ 
$str
ϊϊ #
)
ϊϊ# $
;
ϊϊ$ %
}
ϋϋ 	
}
όό 
}ύύ ―
_C:\Users\Berkay Yerdelen\source\repos\berkayyerdelen\Sample.Api\Sample.Infrastructure\Seeder.cs
	namespace 	
Sample
 
. 
Infrastructure 
{ 
public		 

static		 
class		 
Seeder		 
{

 
public 
static 
void 
Seed 
(  
this  $
ModelBuilder% 1
modelBuilder2 >
)> ?
{ 	
modelBuilder 
. 
Entity 
<  
Product  '
>' (
(( )
)) *
.* +
HasData+ 2
(2 3
new3 6
Product7 >
[> ?
]? @
{ 
new 
Product 
( 
) 
{ 
Name 
= 
$str  
,  !
CreatedDate 
=  !
DateTime! )
.) *
Now* -
,- .
Id 
= 
$num 
} 
, 
new 
Product 
( 
) 
{ 
Name 
= 
$str !
,! "
CreatedDate 
=  !
DateTime" *
.* +
Now+ .
,. /
Id 
= 
$num 
} 
, 
new 
Product 
( 
) 
{ 
Id 
= 
$num 
, 
Name 
= 
$str 
,  
CreatedDate 
=  !
DateTime" *
.* +
Now+ .
}   
}!! 
)!! 
;!! 
}"" 	
}## 
}$$ 