π
mC:\Users\Berkay Yerdelen\source\repos\berkayyerdelen\Sample.Api\Sample.Core\Common\BaseDto\BaseResponseDto.cs
	namespace 	
Sample
 
. 
Core 
. 
Common 
. 
BaseDto $
{ 
public 

class 
BaseResponseDto  
<  !
TData! &
>& '
where( -
TData. 3
:4 5
new6 9
(9 :
): ;
{ 
public 
BaseResponseDto 
( 
)  
{		 	
Errors

 
=

 
new

 
List

 
<

 
string

 $
>

$ %
(

% &
)

& '
;

' (
Data 
= 
new 
TData 
( 
) 
; 
} 	
public 
bool 
HasError 
=> 
Errors  &
.& '
Any' *
(* +
)+ ,
;, -
public 
List 
< 
string 
> 
Errors "
{# $
get% (
;( )
set* -
;- .
}/ 0
public 
int 
Total 
{ 
get 
; 
set  #
;# $
}% &
public 
TData 
Data 
{ 
get 
;  
set! $
;$ %
}& '
} 
} œ
kC:\Users\Berkay Yerdelen\source\repos\berkayyerdelen\Sample.Api\Sample.Core\Common\BaseLogger\BaseLogger.cs
	namespace 	
Sample
 
. 
Core 
. 
Common 
. 

BaseLogger '
{ 
public 

abstract 
class 

BaseLogger $
<$ %
T% &
>& '
{		 
private 
ILogger 
< 
T 
> 
logger !
;! "
	protected 
ILogger 
< 
T 
> 
Logger #
=>$ &
logger 
?? 
ServiceTool !
.! "
ServiceProvider" 1
.1 2

GetService2 <
<< =
ILogger= D
<D E
TE F
>F G
>G H
(H I
)I J
;J K
} 
} ô
kC:\Users\Berkay Yerdelen\source\repos\berkayyerdelen\Sample.Api\Sample.Core\Common\IApplicationDbContext.cs
	namespace 	
Sample
 
. 
Core 
. 
Common 
{ 
public 

	interface !
IApplicationDbContext *
{		 
DbSet

 
<

 
T

 
>

 
Set

 
<

 
T

 
>

 
(

 
)

 
where

 
T

  !
:

" #
class

$ )
;

) *
Task 
< 
int 
> 
SaveChangesAsync "
(" #
CancellationToken# 4
cancellationToken5 F
)F G
;G H
} 
} å
cC:\Users\Berkay Yerdelen\source\repos\berkayyerdelen\Sample.Api\Sample.Core\Common\MapperProfile.cs
	namespace 	
Sample
 
. 
Core 
. 
Common 
{ 
public 

class 
MapperProfile 
:  
Profile! (
{		 
public

 
MapperProfile

 
(

 
)

 
{ 	
	CreateMap 
< 

ProductDto  
,  !
Product" )
>) *
(* +
)+ ,
., -

ReverseMap- 7
(7 8
)8 9
;9 :
	CreateMap 
< 
Product 
, 
Domain %
.% &
Product& -
.- .
Queries. 5
.5 6
GetProductByName6 F
.F G
DtoG J
.J K

ProductDtoK U
>U V
(V W
)W X
.X Y

ReverseMapY c
(c d
)d e
;e f
	CreateMap 
<  
UpsertProductRequest *
,* +
Sample, 2
.2 3
Domain3 9
.9 :
Product: A
>A B
(B C
)C D
.D E

ReverseMapE O
(O P
)P Q
;Q R
} 	
} 
} ñ
aC:\Users\Berkay Yerdelen\source\repos\berkayyerdelen\Sample.Api\Sample.Core\Common\ServiceTool.cs
	namespace 	
Sample
 
. 
Core 
. 
Common 
{ 
public 

static 
class 
ServiceTool #
{ 
public 
static 
IServiceProvider &
ServiceProvider' 6
{7 8
get9 <
;< =
set> A
;A B
}C D
public

 
static

 
void

 
CreateService

 (
(

( )
IServiceCollection

) ;
serviceCollection

< M
)

M N
{ 	
ServiceProvider 
= 
serviceCollection /
./ 0 
BuildServiceProvider0 D
(D E
)E F
;F G
} 	
} 
} ê
âC:\Users\Berkay Yerdelen\source\repos\berkayyerdelen\Sample.Api\Sample.Core\Domain\Product\Commands\DeleteProduct\DeleteProductRequest.cs
	namespace 	
Sample
 
. 
Core 
. 
Domain 
. 
Product $
.$ %
Commands% -
.- .
DeleteProduct. ;
{ 
public 

class  
DeleteProductRequest %
:& '
IRequest( 0
<0 1
BaseResponseDto1 @
<@ A
boolA E
>E F
>F G
{ 
public 
int 
Id 
{ 
get 
; 
set  
;  !
}" #
}		 
}

 Ø
êC:\Users\Berkay Yerdelen\source\repos\berkayyerdelen\Sample.Api\Sample.Core\Domain\Product\Commands\DeleteProduct\DeleteProductRequestHandler.cs
	namespace		 	
Sample		
 
.		 
Core		 
.		 
Domain		 
.		 
Product		 $
.		$ %
Commands		% -
.		- .
DeleteProduct		. ;
{

 
public 

class '
DeleteProductRequestHandler ,
:- .
IRequestHandler/ >
<> ? 
DeleteProductRequest? S
,S T
BaseResponseDtoU d
<d e
boole i
>i j
>j k
{ 
private 
readonly !
IApplicationDbContext .
_context/ 7
;7 8
private 
readonly 
ILogger  
<  !'
DeleteProductRequestHandler! <
>< =
_logger> E
;E F
public '
DeleteProductRequestHandler *
(* +!
IApplicationDbContext+ @
contextA H
,H I
ILoggerJ Q
<Q R'
DeleteProductRequestHandlerR m
>m n
loggero u
)u v
{ 	
_context 
= 
context 
; 
_logger 
= 
logger 
; 
} 	
public 
async 
Task 
< 
BaseResponseDto )
<) *
bool* .
>. /
>/ 0
Handle1 7
(7 8 
DeleteProductRequest8 L
requestM T
,T U
CancellationToken 
cancellationToken /
)/ 0
{ 	
var 
response 
= 
new 
BaseResponseDto .
<. /
bool/ 3
>3 4
(4 5
)5 6
;6 7
try 
{ 
var 
source 
= 
await "
_context# +
.+ ,
Set, /
</ 0
Sample0 6
.6 7
Domain7 =
.= >
Product> E
>E F
(F G
)G H
.H I
	FindAsyncI R
(R S
requestS Z
.Z [
Id[ ]
)] ^
;^ _
_context 
. 
Set 
< 
Sample #
.# $
Domain$ *
.* +
Product+ 2
>2 3
(3 4
)4 5
.5 6
Remove6 <
(< =
source= C
)C D
;D E
await 
_context 
. 
SaveChangesAsync /
(/ 0
cancellationToken0 A
)A B
;B C
response 
. 
Data 
= 
true  $
;$ %
}   
catch!! 
(!! 
	Exception!! 
ex!! 
)!!  
{"" 
_logger## 
.## 
LogError##  
(##  !
ex##! #
,### $
ex##% '
.##' (
Message##( /
)##/ 0
;##0 1
response$$ 
.$$ 
Data$$ 
=$$ 
false$$  %
;$$% &
}%% 
return'' 
response'' 
;'' 
}(( 	
})) 
}** ó
ïC:\Users\Berkay Yerdelen\source\repos\berkayyerdelen\Sample.Api\Sample.Core\Domain\Product\Commands\DeleteProduct\Validator\DeleteProductValidator.cs
	namespace 	
Sample
 
. 
Core 
. 
Domain 
. 
Product $
.$ %
Commands% -
.- .
DeleteProduct. ;
.; <
	Validator< E
{ 
public 

class "
DeleteProductValidator '
:( )
AbstractValidator* ;
<; < 
DeleteProductRequest< P
>P Q
{ 
public "
DeleteProductValidator %
(% &
)& '
{ 	
RuleFor		 
(		 
x		 
=>		 
x		 
.		 
Id		 
)		 
.		 
NotNull		 &
(		& '
)		' (
.		( )
NotEmpty		) 1
(		1 2
)		2 3
;		3 4
}

 	
} 
} …
âC:\Users\Berkay Yerdelen\source\repos\berkayyerdelen\Sample.Api\Sample.Core\Domain\Product\Commands\UpsertProduct\UpsertProductRequest.cs
	namespace 	
Sample
 
. 
Core 
. 
Domain 
. 
Product $
.$ %
Commands% -
.- .
UpsertProduct. ;
{ 
public 

class  
UpsertProductRequest %
:& '
IRequest( 0
<0 1
BaseResponseDto1 @
<@ A
boolA E
>E F
>F G
{ 
public		 
int		 
Id		 
{		 
get		 
;		 
set		  
;		  !
}		" #
public

 
string

 
Name

 
{

 
get

  
;

  !
set

" %
;

% &
}

' (
public 
DateTime 
CreatedDate #
{$ %
get& )
;) *
set+ .
;. /
}0 1
} 
} À-
êC:\Users\Berkay Yerdelen\source\repos\berkayyerdelen\Sample.Api\Sample.Core\Domain\Product\Commands\UpsertProduct\UpsertProductRequestHandler.cs
	namespace 	
Sample
 
. 
Core 
. 
Domain 
. 
Product $
.$ %
Commands% -
.- .
UpsertProduct. ;
{ 
public 

class '
UpsertProductRequestHandler ,
:- .
IRequestHandler/ >
<> ? 
UpsertProductRequest? S
,S T
BaseResponseDtoU d
<d e
boole i
>i j
>j k
{ 
private 
readonly !
IApplicationDbContext .
_context/ 7
;7 8
private 
readonly 
IMapper  
_mapper! (
;( )
public '
UpsertProductRequestHandler *
(* +
IMapper+ 2
mapper3 9
,9 :!
IApplicationDbContext; P
contextQ X
)X Y
{ 	
_mapper 
= 
mapper 
; 
_context 
= 
context 
; 
} 	
public 
async 
Task 
< 
BaseResponseDto )
<) *
bool* .
>. /
>/ 0
Handle1 7
(7 8 
UpsertProductRequest8 L
requestM T
,T U
CancellationToken 
cancellationToken /
)/ 0
{ 	
var 
response 
= 
new 
BaseResponseDto .
<. /
bool/ 3
>3 4
(4 5
)5 6
;6 7
var 
product 
= 
_mapper !
.! "
Map" %
<% &
Sample& ,
., -
Domain- 3
.3 4
Product4 ;
>; <
(< =
request= D
)D E
;E F
try 
{ 
if   
(   
!   
product   
.   
Id   
.    
Equals    &
(  & '
$num  ' (
)  ( )
)  ) *
await"" 
UpdateProduct"" '
(""' (
productEntity""( 5
:""5 6
product""7 >
,""> ?
cancellationToken""@ Q
:""Q R
cancellationToken""S d
)""d e
;""e f
else## 
await$$ 
InsertProduct$$ '
($$' (
productEntity$$( 5
:$$5 6
product$$7 >
,$$> ?
cancellationToken$$@ Q
:$$Q R
cancellationToken$$S d
)$$d e
;$$e f
await'' 
_context'' 
.'' 
SaveChangesAsync'' /
(''/ 0
cancellationToken''0 A
)''A B
;''B C
response(( 
.(( 
Data(( 
=(( 
true((  $
;(($ %
}** 
catch++ 
(++ 
	Exception++ 
ex++ 
)++  
{,, 
response-- 
.-- 
Errors-- 
.--  
Add--  #
(--# $
ex--$ &
.--& '
Message--' .
)--. /
;--/ 0
response.. 
... 
Data.. 
=.. 
false..  %
;..% &
}// 
return11 
response11 
;11 
}22 	
private33 
async33 
Task33 
UpdateProduct33 (
(33( )
Sample33) /
.33/ 0
Domain330 6
.336 7
Product337 >
productEntity33? L
,33L M
CancellationToken33N _
cancellationToken33` q
)33q r
{44 	
var55 
product55 
=55 
await55 
_context55  (
.55( )
Set55) ,
<55, -
Sample55- 3
.553 4
Domain554 :
.55: ;
Product55; B
>55B C
(55C D
)55D E
.55E F
	FindAsync55F O
(55O P
productEntity55P ]
.55] ^
Id55^ `
)55` a
;55a b
product88 
.88 
Name88 
=88 
productEntity88 (
.88( )
Name88) -
;88- .
product99 
.99 
CreatedDate99 
=99  !
productEntity99" /
.99/ 0
CreatedDate990 ;
;99; <
await:: 
Task:: 
.:: 

FromResult:: !
(::! "
_context::" *
.::* +
Set::+ .
<::. /
Sample::/ 5
.::5 6
Domain::6 <
.::< =
Product::= D
>::D E
(::E F
)::F G
.::G H
Update::H N
(::N O
product::O V
)::V W
)::W X
;::X Y
};; 	
private<< 
async<< 
Task<< 
InsertProduct<< (
(<<( )
Sample<<) /
.<</ 0
Domain<<0 6
.<<6 7
Product<<7 >
productEntity<<? L
,<<L M
CancellationToken<<N _
cancellationToken<<` q
)<<q r
{== 	
await?? 
_context?? 
.?? 
Set?? 
<?? 
Sample?? %
.??% &
Domain??& ,
.??, -
Product??- 4
>??4 5
(??5 6
)??6 7
.??7 8
AddAsync??8 @
(??@ A
productEntity??A N
,??N O
cancellationToken??P a
)??a b
;??b c
}@@ 	
}CC 
}DD ê
ïC:\Users\Berkay Yerdelen\source\repos\berkayyerdelen\Sample.Api\Sample.Core\Domain\Product\Commands\UpsertProduct\Validator\UpsertProductValidator.cs
	namespace 	
Sample
 
. 
Core 
. 
Domain 
. 
Product $
.$ %
Commands% -
.- .
UpsertProduct. ;
.; <
	Validator< E
{ 
public 

class "
UpsertProductValidator '
:( )
AbstractValidator* ;
<; < 
UpsertProductRequest< P
>P Q
{ 
public "
UpsertProductValidator %
(% &
)& '
{ 	
RuleFor		 
(		 
x		 
=>		 
x		 
.		 
CreatedDate		 &
)		& '
.		' (
NotEmpty		( 0
(		0 1
)		1 2
.		2 3
NotNull		3 :
(		: ;
)		; <
;		< =
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
 
Name

 
)

  
.

  !
NotNull

! (
(

( )
)

) *
.

* +
NotEmpty

+ 3
(

3 4
)

4 5
.

5 6
MaximumLength

6 C
(

C D
$num

D G
)

G H
;

H I
} 	
} 
} Õ
ÖC:\Users\Berkay Yerdelen\source\repos\berkayyerdelen\Sample.Api\Sample.Core\Domain\Product\Queries\GetProductByName\Dto\ProductDto.cs
	namespace 	
Sample
 
. 
Core 
. 
Domain 
. 
Product $
.$ %
Queries% ,
., -
GetProductByName- =
.= >
Dto> A
{ 
public 

class 

ProductDto 
{		 
public

 
int

 
Id

 
{

 
get

 
;

 
set

  
;

  !
}

" #
public 
string 
Name 
{ 
get  
;  !
set" %
;% &
}' (
public 
DateTime 
CreatedDate #
{$ %
get& )
;) *
set+ .
;. /
}0 1
} 
} û
éC:\Users\Berkay Yerdelen\source\repos\berkayyerdelen\Sample.Api\Sample.Core\Domain\Product\Queries\GetProductByName\GetProductByNameRequest.cs
	namespace 	
Sample
 
. 
Core 
. 
Domain 
. 
Product $
.$ %
Queries% ,
., -
GetProductByName- =
{ 
public 

class #
GetProductByNameRequest (
:) *
IRequest+ 3
<3 4
BaseResponseDto4 C
<C D

ProductDtoD N
>N O
>O P
{ 
public		 #
GetProductByNameRequest		 &
(		& '
string		' -
productName		. 9
)		9 :
{

 	
ProductName 
= 
productName %
;% &
} 	
public 
string 
ProductName !
{" #
get$ '
;' (
set) ,
;, -
}. /
} 
} à
ïC:\Users\Berkay Yerdelen\source\repos\berkayyerdelen\Sample.Api\Sample.Core\Domain\Product\Queries\GetProductByName\GetProductByNameRequestHandler.cs
	namespace 	
Sample
 
. 
Core 
. 
Domain 
. 
Product $
.$ %
Queries% ,
., -
GetProductByName- =
{ 
public 

class *
GetProductByNameRequestHandler /
:0 1
IRequestHandler2 A
<A B#
GetProductByNameRequestB Y
,Y Z
BaseResponseDto[ j
<j k

ProductDtok u
>u v
>v w
{ 
private 
readonly !
IApplicationDbContext .
_context/ 7
;7 8
private 
readonly 
ILogger  
<  !*
GetProductByNameRequestHandler! ?
>? @
_loggerA H
;H I
private 
readonly 
IMapper  
_mapper! (
;( )
public *
GetProductByNameRequestHandler -
(- .
IMapper. 5
mapper6 <
,< =!
IApplicationDbContext> S
contextT [
,[ \
ILogger 
< *
GetProductByNameRequestHandler 2
>2 3
logger4 :
): ;
{ 	
_mapper 
= 
mapper 
; 
_context 
= 
context 
; 
_logger 
= 
logger 
; 
} 	
public *
GetProductByNameRequestHandler -
(- .
IMapper. 5
mapper6 <
,< =!
IApplicationDbContext> S
contextT [
)[ \
{ 	
_mapper 
= 
mapper 
; 
_context 
= 
context 
; 
}   	
public"" 
async"" 
Task"" 
<"" 
BaseResponseDto"" )
<"") *

ProductDto""* 4
>""4 5
>""5 6
Handle""7 =
(""= >#
GetProductByNameRequest""> U
request""V ]
,""] ^
CancellationToken## 
cancellationToken## /
)##/ 0
{$$ 	
var%% 
response%% 
=%% 
new%% 
BaseResponseDto%% .
<%%. /

ProductDto%%/ 9
>%%9 :
(%%: ;
)%%; <
;%%< =
try&& 
{'' 
var(( 
source(( 
=(( 
await(( "
_context((# +
.((+ ,
Set((, /
<((/ 0
Sample((0 6
.((6 7
Domain((7 =
.((= >
Product((> E
>((E F
(((F G
)((G H
.)) 
FirstOrDefaultAsync)) (
())( )
x))) *
=>))+ -
x)). /
.))/ 0
Name))0 4
==))5 7
request))8 ?
.))? @
ProductName))@ K
,))K L
cancellationToken))M ^
)))^ _
;))_ `
var++ 

productDto++ 
=++  
_mapper++! (
.++( )
Map++) ,
<++, -

ProductDto++- 7
>++7 8
(++8 9
source++9 ?
)++? @
;++@ A
response-- 
.-- 
Data-- 
=-- 

productDto--  *
;--* +
}.. 
catch// 
(// 
	Exception// 
ex// 
)//  
{00 
_logger11 
.11 
LogError11  
(11  !
ex11! #
,11# $
ex11% '
.11' (
Message11( /
)11/ 0
;110 1
}22 
return44 
response44 
;44 
}55 	
}66 
}77 ‰	
öC:\Users\Berkay Yerdelen\source\repos\berkayyerdelen\Sample.Api\Sample.Core\Domain\Product\Queries\GetProductByName\Validator\GetProductByNameValidator.cs
	namespace 	
Sample
 
. 
Core 
. 
Domain 
. 
Product $
.$ %
Queries% ,
., -
GetProductByName- =
.= >
	Validator> G
{ 
public 

class %
GetProductByNameValidator *
:+ ,
AbstractValidator- >
<> ?#
GetProductByNameRequest? V
>V W
{ 
public %
GetProductByNameValidator (
(( )
)) *
{ 	
RuleFor		 
(		 
x		 
=>		 
x		 
.		 
ProductName		 &
)		& '
.		' (
NotEmpty		( 0
(		0 1
)		1 2
.		2 3
NotNull		3 :
(		: ;
)		; <
.		< =
MinimumLength		= J
(		J K
$num		K L
)		L M
.		M N
MaximumLength		N [
(		[ \
$num		\ _
)		_ `
;		` a
}

 	
} 
} ó
ÄC:\Users\Berkay Yerdelen\source\repos\berkayyerdelen\Sample.Api\Sample.Core\Domain\Product\Queries\GetProducts\Dto\ProductDto.cs
	namespace 	
Sample
 
. 
Core 
. 
Domain 
. 
Product $
.$ %
Queries% ,
., -
GetProducts- 8
.8 9
Dto9 <
{ 
public 

class 

ProductDto 
{ 
public 
int 
Id 
{ 
get 
; 
set  
;  !
}" #
public 
string 
Name 
{ 
get  
;  !
set" %
;% &
}' (
public		 
DateTime		 
CreatedDate		 #
{		$ %
get		& )
;		) *
set		+ .
;		. /
}		0 1
=		2 3
DateTime		4 <
.		< =
Now		= @
;		@ A
}

 
} ©
ÑC:\Users\Berkay Yerdelen\source\repos\berkayyerdelen\Sample.Api\Sample.Core\Domain\Product\Queries\GetProducts\GetProductsRequest.cs
	namespace 	
Sample
 
. 
Core 
. 
Domain 
. 
Product $
.$ %
Queries% ,
., -
GetProducts- 8
{ 
public 

class 
GetProductsRequest #
:$ %
IRequest& .
<. /
BaseResponseDto/ >
<> ?
List? C
<C D

ProductDtoD N
>N O
>O P
>P Q
{		 
}

 
} ù
ãC:\Users\Berkay Yerdelen\source\repos\berkayyerdelen\Sample.Api\Sample.Core\Domain\Product\Queries\GetProducts\GetProductsRequestHandler.cs
	namespace 	
Sample
 
. 
Core 
. 
Domain 
. 
Product $
.$ %
Queries% ,
., -
GetProducts- 8
{ 
public 

class %
GetProductsRequestHandler *
:+ ,

BaseLogger- 7
<7 8%
GetProductsRequestHandler8 Q
>Q R
,R S
IRequestHandlerS b
<b c
GetProductsRequestc u
,u v
BaseResponseDto	w Ü
<
Ü á
List
á ã
<
ã å

ProductDto
å ñ
>
ñ ó
>
ó ò
>
ò ô
{ 
private 
readonly !
IApplicationDbContext .
_context/ 7
;7 8
private 
readonly 
IMapper  
_mapper! (
;( )
public %
GetProductsRequestHandler (
(( )!
IApplicationDbContext) >
context? F
,F G
IMapperH O
mapperP V
)V W
{ 	
_context 
= 
context 
; 
_mapper 
= 
mapper 
; 
} 	
public 
async 
Task 
< 
BaseResponseDto )
<) *
List* .
<. /

ProductDto/ 9
>9 :
>: ;
>; <
Handle= C
(C D
GetProductsRequestD V
requestW ^
,^ _
CancellationToken 
cancellationToken /
)/ 0
{ 	
var 
response 
= 
new 
BaseResponseDto .
<. /
List/ 3
<3 4

ProductDto4 >
>> ?
>? @
(@ A
)A B
;B C
Logger 
. 

LogWarning 
( 
$str ,
), -
;- .
try   
{!! 
var"" 
source"" 
="" 
await"" "
_context""# +
.""+ ,
Set"", /
<""/ 0
Sample""0 6
.""6 7
Domain""7 =
.""= >
Product""> E
>""E F
(""F G
)""G H
.""H I
Select""I O
(""O P
x""P Q
=>""R T
_mapper""U \
.""\ ]
Map""] `
<""` a

ProductDto""a k
>""k l
(""l m
x""m n
)""n o
)""o p
.## 
AsNoTracking## !
(##! "
)##" #
.### $
ToListAsync##$ /
(##/ 0
cancellationToken##0 A
)##A B
.##B C
ConfigureAwait##C Q
(##Q R
false##R W
)##W X
;##X Y
response$$ 
.$$ 
Data$$ 
=$$ 
source$$  &
;$$& '
response%% 
.%% 
Total%% 
=%%  
source%%! '
.%%' (
Count%%( -
(%%- .
)%%. /
;%%/ 0
}'' 
catch(( 
((( 
	Exception(( 
e(( 
)(( 
{)) 
response** 
.** 
Errors** 
.**  
Add**  #
(**# $
$"**$ &<
0An error occurred while processing your request **& V
{**V W
e**W X
.**X Y

StackTrace**Y c
}**c d
"**d e
)**e f
;**f g
}++ 
return-- 
response-- 
;-- 
}.. 	
}// 
}00 