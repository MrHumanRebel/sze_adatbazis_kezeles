ÿþC R E A T E   D A T A B A S E   m i n i n e p t u n  
 G O  
 U S E   [ m i n i n e p t u n ]  
 G O  
 C R E A T E   T A B L E   [ h a l l g a t o k ] (  
 	 [ n e p t u n ]   [ n c h a r ] ( 6 )   N O T   N U L L ,  
 	 [ n e v ]   [ n v a r c h a r ] ( 3 0 )   N O T   N U L L ,  
 	 [ t e l e p u l e s ]   [ n v a r c h a r ] ( 2 5 )   N O T   N U L L ,  
 	 [ u t c a ]   [ n v a r c h a r ] ( 3 5 )   N O T   N U L L ,  
 	 [ i r s z ]   [ n c h a r ] ( 4 )   N U L L ,  
 	 [ t e l ]   [ n v a r c h a r ] ( 1 5 )   N U L L ,  
 	 [ s z d a t ]   [ d a t e ]   N O T   N U L L ,  
 	 [ f i u ]   [ b i t ]   N U L L ,  
 	 [ k f o r m a ]   [ n c h a r ] ( 1 )   N U L L ,  
 	 [ t s z a m ]   [ t i n y i n t ]   N U L L ,  
 	 [ k d i j ]   [ m o n e y ]   N U L L ,  
 	 [ e g y e b ]   [ n v a r c h a r ] ( m a x )   N U L L ,  
   C O N S T R A I N T   [ P K _ h a l l g a t o k ]   P R I M A R Y   K E Y   C L U S T E R E D    
 (  
 	 [ n e p t u n ]   A S C  
 ) W I T H   ( P A D _ I N D E X     =   O F F ,   S T A T I S T I C S _ N O R E C O M P U T E     =   O F F ,   I G N O R E _ D U P _ K E Y   =   O F F ,   A L L O W _ R O W _ L O C K S     =   O N ,   A L L O W _ P A G E _ L O C K S     =   O N )   O N   [ P R I M A R Y ]  
 )   O N   [ P R I M A R Y ]  
 G O  
 I N S E R T   [ h a l l g a t o k ]   ( [ n e p t u n ] ,   [ n e v ] ,   [ t e l e p u l e s ] ,   [ u t c a ] ,   [ i r s z ] ,   [ t e l ] ,   [ s z d a t ] ,   [ f i u ] ,   [ k f o r m a ] ,   [ t s z a m ] ,   [ k d i j ] ,   [ e g y e b ] )   V A L U E S   ( N ' a a a 1 2 3 ' ,   N ' K i s s   Z s u z s a ' ,   N ' G y Qr ' ,   N ' S o m o g y i   B é l a   u .   1 0 ' ,   N ' 9 0 2 4 ' ,   N U L L ,   C A S T ( 0 x 6 D 2 1 0 0 0 0   A S   S m a l l D a t e T i m e ) ,   0 ,   N ' 1 ' ,   0 ,   2 5 6 7 8 . 0 0 0 0 ,   N U L L )  
 I N S E R T   [ h a l l g a t o k ]   ( [ n e p t u n ] ,   [ n e v ] ,   [ t e l e p u l e s ] ,   [ u t c a ] ,   [ i r s z ] ,   [ t e l ] ,   [ s z d a t ] ,   [ f i u ] ,   [ k f o r m a ] ,   [ t s z a m ] ,   [ k d i j ] ,   [ e g y e b ] )   V A L U E S   ( N ' b b b 1 2 3 ' ,   N ' N a g y   P é t e r ' ,   N ' G y Qr ' ,   N ' S z i g e t h y   A .   1 0 . ' ,   N ' 9 0 2 4 ' ,   N U L L ,   C A S T ( 0 x 6 C 6 E 0 0 0 0   A S   S m a l l D a t e T i m e ) ,   1 ,   N ' 2 ' ,   5 ,   9 0 0 0 0 . 0 0 0 0 ,   N U L L )  
 I N S E R T   [ h a l l g a t o k ]   ( [ n e p t u n ] ,   [ n e v ] ,   [ t e l e p u l e s ] ,   [ u t c a ] ,   [ i r s z ] ,   [ t e l ] ,   [ s z d a t ] ,   [ f i u ] ,   [ k f o r m a ] ,   [ t s z a m ] ,   [ k d i j ] ,   [ e g y e b ] )   V A L U E S   ( N ' c c c 1 2 3 ' ,   N ' S á n d o r   B a l á z s ' ,   N ' G y Qr ' ,   N ' Z r í n y i   u .   2 1 ' ,   N ' 9 0 2 4 ' ,   N U L L ,   C A S T ( 0 x 6 C 6 E 0 0 0 0   A S   S m a l l D a t e T i m e ) ,   1 ,   N ' 2 ' ,   2 ,   4 7 8 5 6 . 0 0 0 0 ,   N U L L )  
 I N S E R T   [ h a l l g a t o k ]   ( [ n e p t u n ] ,   [ n e v ] ,   [ t e l e p u l e s ] ,   [ u t c a ] ,   [ i r s z ] ,   [ t e l ] ,   [ s z d a t ] ,   [ f i u ] ,   [ k f o r m a ] ,   [ t s z a m ] ,   [ k d i j ] ,   [ e g y e b ] )   V A L U E S   ( N ' d d d 3 4 5 ' ,   N ' N a g y   R a m ó n a ' ,   N ' T a t a ' ,   N ' R a d n ó t i   u .   1 2 . ' ,   N ' 3 4 5 6 ' ,   N U L L ,   C A S T ( 0 x 4 3 0 E 0 0 0 0   A S   S m a l l D a t e T i m e ) ,   0 ,   N ' 1 ' ,   5 ,   5 9 7 8 9 . 0 0 0 0 ,   N U L L )  
 S E T   A N S I _ N U L L S   O N  
 G O  
 S E T   Q U O T E D _ I D E N T I F I E R   O N  
 G O  
 C R E A T E   T A B L E   [ t a n t a r g y a k ] (  
 	 [ t k o d ]   [ n v a r c h a r ] ( 1 3 )   N O T   N U L L ,  
 	 [ t n e v ]   [ n v a r c h a r ] ( 4 0 )   N O T   N U L L ,  
 	 [ k r e d i t ]   [ t i n y i n t ]   N O T   N U L L ,  
 	 [ t k o v ]   [ n c h a r ] ( 1 )   N O T   N U L L ,  
   C O N S T R A I N T   [ P K _ t a n t a r g y a k ]   P R I M A R Y   K E Y   C L U S T E R E D    
 (  
 	 [ t k o d ]   A S C  
 ) W I T H   ( P A D _ I N D E X     =   O F F ,   S T A T I S T I C S _ N O R E C O M P U T E     =   O F F ,   I G N O R E _ D U P _ K E Y   =   O F F ,   A L L O W _ R O W _ L O C K S     =   O N ,   A L L O W _ P A G E _ L O C K S     =   O N )   O N   [ P R I M A R Y ]  
 )   O N   [ P R I M A R Y ]  
 G O  
 I N S E R T   [ t a n t a r g y a k ]   ( [ t k o d ] ,   [ t n e v ] ,   [ k r e d i t ] ,   [ t k o v ] )   V A L U E S   ( N ' i n 0 0 8 ' ,   N ' A d a t b ' ,   2 ,   N ' v ' )  
 I N S E R T   [ t a n t a r g y a k ]   ( [ t k o d ] ,   [ t n e v ] ,   [ k r e d i t ] ,   [ t k o v ] )   V A L U E S   ( N ' i n 0 1 0 ' ,   N ' V á l l a l a t i   i n f o r m á c i ó s   r e n d s z e r e k ' ,   2 ,   N ' v ' )  
 I N S E R T   [ t a n t a r g y a k ]   ( [ t k o d ] ,   [ t n e v ] ,   [ k r e d i t ] ,   [ t k o v ] )   V A L U E S   ( N ' i n 0 1 1 ' ,   N ' P r o g r a m o z á s ' ,   3 ,   N ' v ' )  
 I N S E R T   [ t a n t a r g y a k ]   ( [ t k o d ] ,   [ t n e v ] ,   [ k r e d i t ] ,   [ t k o v ] )   V A L U E S   ( N ' i n 0 2 9 ' ,   N ' V i z u á l i s   a d a t b á z i s k e z e l é s ' ,   2 ,   N ' f ' )  
 I N S E R T   [ t a n t a r g y a k ]   ( [ t k o d ] ,   [ t n e v ] ,   [ k r e d i t ] ,   [ t k o v ] )   V A L U E S   ( N ' i n 0 7 8 ' ,   N ' I n f o r m a t i k a i   b e r u h á z á s o k   m e g t é r ü l é s e ' ,   2 ,   N ' v ' )  
 S E T   A N S I _ N U L L S   O N  
 G O  
 S E T   Q U O T E D _ I D E N T I F I E R   O N  
 G O  
 C R E A T E   T A B L E   [ j e g y e k ] (  
 	 [ n e p t u n ]   [ n c h a r ] ( 6 )   N O T   N U L L ,  
 	 [ t k o d ]   [ n v a r c h a r ] ( 1 3 )   N O T   N U L L ,  
 	 [ j e g y ]   [ t i n y i n t ]   N O T   N U L L ,  
 	 [ v d a t u m ]   [ d a t e ]   N O T   N U L L ,  
 	 [ u v ]   [ t i n y i n t ]   N U L L  
 )   O N   [ P R I M A R Y ]  
 G O  
 I N S E R T   [ j e g y e k ]   ( [ n e p t u n ] ,   [ t k o d ] ,   [ j e g y ] ,   [ v d a t u m ] ,   [ u v ] )   V A L U E S   ( N ' a a a 1 2 3 ' ,   N ' i n 0 0 8 ' ,   1 ,   C A S T ( 0 x 9 8 B 2 0 0 0 0   A S   S m a l l D a t e T i m e ) ,   0 )  
 I N S E R T   [ j e g y e k ]   ( [ n e p t u n ] ,   [ t k o d ] ,   [ j e g y ] ,   [ v d a t u m ] ,   [ u v ] )   V A L U E S   ( N ' a a a 1 2 3 ' ,   N ' i n 0 0 8 ' ,   1 ,   C A S T ( 0 x 9 8 B 7 0 0 0 0   A S   S m a l l D a t e T i m e ) ,   1 )  
 I N S E R T   [ j e g y e k ]   ( [ n e p t u n ] ,   [ t k o d ] ,   [ j e g y ] ,   [ v d a t u m ] ,   [ u v ] )   V A L U E S   ( N ' a a a 1 2 3 ' ,   N ' i n 0 0 8 ' ,   1 ,   C A S T ( 0 x 9 8 B B 0 0 0 0   A S   S m a l l D a t e T i m e ) ,   2 )  
 I N S E R T   [ j e g y e k ]   ( [ n e p t u n ] ,   [ t k o d ] ,   [ j e g y ] ,   [ v d a t u m ] ,   [ u v ] )   V A L U E S   ( N ' b b b 1 2 3 ' ,   N ' i n 0 0 8 ' ,   1 ,   C A S T ( 0 x 9 8 B 2 0 0 0 0   A S   S m a l l D a t e T i m e ) ,   0 )  
 I N S E R T   [ j e g y e k ]   ( [ n e p t u n ] ,   [ t k o d ] ,   [ j e g y ] ,   [ v d a t u m ] ,   [ u v ] )   V A L U E S   ( N ' b b b 1 2 3 ' ,   N ' i n 0 0 8 ' ,   1 ,   C A S T ( 0 x 9 8 A B 0 0 0 0   A S   S m a l l D a t e T i m e ) ,   1 )  
 I N S E R T   [ j e g y e k ]   ( [ n e p t u n ] ,   [ t k o d ] ,   [ j e g y ] ,   [ v d a t u m ] ,   [ u v ] )   V A L U E S   ( N ' b b b 1 2 3 ' ,   N ' i n 0 0 8 ' ,   5 ,   C A S T ( 0 x 9 8 B 7 0 2 5 5   A S   S m a l l D a t e T i m e ) ,   2 )  
 I N S E R T   [ j e g y e k ]   ( [ n e p t u n ] ,   [ t k o d ] ,   [ j e g y ] ,   [ v d a t u m ] ,   [ u v ] )   V A L U E S   ( N ' a a a 1 2 3 ' ,   N ' i n 0 2 9 ' ,   1 ,   C A S T ( 0 x 9 8 B 3 0 0 0 0   A S   S m a l l D a t e T i m e ) ,   0 )  
 I N S E R T   [ j e g y e k ]   ( [ n e p t u n ] ,   [ t k o d ] ,   [ j e g y ] ,   [ v d a t u m ] ,   [ u v ] )   V A L U E S   ( N ' c c c 1 2 3 ' ,   N ' i n 0 0 8 ' ,   5 ,   C A S T ( 0 x 9 8 A D 0 0 0 0   A S   S m a l l D a t e T i m e ) ,   0 )  
 I N S E R T   [ j e g y e k ]   ( [ n e p t u n ] ,   [ t k o d ] ,   [ j e g y ] ,   [ v d a t u m ] ,   [ u v ] )   V A L U E S   ( N ' c c c 1 2 3 ' ,   N ' i n 0 1 0 ' ,   4 ,   C A S T ( 0 x 9 8 B E 0 0 0 0   A S   S m a l l D a t e T i m e ) ,   0 )  
 I N S E R T   [ j e g y e k ]   ( [ n e p t u n ] ,   [ t k o d ] ,   [ j e g y ] ,   [ v d a t u m ] ,   [ u v ] )   V A L U E S   ( N ' c c c 1 2 3 ' ,   N ' i n 0 2 9 ' ,   2 ,   C A S T ( 0 x 9 8 B C 0 0 0 0   A S   S m a l l D a t e T i m e ) ,   0 )  
 I N S E R T   [ j e g y e k ]   ( [ n e p t u n ] ,   [ t k o d ] ,   [ j e g y ] ,   [ v d a t u m ] ,   [ u v ] )   V A L U E S   ( N ' a a a 1 2 3 ' ,   N ' i n 0 1 0 ' ,   1 ,   C A S T ( 0 x 9 9 E 3 0 0 0 0   A S   S m a l l D a t e T i m e ) ,   0 )  
 A L T E R   T A B L E   [ h a l l g a t o k ]   A D D     C O N S T R A I N T   [ D F _ h a l l g a t o k _ t e l e p u l e s ]     D E F A U L T   ( N ' G y Qr ' )   F O R   [ t e l e p u l e s ]  
 G O  
 A L T E R   T A B L E   [ h a l l g a t o k ]   A D D     C O N S T R A I N T   [ D F _ h a l l g a t o k _ f i u ]     D E F A U L T   ( ( 1 ) )   F O R   [ f i u ]  
 G O  
 A L T E R   T A B L E   [ j e g y e k ]   A D D     C O N S T R A I N T   [ D F _ j e g y e k _ j e g y ]     D E F A U L T   ( ( 1 ) )   F O R   [ j e g y ]  
 G O  
 A L T E R   T A B L E   [ j e g y e k ]   A D D     C O N S T R A I N T   [ D F _ j e g y e k _ v d a t u m ]     D E F A U L T   ( g e t d a t e ( ) )   F O R   [ v d a t u m ]  
 G O  
 A L T E R   T A B L E   [ h a l l g a t o k ]     W I T H   C H E C K   A D D     C O N S T R A I N T   [ C K _ h a l l g a t o k _ i r s z ]   C H E C K     ( ( C O N V E R T ( [ s m a l l i n t ] , [ i r s z ] , ( 0 ) ) > = ( 1 0 0 0 ) ) )  
 G O  
 A L T E R   T A B L E   [ h a l l g a t o k ]   C H E C K   C O N S T R A I N T   [ C K _ h a l l g a t o k _ i r s z ]  
 G O  
 A L T E R   T A B L E   [ h a l l g a t o k ]     W I T H   C H E C K   A D D     C O N S T R A I N T   [ C K _ h a l l g a t o k _ s z d a t ]   C H E C K     ( ( d a t e a d d ( y e a r , ( 1 8 ) , [ s z d a t ] ) < = g e t d a t e ( ) ) )  
 G O  
 A L T E R   T A B L E   [ h a l l g a t o k ]   C H E C K   C O N S T R A I N T   [ C K _ h a l l g a t o k _ s z d a t ]  
 G O  
 A L T E R   T A B L E   [ h a l l g a t o k ]     W I T H   C H E C K   A D D     C O N S T R A I N T   [ C K _ h a l l g a t o k _ t s z a m ]   C H E C K     ( ( [ t s z a m ] < = ( 1 0 ) ) )  
 G O  
 A L T E R   T A B L E   [ h a l l g a t o k ]   C H E C K   C O N S T R A I N T   [ C K _ h a l l g a t o k _ t s z a m ]  
 G O  
 A L T E R   T A B L E   [ j e g y e k ]     W I T H   C H E C K   A D D     C O N S T R A I N T   [ F K _ j e g y e k _ n e p t u n ]   F O R E I G N   K E Y ( [ n e p t u n ] )  
 R E F E R E N C E S   [ h a l l g a t o k ]   ( [ n e p t u n ] )  
 O N   U P D A T E   C A S C A D E  
 G O  
 A L T E R   T A B L E   [ j e g y e k ]   C H E C K   C O N S T R A I N T   [ F K _ j e g y e k _ n e p t u n ]  
 G O  
 A L T E R   T A B L E   [ j e g y e k ]     W I T H   C H E C K   A D D     C O N S T R A I N T   [ F K _ j e g y e k _ t k o d ]   F O R E I G N   K E Y ( [ t k o d ] )  
 R E F E R E N C E S   [ t a n t a r g y a k ]   ( [ t k o d ] )  
 O N   U P D A T E   C A S C A D E  
 G O  
 A L T E R   T A B L E   [ j e g y e k ]   C H E C K   C O N S T R A I N T   [ F K _ j e g y e k _ t k o d ] 