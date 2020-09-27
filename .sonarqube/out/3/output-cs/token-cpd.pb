›!
hC:\Users\Berkay Yerdelen\source\repos\berkayyerdelen\Sample.Api\Sample.Api\Controllers\AuthController.cs
	namespace 	
Sample
 
. 
Api 
. 
Controllers  
{ 
[ 

ApiVersion 
( 
$str 
) 
] 
[ 
ApiController 
] 
public 

class 
AuthController 
:  !
Basev1ApiController" 5
<5 6
AuthController6 D
>D E
{ 
[ 	
HttpPost	 
( 
$str 
) 
] 
public 
async 
Task 
< 
IActionResult '
>' (
SignUp) /
(/ 0
SignUpRequest0 =
request> E
,E F
CancellationTokenF W
ctX Z
)Z [
{ 	
return 
Ok 
( 
await 
Mediator $
.$ %
Send% )
() *
request* 1
,1 2
ct3 5
)5 6
.6 7
ConfigureAwait7 E
(E F
falseF K
)K L
)L M
;M N
} 	
[ 	
HttpPost	 
( 
$str 
) 
] 
public   
async   
Task   
<   
IActionResult   '
>  ' (
SignIn  ) /
(  / 0
SignInRequest  0 =
request  > E
,  E F
CancellationToken  G X
ct  Y [
)  [ \
{!! 	
return"" 
Ok"" 
("" 
await"" 
Mediator"" $
.""$ %
Send""% )
("") *
request""* 1
,""1 2
ct""3 5
)""5 6
.""6 7
ConfigureAwait""7 E
(""E F
false""F K
)""K L
)""L M
;""M N
}## 	
[$$ 	
HttpPost$$	 
($$ 
$str$$ 
)$$ 
]$$ 
public%% 
async%% 
Task%% 
<%% 
IActionResult%% '
>%%' (
AddUserToRole%%) 6
(%%6 7 
AddUserToRoleRequest%%7 K
request%%L S
,%%T U
CancellationToken%%U f
ct%%g i
)%%i j
{&& 	
return'' 
Ok'' 
('' 
await'' 
Mediator'' $
.''$ %
Send''% )
('') *
request''* 1
,''1 2
ct''3 5
)''5 6
.''6 7
ConfigureAwait''7 E
(''E F
false''F K
)''K L
)''L M
;''M N
}(( 	
[** 	
HttpPost**	 
(** 
$str** '
)**' (
]**( )
public++ 
async++ 
Task++ 
<++ 
IActionResult++ '
>++' (
ResetPassword++) 6
(++6 7!
ForgetPasswordRequest++7 L
request++M T
,++T U
CancellationToken++V g
ct++h j
)++j k
{,, 	
return-- 
Ok-- 
(-- 
await-- 
Mediator-- $
.--$ %
Send--% )
(--) *
request--* 1
,--1 2
ct--3 5
)--5 6
.--6 7
ConfigureAwait--7 E
(--E F
false--F K
)--K L
)--L M
;--M N
}.. 	
[00 	
HttpPost00	 
(00 
$str00 '
)00' (
]00( )
public11 
async11 
Task11 
<11 
IActionResult11 '
>11' (
ChangePassword11) 7
(117 8!
UpdatePasswordRequest118 M
request11N U
,11U V
CancellationToken11W h
ct11i k
)11k l
{22 	
return33 
Ok33 
(33 
await33 
Mediator33 $
.33$ %
Send33% )
(33) *
request33* 1
,331 2
ct333 5
)335 6
.336 7
ConfigureAwait337 E
(33E F
false33F K
)33K L
)33L M
;33M N
}44 	
}55 
}66 ß
uC:\Users\Berkay Yerdelen\source\repos\berkayyerdelen\Sample.Api\Sample.Api\Controllers\Base\v1\Basev1ApiController.cs
	namespace 	
Sample
 
. 
Api 
. 
Controllers  
.  !
Base! %
.% &
v1& (
{ 
[ 
Route 

(
 
$str 3
)3 4
]4 5
public		 

abstract		 
class		 
Basev1ApiController		 -
<		- .
T		. /
>		/ 0
:		1 2
ControllerBase		3 A
{

 
private 
	IMediator 
	_mediator #
;# $
private 
ILogger 
< 
T 
> 
logger !
;! "
	protected 
	IMediator 
Mediator $
=>% '
	_mediator( 1
??=2 5
HttpContext6 A
.A B
RequestServicesB Q
.Q R

GetServiceR \
<\ ]
	IMediator] f
>f g
(g h
)h i
;i j
	protected 
ILogger 
< 
T 
> 
Logger #
=>$ &
logger' -
??. 0
HttpContext1 <
.< =
RequestServices= L
.L M

GetServiceM W
<W X
ILoggerX _
<_ `
T` a
>a b
>b c
(c d
)d e
;e f
} 
} «1
kC:\Users\Berkay Yerdelen\source\repos\berkayyerdelen\Sample.Api\Sample.Api\Controllers\ProductController.cs
	namespace 	
Sample
 
. 
Api 
. 
Controllers  
{ 
[ 

ApiVersion 
( 
$str 
) 
] 
[ 
ApiController 
] 
public 

class 
ProductController "
:# $
Basev1ApiController$ 7
<7 8
ProductController8 I
>I J
{ 
[ 	
HttpGet	 
] 
[ 	 
ProducesResponseType	 
( 
typeof $
($ %
BaseResponseDto% 4
<4 5
Core5 9
.9 :
Domain: @
.@ A
ProductA H
.H I
QueriesI P
.P Q
GetProductByNameQ a
.a b
Dtob e
.e f

ProductDtof p
>p q
)q r
,r s
StatusCodes 
. 
Status200OK #
)# $
]$ %
public 
async 
Task 
< 
IActionResult '
>' (
Get) ,
(, -
CancellationToken- >
ct? A
)A B
{ 	
Logger 
. 

LogWarning 
( 
$str ,
), -
;- .
var   
query   
=   
await   
Mediator   &
.  & '
Send  ' +
(  + ,
new  , /
GetProductsRequest  0 B
(  B C
)  C D
,  D E
ct  F H
)  H I
.  I J
ConfigureAwait  J X
(  X Y
false  Y ^
)  ^ _
;  _ `
return!! 
Ok!! 
(!! 
query!! 
)!! 
;!! 
}"" 	
[++ 	

HttpDelete++	 
]++ 
[,, 	 
ProducesResponseType,,	 
(,, 
typeof,, $
(,,$ %
BaseResponseDto,,% 4
<,,4 5
bool,,5 9
>,,9 :
),,: ;
,,,; <
(-- 
StatusCodes-- 
.-- 
Status204NoContent-- +
)--+ ,
)--, -
]--- .
public.. 
async.. 
Task.. 
<.. 
IActionResult.. '
>..' (
DeleteProduct..) 6
(..6 7 
DeleteProductRequest..7 K
request..L S
,..S T
CancellationToken..U f
ct..g i
)..i j
{// 	
var00 
query00 
=00 
await00 
Mediator00 &
.00& '
Send00' +
(00+ ,
request00, 3
,003 4
ct005 7
)007 8
.008 9
ConfigureAwait009 G
(00G H
false00H M
)00M N
;00N O
return11 
Ok11 
(11 
query11 
)11 
;11 
}22 	
[;; 	
HttpPost;;	 
];; 
[<< 	 
ProducesResponseType<<	 
(<< 
typeof<< $
(<<$ %
BaseResponseDto<<% 4
<<<4 5
bool<<5 9
><<9 :
)<<: ;
,<<; <
(== 
StatusCodes== 
.== 
Status201Created== )
)==) *
)==* +
]==+ ,
[>> 	 
ProducesResponseType>>	 
(>> 
typeof>> $
(>>$ %
BaseResponseDto>>% 4
<>>4 5
bool>>5 9
>>>9 :
)>>: ;
,>>; <
(?? 
StatusCodes?? 
.?? 
Status200OK?? $
)??$ %
)??% &
]??& '
public@@ 
async@@ 
Task@@ 
<@@ 
IActionResult@@ '
>@@' (
UpsertProduct@@) 6
(@@6 7 
UpsertProductRequest@@7 K
request@@L S
,@@S T
CancellationToken@@U f
ct@@g i
)@@i j
{AA 	
varBB 
queryBB 
=BB 
awaitBB 
MediatorBB &
.BB& '
SendBB' +
(BB+ ,
requestBB, 3
,BB3 4
ctBB5 7
)BB7 8
.BB8 9
ConfigureAwaitBB9 G
(BBG H
falseBBH M
)BBM N
;BBN O
returnCC 
OkCC 
(CC 
queryCC 
)CC 
;CC 
}DD 	
[GG 	
HttpPutGG	 
(GG 
$strGG 
)GG 
]GG 
publicHH 
voidHH 
PutHH 
(HH 
intHH 
idHH 
,HH 
[HH  !
FromBodyHH! )
]HH) *
stringHH+ 1
valueHH2 7
)HH7 8
{II 	
}JJ 	
[RR 	
HttpGetRR	 
]RR 
[SS 	
RouteSS	 
(SS 
$strSS )
)SS) *
]SS* +
[TT 	 
ProducesResponseTypeTT	 
(TT 
typeofTT $
(TT$ %
BaseResponseDtoTT% 4
<TT4 5
CoreTT5 9
.TT9 :
DomainTT: @
.TT@ A
ProductTTA H
.TTH I
QueriesTTI P
.TTP Q
GetProductByNameTTQ a
.TTa b
DtoTTb e
.TTe f

ProductDtoTTf p
>TTp q
)TTq r
,TTr s
StatusCodesUU 
.UU 
Status200OKUU #
)UU# $
]UU$ %
publicVV 
asyncVV 
TaskVV 
<VV 
IActionResultVV '
>VV' (
GetProductByNameVV) 9
(VV9 :
stringVV: @
productNameVVA L
)VVL M
{WW 	
varXX 
queryXX 
=XX 
awaitXX 
MediatorXX &
.XX& '
SendXX' +
(XX+ ,
newXX, /#
GetProductByNameRequestXX0 G
(XXG H
productNameXXH S
)XXS T
)XXT U
.XXU V
ConfigureAwaitXXV d
(XXd e
falseXXe j
)XXj k
;XXk l
returnYY 
OkYY 
(YY 
queryYY 
)YY 
;YY 
}ZZ 	
}^^ 
}__ À
hC:\Users\Berkay Yerdelen\source\repos\berkayyerdelen\Sample.Api\Sample.Api\Controllers\RoleController.cs
	namespace 	
Sample
 
. 
Api 
. 
Controllers  
{ 
[ 

ApiVersion 
( 
$str 
) 
] 
[ 
ApiController 
] 
public 

class 
RoleController 
:  !
Basev1ApiController" 5
<5 6
AuthController6 D
>D E
{ 
[ 	
HttpPost	 
( 
$str 
) 
]  
[ 	
	Authorize	 
( 
Roles 
= 
$str "
)" #
]# $
public 
async 
Task 
< 
IActionResult '
>' (

CreateRole) 3
(3 4
CreateRoleRequest4 E
requestF M
,M N
CancellationTokenO `
cta c
)c d
{ 	
return 
Ok 
( 
await 
Mediator $
.$ %
Send% )
() *
request* 1
,1 2
ct3 5
)5 6
.6 7
ConfigureAwait7 E
(E F
falseF K
)K L
)L M
;M N
} 	
} 
} ª
oC:\Users\Berkay Yerdelen\source\repos\berkayyerdelen\Sample.Api\Sample.Api\Infrastructure\Jwt\AuthExtensions.cs
	namespace 	
Sample
 
. 
Api 
. 
Infrastructure #
.# $
Jwt$ '
{ 
public 

static 
class 
AuthExtensions &
{ 
public 
static 
IServiceCollection (
AddAuth) 0
(0 1
this 
IServiceCollection #
services$ ,
,, -
JwtSettings 
jwtSettings #
)# $
{ 	
services 
. 
AddAuthorization !
(! "
)" #
. 
AddAuthentication "
(" #
options# *
=>+ -
{ 
options 
. %
DefaultAuthenticateScheme 5
=6 7
JwtBearerDefaults8 I
.I J 
AuthenticationSchemeJ ^
;^ _
options 
. 
DefaultScheme )
=* +
JwtBearerDefaults, =
.= > 
AuthenticationScheme> R
;R S
options 
. "
DefaultChallengeScheme 2
=3 4
JwtBearerDefaults5 F
.F G 
AuthenticationSchemeG [
;[ \
} 
) 
. 
AddJwtBearer 
( 
options %
=>& (
{ 
options 
.  
RequireHttpsMetadata 0
=1 2
false3 8
;8 9
options 
. %
TokenValidationParameters 5
=6 7
new8 ;%
TokenValidationParameters< U
{   
ValidIssuer!! #
=!!$ %
jwtSettings!!& 1
.!!1 2
Issuer!!2 8
,!!8 9
ValidAudience"" %
=""& '
jwtSettings""( 3
.""3 4
Issuer""4 :
,"": ;
IssuerSigningKey## (
=##) *
new##+ . 
SymmetricSecurityKey##/ C
(##C D
Encoding##D L
.##L M
UTF8##M Q
.##Q R
GetBytes##R Z
(##Z [
jwtSettings##[ f
.##f g
Secret##g m
)##m n
)##n o
,##o p
	ClockSkew$$ !
=$$" #
TimeSpan$$$ ,
.$$, -
Zero$$- 1
}%% 
;%% 
}&& 
)&& 
;&& 
return(( 
services(( 
;(( 
})) 	
public** 
static** 
IApplicationBuilder** )
UseAuth*** 1
(**1 2
this**2 6
IApplicationBuilder**7 J
app**K N
)**N O
{++ 	
app,, 
.,, 
UseAuthentication,, !
(,,! "
),," #
;,,# $
app.. 
... 
UseAuthorization..  
(..  !
)..! "
;.." #
return00 
app00 
;00 
}11 	
}22 
}33 ˇ
|C:\Users\Berkay Yerdelen\source\repos\berkayyerdelen\Sample.Api\Sample.Api\Infrastructure\Swagger\ConfigureSwaggerOptions.cs
	namespace 	
Sample
 
. 
Api 
. 
Infrastructure #
.# $
Swagger$ +
{		 
public

 

class

 #
ConfigureSwaggerOptions

 (
:

) *
IConfigureOptions

* ;
<

; <
SwaggerGenOptions

< M
>

M N
{ 
readonly *
IApiVersionDescriptionProvider /
provider0 8
;8 9
public #
ConfigureSwaggerOptions &
(& '*
IApiVersionDescriptionProvider' E
providerF N
)N O
=>P R
thisS W
.W X
providerX `
=a b
providerc k
;k l
public 
void 
	Configure 
( 
SwaggerGenOptions /
options0 7
)7 8
{ 	
foreach 
( 
var 
description $
in% '
provider( 0
.0 1"
ApiVersionDescriptions1 G
)G H
{ 
options 
. 

SwaggerDoc "
(" #
description# .
.. /
	GroupName/ 8
,8 9#
CreateInfoForApiVersion: Q
(Q R
descriptionR ]
)] ^
)^ _
;_ `
} 
} 	
static 
OpenApiInfo #
CreateInfoForApiVersion 2
(2 3!
ApiVersionDescription3 H
descriptionI T
)T U
{ 	
var 
info 
= 
new 
OpenApiInfo &
(& '
)' (
{ 
Title 
= 
$str $
,$ %
Version 
= 
description %
.% &

ApiVersion& 0
.0 1
ToString1 9
(9 :
): ;
,; <
Contact 
= 
new 
OpenApiContact ,
(, -
)- .
{/ 0
Name1 5
=6 7
$str8 N
,N O
EmailP U
=V W
$strX r
}s t
,t u
License 
= 
new 
OpenApiLicense ,
(, -
)- .
{/ 0
Name1 5
=6 7
$str8 =
,= >
Url? B
=C D
newE H
UriI L
(L M
$strM r
)r s
}t u
}   
;   
if"" 
("" 
description"" 
."" 
IsDeprecated"" (
)""( )
{## 
info$$ 
.$$ 
Description$$  
+=$$! #
$str$$$ L
;$$L M
}%% 
return'' 
info'' 
;'' 
}(( 	
})) 
}** ´
yC:\Users\Berkay Yerdelen\source\repos\berkayyerdelen\Sample.Api\Sample.Api\Infrastructure\Swagger\SwaggerDefaultValues.cs
	namespace 	
Sample
 
. 
Api 
. 
Infrastructure #
.# $
Swagger$ +
{ 
public		 

class		  
SwaggerDefaultValues		 %
:		& '
IOperationFilter		( 8
{

 
public 
void 
Apply 
( 
OpenApiOperation *
	operation+ 4
,4 5"
OperationFilterContext6 L
contextM T
)T U
{ 	
var 
apiDescription 
=  
context! (
.( )
ApiDescription) 7
;7 8
	operation 
. 

Deprecated  
|=! #
apiDescription$ 2
.2 3
IsDeprecated3 ?
(? @
)@ A
;A B
if 
( 
	operation 
. 

Parameters $
==% '
null( ,
), -
{ 
return 
; 
} 
foreach 
( 
var 
	parameter "
in# %
	operation& /
./ 0

Parameters0 :
): ;
{ 
var 
description 
=  !
apiDescription" 0
.0 1!
ParameterDescriptions1 F
.F G
FirstG L
(L M
pM N
=>O Q
pR S
.S T
NameT X
==Y [
	parameter\ e
.e f
Namef j
)j k
;k l
if 
( 
	parameter 
. 
Description )
==* ,
null- 1
)1 2
{ 
	parameter 
. 
Description )
=* +
description, 7
.7 8
ModelMetadata8 E
?E F
.F G
DescriptionG R
;R S
} 
if!! 
(!! 
	parameter!! 
.!! 
Schema!! $
.!!$ %
Default!!% ,
==!!- /
null!!0 4
&&!!5 7
description!!8 C
.!!C D
DefaultValue!!D P
!=!!Q S
null!!T X
)!!X Y
{"" 
	parameter## 
.## 
Schema## $
.##$ %
Default##% ,
=##- .
new##/ 2
OpenApiString##3 @
(##@ A
description##A L
.##L M
DefaultValue##M Y
.##Y Z
ToString##Z b
(##b c
)##c d
)##d e
;##e f
}$$ 
	parameter&& 
.&& 
Required&& "
|=&&# %
description&&& 1
.&&1 2

IsRequired&&2 <
;&&< =
}'' 
}(( 	
})) 
}** °
UC:\Users\Berkay Yerdelen\source\repos\berkayyerdelen\Sample.Api\Sample.Api\Program.cs
	namespace 	
Sample
 
. 
Api 
{ 
public 

class 
Program 
{		 
public

 
static

 
void

 
Main

 
(

  
string

  &
[

& '
]

' (
args

) -
)

- .
{ 	
var 
logger 
= 
NLogBuilder $
.$ %
ConfigureNLog% 2
(2 3
$str3 @
)@ A
.A B!
GetCurrentClassLoggerB W
(W X
)X Y
;Y Z
CreateHostBuilder 
( 
args "
)" #
.# $
Build$ )
() *
)* +
.+ ,
Run, /
(/ 0
)0 1
;1 2
} 	
public 
static 
IHostBuilder "
CreateHostBuilder# 4
(4 5
string5 ;
[; <
]< =
args> B
)B C
{ 	
return 
Host 
.  
CreateDefaultBuilder ,
(, -
args- 1
)1 2
.2 3
UseConsoleLifetime3 E
(E F
)F G
. $
ConfigureWebHostDefaults )
() *

webBuilder* 4
=>5 7
{8 9

webBuilder: D
.D E

UseStartupE O
<O P
StartupP W
>W X
(X Y
)Y Z
;Z [
}\ ]
)] ^
.^ _
ConfigureLogging_ o
(o p
logging 
=> 
{ 
logging 
.  
ClearProviders  .
(. /
)/ 0
;0 1
logging 
.  
SetMinimumLevel  /
(/ 0
LogLevel0 8
.8 9
Trace9 >
)> ?
;? @
} 
) 
. 
UseNLog 
( 
)  
;  !
} 	
} 
} ¸j
UC:\Users\Berkay Yerdelen\source\repos\berkayyerdelen\Sample.Api\Sample.Api\Startup.cs
	namespace-- 	
Sample--
 
.-- 
Api-- 
{.. 
public// 

class// 
Startup// 
{00 
public11 
Startup11 
(11 
IConfiguration11 %
configuration11& 3
)113 4
{22 	
Configuration33 
=33 
configuration33 )
;33) *
}44 	
public66 
IConfiguration66 
Configuration66 +
{66, -
get66. 1
;661 2
}663 4
public99 
void99 
ConfigureServices99 %
(99% &
IServiceCollection99& 8
services999 A
)99A B
{:: 	
var<< 
connectionString<<  
=<<! "
Configuration<<# 0
.<<0 1
GetValue<<1 9
<<<9 :
string<<: @
><<@ A
(<<A B
$str<<B T
)<<T U
;<<U V
services== 
.== 
AddDbContext== !
<==! "
ApplicationContext==" 4
>==4 5
(==5 6
options==6 =
=>==> @
options==A H
.==H I
UseSqlServer==I U
(==U V
connectionString==V f
)==f g
)==g h
;==h i
servicesAA 
.AA 
AddIdentityAA  
<AA  !
UserAA! %
,AA% &
RoleAA' +
>AA+ ,
(AA, -
optionsAA- 4
=>AA5 7
{BB 
optionsCC 
.CC 
PasswordCC  
.CC  !
RequiredLengthCC! /
=CC0 1
$numCC2 3
;CC3 4
optionsDD 
.DD 
PasswordDD  
.DD  !"
RequireNonAlphanumericDD! 7
=DD8 9
falseDD: ?
;DD? @
optionsEE 
.EE 
PasswordEE  
.EE  !
RequireUppercaseEE! 1
=EE2 3
trueEE4 8
;EE8 9
optionsFF 
.FF 
LockoutFF 
.FF  "
DefaultLockoutTimeSpanFF  6
=FF7 8
TimeSpanFF9 A
.FFA B
FromMinutesFFB M
(FFM N
$numFFN P
)FFP Q
;FFQ R
optionsGG 
.GG 
LockoutGG 
.GG  #
MaxFailedAccessAttemptsGG  7
=GG8 9
$numGG: ;
;GG; <
optionsHH 
.HH 
UserHH 
.HH 
RequireUniqueEmailHH /
=HH0 1
trueHH2 6
;HH6 7
}II 
)II 
.II $
AddEntityFrameworkStoresII '
<II' (
ApplicationContextII( :
>II: ;
(II; <
)II< =
;II= >
servicesMM 
.MM 
	AddScopedMM 
<MM !
IApplicationDbContextMM 4
,MM4 5
ApplicationContextMM6 H
>MMH I
(MMI J
)MMJ K
;MMK L
servicesNN 
.NN 
AddMvcNN 
(NN 
)NN 
.NN 
AddFluentValidationNN 1
(NN1 2
)NN2 3
;NN3 4
servicesPP 
.PP 
	ConfigurePP 
<PP 
JwtSettingsPP *
>PP* +
(PP+ ,
ConfigurationPP, 9
.PP9 :

GetSectionPP: D
(PPD E
$strPPE J
)PPJ K
)PPK L
;PPL M
varQQ 
jwtSettingsQQ 
=QQ 
ConfigurationQQ +
.QQ+ ,

GetSectionQQ, 6
(QQ6 7
$strQQ7 <
)QQ< =
.QQ= >
GetQQ> A
<QQA B
JwtSettingsQQB M
>QQM N
(QQN O
)QQO P
;QQP Q
servicesRR 
.RR 
AddTransientRR !
<RR! "
ITokenGeneratorRR" 1
,RR1 2
TokenGeneratorRR3 A
>RRA B
(RRB C
)RRC D
;RRD E
servicescc 
.cc 
AddTransientcc !
<cc! "

IValidatorcc" ,
<cc, - 
DeleteProductRequestcc- A
>ccA B
,ccB C"
DeleteProductValidatorccD Z
>ccZ [
(cc[ \
)cc\ ]
;cc] ^
servicesdd 
.dd 
AddTransientdd !
<dd! "

IValidatordd" ,
<dd, - 
UpsertProductRequestdd- A
>ddA B
,ddB C"
UpsertProductValidatorddD Z
>ddZ [
(dd[ \
)dd\ ]
;dd] ^
servicesee 
.ee 
AddTransientee !
<ee! "

IValidatoree" ,
<ee, -#
GetProductByNameRequestee- D
>eeD E
,eeE F%
GetProductByNameValidatoreeG `
>ee` a
(eea b
)eeb c
;eec d
servicesff 
.ff 
AddTransientff !
<ff! "

IValidatorff" ,
<ff, -
SignUpRequestff- :
>ff: ;
,ff; <
SignUpValidatorff= L
>ffL M
(ffM N
)ffN O
;ffO P
serviceshh 
.hh 

AddMediatRhh 
(hh  
typeofhh  &
(hh& '%
GetProductsRequestHandlerhh' @
)hh@ A
)hhA B
;hhB C
servicesii 
.ii 

AddMediatRii 
(ii  
typeofii  &
(ii& ''
DeleteProductRequestHandlerii' B
)iiB C
)iiC D
;iiD E
servicesjj 
.jj 

AddMediatRjj 
(jj  
typeofjj  &
(jj& ''
UpsertProductRequestHandlerjj' B
)jjB C
)jjC D
;jjD E
serviceskk 
.kk 

AddMediatRkk 
(kk  
typeofkk  &
(kk& '*
GetProductByNameRequestHandlerkk' E
)kkE F
)kkF G
;kkG H
servicesll 
.ll 

AddMediatRll 
(ll  
typeofll  &
(ll& ' 
SignUpRequestHandlerll' ;
)ll; <
)ll< =
;ll= >
servicesmm 
.mm 

AddMediatRmm 
(mm  
typeofmm  &
(mm& ' 
SignInRequestHandlermm' ;
)mm; <
)mm< =
;mm= >
servicesnn 
.nn 

AddMediatRnn 
(nn  
typeofnn  &
(nn& ''
AddUserToRoleRequestHandlernn' B
)nnB C
)nnC D
;nnD E
servicesoo 
.oo 

AddMediatRoo 
(oo  
typeofoo  &
(oo& '(
ForgetPasswordRequestHandleroo' C
)ooC D
)ooD E
;ooE F
servicespp 
.pp 

AddMediatRpp 
(pp  
typeofpp  &
(pp& '(
UpdatePasswordRequestHandlerpp' C
)ppC D
)ppD E
;ppE F
servicesss 
.ss 
AddApiVersioningss %
(ss% &
oss& '
=>ss( *
{tt 
ouu 
.uu 
DefaultApiVersionuu #
=uu$ %
newuu& )

ApiVersionuu* 4
(uu4 5
$numuu5 6
,uu6 7
$numuu8 9
)uu9 :
;uu: ;
ovv 
.vv 
ReportApiVersionsvv #
=vv$ %
truevv& *
;vv* +
oww 
.ww 
ApiVersionReaderww "
=ww# $
newww% ("
HeaderApiVersionReaderww) ?
(ww? @
$strww@ X
)wwX Y
;wwY Z
}xx 
)xx 
;xx 
serviceszz 
.zz #
AddVersionedApiExplorerzz ,
(zz, -
options{{ 
=>{{ 
{|| 
options 
. 
GroupNameFormat +
=, -
$str. 6
;6 7
options
ÉÉ 
.
ÉÉ '
SubstituteApiVersionInUrl
ÉÉ 5
=
ÉÉ6 7
true
ÉÉ8 <
;
ÉÉ< =
}
ÑÑ 
)
ÑÑ 
;
ÑÑ 
services
ÜÜ 
.
ÜÜ 
AddTransient
ÜÜ !
<
ÜÜ! "
IConfigureOptions
ÜÜ" 3
<
ÜÜ3 4
SwaggerGenOptions
ÜÜ4 E
>
ÜÜE F
,
ÜÜF G%
ConfigureSwaggerOptions
ÜÜH _
>
ÜÜ_ `
(
ÜÜ` a
)
ÜÜa b
;
ÜÜb c
services
ââ 
.
ââ 
AddSwaggerGen
ââ "
(
ââ" #
options
ää 
=>
ää 
{
ãã 
options
çç 
.
çç 
OperationFilter
çç +
<
çç+ ,"
SwaggerDefaultValues
çç, @
>
çç@ A
(
ççA B
)
ççB C
;
ççC D
options
êê 
.
êê  
IncludeXmlComments
êê .
(
êê. /!
XmlCommentsFilePath
êê/ B
)
êêB C
;
êêC D
}
ëë 
)
ëë 
;
ëë 
var
îî 
mappingConfig
îî 
=
îî 
new
îî  #!
MapperConfiguration
îî$ 7
(
îî7 8
mc
îî8 :
=>
îî; =
{
ïï 
mc
ññ 
.
ññ 

AddProfile
ññ 
(
ññ 
new
ññ !
MapperProfile
ññ" /
(
ññ/ 0
)
ññ0 1
)
ññ1 2
;
ññ2 3
mc
óó 
.
óó 

AddProfile
óó 
(
óó 
new
óó !#
IdentityMapperProfile
óó" 7
(
óó7 8
)
óó8 9
)
óó9 :
;
óó: ;
}
òò 
)
òò 
;
òò 
var
öö 
mapper
öö 
=
öö 
mappingConfig
öö &
.
öö& '
CreateMapper
öö' 3
(
öö3 4
)
öö4 5
;
öö5 6
services
õõ 
.
õõ 
AddSingleton
õõ !
(
õõ! "
mapper
õõ" (
)
õõ( )
;
õõ) *
services
úú 
.
úú 
AddControllers
úú #
(
úú# $
)
úú$ %
;
úú% &
ServiceTool
ùù 
.
ùù 
CreateService
ùù %
(
ùù% &
services
ùù& .
)
ùù. /
;
ùù/ 0
services
ûû 
.
ûû 
AddAuth
ûû 
(
ûû 
jwtSettings
ûû (
)
ûû( )
;
ûû) *
}
üü 	
public
¢¢ 
void
¢¢ 
	Configure
¢¢ 
(
¢¢ !
IApplicationBuilder
¢¢ 1
app
¢¢2 5
,
¢¢5 6!
IWebHostEnvironment
¢¢7 J
env
¢¢K N
,
¢¢N O,
IApiVersionDescriptionProvider
¢¢P n
provider
¢¢o w
)
¢¢w x
{
££ 	
if
•• 
(
•• 
env
•• 
.
•• 
IsDevelopment
•• !
(
••! "
)
••" #
)
••# $
app
••% (
.
••( )'
UseDeveloperExceptionPage
••) B
(
••B C
)
••C D
;
••D E
app
ßß 
.
ßß !
UseHttpsRedirection
ßß #
(
ßß# $
)
ßß$ %
;
ßß% &
app
©© 
.
©© 

UseRouting
©© 
(
©© 
)
©© 
;
©© 
app
™™ 
.
™™ 
UseAuthentication
™™ !
(
™™! "
)
™™" #
;
™™# $
app
´´ 
.
´´ 
UseAuthorization
´´  
(
´´  !
)
´´! "
;
´´" #
app
≠≠ 
.
≠≠ 
UseEndpoints
≠≠ 
(
≠≠ 
	endpoints
≠≠ &
=>
≠≠' )
{
≠≠* +
	endpoints
≠≠, 5
.
≠≠5 6
MapControllers
≠≠6 D
(
≠≠D E
)
≠≠E F
;
≠≠F G
}
≠≠H I
)
≠≠I J
;
≠≠J K
app
ØØ 
.
ØØ 

UseSwagger
ØØ 
(
ØØ 
)
ØØ 
;
ØØ 
app
∞∞ 
.
∞∞ 
UseSwaggerUI
∞∞ 
(
∞∞ 
options
±± 
=>
±± 
{
≤≤ 
foreach
¥¥ 
(
¥¥ 
var
¥¥  
description
¥¥! ,
in
¥¥- /
provider
¥¥0 8
.
¥¥8 9$
ApiVersionDescriptions
¥¥9 O
)
¥¥O P
{
µµ 
options
∂∂ 
.
∂∂  
SwaggerEndpoint
∂∂  /
(
∂∂/ 0
$"
∂∂0 2
	/swagger/
∂∂2 ;
{
∂∂; <
description
∂∂< G
.
∂∂G H
	GroupName
∂∂H Q
}
∂∂Q R
/swagger.json
∂∂R _
"
∂∂_ `
,
∂∂` a
description
∑∑ '
.
∑∑' (
	GroupName
∑∑( 1
.
∑∑1 2
ToUpperInvariant
∑∑2 B
(
∑∑B C
)
∑∑C D
)
∑∑D E
;
∑∑E F
}
∏∏ 
}
ππ 
)
ππ 
;
ππ 
}
∫∫ 	
static
ºº 
string
ºº !
XmlCommentsFilePath
ºº )
{
ΩΩ 	
get
ææ 
{
øø 
var
¿¿ 
basePath
¿¿ 
=
¿¿ 
PlatformServices
¿¿ /
.
¿¿/ 0
Default
¿¿0 7
.
¿¿7 8
Application
¿¿8 C
.
¿¿C D!
ApplicationBasePath
¿¿D W
;
¿¿W X
var
¡¡ 
fileName
¡¡ 
=
¡¡ 
typeof
¡¡ %
(
¡¡% &
Startup
¡¡& -
)
¡¡- .
.
¡¡. /
GetTypeInfo
¡¡/ :
(
¡¡: ;
)
¡¡; <
.
¡¡< =
Assembly
¡¡= E
.
¡¡E F
GetName
¡¡F M
(
¡¡M N
)
¡¡N O
.
¡¡O P
Name
¡¡P T
+
¡¡U V
$str
¡¡W ]
;
¡¡] ^
return
¬¬ 
Path
¬¬ 
.
¬¬ 
Combine
¬¬ #
(
¬¬# $
basePath
¬¬$ ,
,
¬¬, -
fileName
¬¬. 6
)
¬¬6 7
;
¬¬7 8
}
√√ 
}
ƒƒ 	
}
≈≈ 
}∆∆ ˝
]C:\Users\Berkay Yerdelen\source\repos\berkayyerdelen\Sample.Api\Sample.Api\WeatherForecast.cs
	namespace 	
Sample
 
. 
Api 
{ 
public 

class 
WeatherForecast  
{ 
public 
DateTime 
Date 
{ 
get "
;" #
set$ '
;' (
}) *
public		 
int		 
TemperatureC		 
{		  !
get		" %
;		% &
set		' *
;		* +
}		, -
public 
int 
TemperatureF 
=>  "
$num# %
+& '
(( )
int) ,
), -
(. /
TemperatureC/ ;
/< =
$num> D
)D E
;E F
public 
string 
Summary 
{ 
get  #
;# $
set% (
;( )
}* +
} 
} 