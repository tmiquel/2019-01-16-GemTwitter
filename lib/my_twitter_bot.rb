 #! usr/env/bin ruby
 # ligne très importante qui appelle la gem.
require 'twitter'
require 'dotenv'
require 'pry'

Dotenv.load


journalists_array = ["@jcunniet", "@Aziliz31","@ssoumier",
	"@marionsouzeau","@gaellombart","@bendarag",
	"@AurelieLebelle","@julienduffe","@thomaspoupeau",
	"@LilyRossignol","@ClairGuedon","@stephanieauguy",
	"@claw_prolongeau","@_JulieMenard","@LColcomb",
	"@Zlauwereys","@MeLonguet","@DorotheeLN","@NolwennCosson",
	"@ADaboval","@Remibaldy","@bderveaux","@amandechap",
	"@ELODIESOULIE","@nbongarcon","@HeloAb","@gregplou",
	"@BenoitBerthe","@LauraBruneau89","@Anthony_Lieures",
	"@Sharonwaj","@mcsonkin","@pverduzier","@emiliel3",
	"@Julien_MARION","@SophiFay","@bdelombre","@annalecerf",
	"@AdriaBudry","@DejNikolic","@iJaffre","@CyrusleVirus",
	"@GPardigon","@e_vallerey","@IsabelleSouquet",
	"@AudeDavidRossi","@Yoann_Pa","@CeliaPenavaire",
	"@perraultvincent","@cboulate","@JustineWeyl",
	"@Paulinejacot","@juliechab","@aslechevallier",
	"@phnou","@Seb_Pommier","@Alex_Bensaid","@GuillaumeGaven",
	"@annelaurechouin","@Oliviader","@guerricp","@JMMarchaut",
	"@cyceron","@gregory_raymond","@vhunsinger","@l_peillon",
	"@fannyguinochet","@EAssayag","@YvonHerry","@JohanGarciajg",
	"@saidlabidi","@lauranneprov","@LeaDavy","@francois_remy",
	"@CGuicheteau","@FloMaillet","@m_perroud","@oBrunet_TSMF",
	"@MoonVdc","@jc2taille","@NellyMoussu","@VirginK","@b_misa",
	"@FabriceCouste","@barbara_prose","@lelia2m","@brunoaskenazi",
	"@laurenechamp","@ysisbox","@juliengagliardi","@PierreLel",
	"@kdeniau","@_TerraInc","@DominicArpin","@antoinfonteneau",
	"@nanotousch","@jb_roch","@YaniKhezzar","@Anne_Bechet",
	"@NCapart","@SamyBenNaceur","@Joumany","@Julietteraynal",
	"@TGiraudet","@SaraTanit","@HappeFrederic","@antoinellorca",
	"@michelpicot","@Sev_Ryne","@bobdobolino","@murdever",
	"@YGrandmontagne","@Mnyo","@EdKOSCIANSKI","@tnoisette",
	"@jankari","@delbello_rom","@rflechaux","@NadiaSorelli",
	"@IT_Digital","@abarbaux","@PhilippeLeroy","@schaptal",
	"@marionspee","@lisavignoli","@ChloeAeberhardt",
	"@MartineJacot","@JuliaPascualita","@curieusedetout",
	"@sgraveleau","@bif_o","@zinebdryef","@apiquard",
	"@pierrehaski","@StephanieDelmas","@Blandine_Garot",
	"@vergara_i","@evan_lebastard","@SophieVclt","@OlivierLevrault",
	"@alicedorgeval","@LouiseMalnoy","@alix_fx",
	"@pierre_baudis","@LucMagoutier","@AgatheMuller",
	"@SGianninelli","@PaulineBoyer33","@NaomiHalll",
	"@romaindlx","@marionbr","@Burtschy","@JacobEtienne",
	"@as_lizzani","@marie_simon","@LaureDaussy",
	"@FabriceAmedeo","@LoubnaChlaikhy","@PlummerWilliam",
	"@OlivierMarin1","@alaurefremont","@mwesfreid","@ChBaDe","@pmathon","@theobaldmarie","@Lnpagesy","@marclandre","@paoliniesther","@Feertchak","@JBLitzler","@GuillaumeErrard","@quentinperinel","@TristanQM","@mlbo","@constancejamet","@LoraTerrazas","@emiliegeffray","@Mathilde_Sd","@CaroPiquet","@DCanivez","@TIM_7375","@blandinelc","@ivanrioufol","@arthurberdah","@SarahLecoeuvre","@guillaume_gui","@DamienMercereau","@W_Chloe","@Assma_MD","@EugenieBastie","@HiTech_lexpress","@bcondominas","@Laurie_Z_","@jeanfrancgerard","@MathieuPagura","@BGUYF","@AlainPiffaretti","@AudreyKucinskas","@julienhory","@Pierrefalga","@TiphThuillier","@cdaniez","@LigerBaptiste","@D_Peras","@julie_dlb","@julian2lamancha","@GaetaneDeljurie","@JulianMattei","@M_Vicuna","@DeBruynOlivier","@Nehed_Jendoubi","@antoine_grenapi","@ColonnaGen","@VictoriaGairin","@Clement_Lacombe","@TVigoureux","@MargauxObriot","@solinedelos","@RocheSabine","@dangerkens","@EdouardDutour","@MDondeyne","@DupuisNathalie1","@bouscarel","@Mathieu2jean","@Sophie_T_J","@laurentcalixte","@patrockwilliams","@PascaleKremer","@AlexJaquin","@LauraIsaaz","@cath_robin","@Del_Gautherin","@Isaduriez","@lucietuile","@AugeyBastien","@mcastagnet","@AminaKalache","@mvaudano","@CParrot","@ombelinetips","@_JoinLion","@BarbolosiRose","@ToiBruno1","@FloraClodic","@xjbdx","@AlexiaEy","@Emjy_STARK","@elcoco01","@rabilebon","@pflovens_","@FabriceFrossard","@MorganeSERRES","@MarjolaineKoch","@edgarsnow","@SRNLF","@CChassigneux","@NassiraELM","@NewsRicard","@Sandreene","@Emilezrt","@Pierre_Do","@Micode","@CColumelli","@DavidAbiker","@ClementBergantz","@benjaminrabier","@celinekallmann","@edwyplenel","@C_Barbier","@JJBourdin_RMC","@LaurenceFerrari","@aslapix","@IsaMillet","@MaximeSwitek","@tomjoubert","@jszanchi","@roqueeva","@XavierBiseul","@florencesantrot","@AntoineCrochet","@freeman59","@MaudeML","@philippe_gulpi","@mathieum76","@kiouari","@imanemoustakir","@BenedicteMallet","@Emilie_Brouze","@antoinebarret","@_nicolasbocquet","@remibuhagiar","@CourretB","@AymericRobert","@miraelmartins","@pmaniere","@jesuisraphk","@David_Ingram","@pcelerier","@technomedia","@Geraldinedauver","@ThierryLabro","@Newsdusud","@nrauline","@gbregeras","@SCouasnonBFM","@actualites_nrv","@dimitrimoulins","@oli_aura","@FabieChiche","@Vincent_Raimblt","@ChristophGreuet","@PAlbuchay","@MarrauddesGrot","@vtalmon","@cedric","@olivierfrigara","@Julien_Jay","@LydiaBerroyer","@Shuua","@datisdaz","@Steuph","@ameliecharnay","@Bruno_LesNums","@LelloucheNico","@CciliaDiQuinzio","@Elodie_C","@SylvRolland","@Kocobe","@FL_Debes","@jdupontcalbo","@GarciaVictor_","@NicoRichaud","@RHoueix","@simottel","@DamienLicata","@annabelle_L","@Lea_Lejeune","@axel_deb","@marin_eben","@ptiberry","@MatthieuDelach","@sandrinecassini","@benjaminferran","@ppgarcia75","@NotPatrick","@ivalerio","@FabienneSchmitt","@alexgoude","@JeromeColombain","@manhack","@Capucine_Cousin","@Fsorel","@oliviertesquet","@marjoriepaillon","@ginades","@PierreTran","@DelphineCuny","@reesmarc","@lauratenoudji","@ldupin","@carolinedescham","@Lucile_Quillet","@cgabizon","@Allocab","@epenser","@JAGventeprivee","@frwrds","@Laure__Bourdon","@Xavier75","@maximeverner","@s_jourdain"]

 # faire un programme qui en prend 5 au hasard, et 
 # qui leur tweet une phrase symp
def tweet_random_journalists(
	client, journalists_array,journalist_count=5,sleep_span=15)
	
	random_journalists_array = 
	journalists_array.sample(journalist_count).
	collect do |journalist_tweet_id|
	client.update("I'm tweeting with #{journalist_tweet_id}!")
	sleep(sleep_span)
	end
end

# liker les derniers tweets (minimum les 25 derniers) 
# qui ont le hashtag #bonjour_monde
def like_last_tweets_with_hashtag(client, hashtag,like_count=5)
	client.search(hashtag.to_s, result_type: "recent").
	take(like_count).each do |tweet|
  client.favorite(tweet)
	end
end

# follow les dernières personnes (minimum 20) qui ont 
# tweeté avec le hashtag #bonjour_monde. 
def follow_last_likers_of_hashtag(
	client,hashtag,
	follow_count=20)
	client.search(hashtag.to_s, result_type: "recent").
	take(follow_count).each do |tweet|
	binding.pry		
  client.follow(tweet.user.id)
	end

end



# Maintenant tu vas utiliser la fonction Streaming de 
# l'API Twitter afin de réagir en live. 
# Mets en place un robot qui like et follow 
# les comptes tweetant le #bonjour_monde dès l'apparition du Tweet. 
# Pour rendre le programme un peu visuel, n'hésite pas à mettre des puts 
# dès que tu repères un Tweet comme ça (qu'il apparaisse sur ton terminal) ! 
#  Et s'ils ne sont pas nombreux, demande à tes potes de Tweeter un peu… 
#  mais sans se faire bloquer hein !
# Comme il ne réagit qu'en live, ce programme devra tourner 
# en tâche de fond de ton ordinateur.

def login_streaming_twitter
  client = Twitter::Streaming::Client.new do |config|
  config.consumer_key        = ENV["TWITTER_CONSUMER_KEY"]
  config.consumer_secret     = ENV["TWITTER_CONSUMER_SECRET"]
  config.access_token        = ENV["TWITTER_ACCESS_TOKEN"]
  config.access_token_secret = ENV["TWITTER_ACCESS_TOKEN_SECRET"]
end
client
end

def tweets_with_hashtag_streaming_printer(
	stream_client, 
	hashtag,
	sleep_span=75)

	stream_client.filter(track: hashtag.to_s) do |tweet|
	# binding.pry
	puts "="*60
	puts " "*5 + "STREAMED TWEET WITH THE HASHTAG #{hashtag}"
	puts "="*60
	puts
	puts "Creation date:  #{tweet.created_at}"
	puts "User name: #{tweet.user.screen_name}"
	puts "User url: #{tweet.user.url.inspect}"
	puts
	puts  "Tweet content:"
	puts tweet.text.inspect
	puts
	puts "END"
	puts
	end
end


def login_twitter
client = Twitter::REST::Client.new do |config|
  config.consumer_key        = ENV["TWITTER_CONSUMER_KEY"]
  config.consumer_secret     = ENV["TWITTER_CONSUMER_SECRET"]
  config.access_token        = ENV["TWITTER_ACCESS_TOKEN"]
  config.access_token_secret = ENV["TWITTER_ACCESS_TOKEN_SECRET"]
end
client
end

def perform(journalists_array)
	# client = login_twitter
	# tweet_random_journalists(
	# client, journalists_array,journalist_count=5)
	# like_last_tweets_with_hashtag(
	# 	client,"#bonjour_monde",like_count=5)
	# follow_last_likers_of_hashtag(
	# 	client,
	# 	"#bonjour_monde",
	# 	follow_count=20)

	stream_client = login_streaming_twitter
	tweets_with_hashtag_streaming_printer(
	stream_client, 
	"#bonjour_monde",
	sleep_span=75)


end

perform(journalists_array)





# ligne qui permet de tweeter sur ton compte
# client.update('Test : tweet en Ruby')