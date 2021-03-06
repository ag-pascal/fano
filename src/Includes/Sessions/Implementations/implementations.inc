{*!
 * Fano Web Framework (https://fanoframework.github.io)
 *
 * @link      https://github.com/fanoframework/fano
 * @copyright Copyright (c) 2018 - 2020 Zamrony P. Juhara
 * @license   https://github.com/fanoframework/fano/blob/master/LICENSE (MIT)
 *}

(*! ---------------------------------------------
 * implementation units for sessions
 * that is included in fano.pas unit
 *
 * @author Zamrony P. Juhara <zamronypj@yahoo.com>
 *-----------------------------------------------*)

ESessionExpiredImpl,
ESessionInvalidImpl,
ESessionKeyNotFoundImpl,

DecoratorSessionIdGeneratorImpl,
GuidSessionIdGeneratorImpl,
RawSessionIdGeneratorImpl,
Md5SessionIdGeneratorImpl,
Sha1SessionIdGeneratorImpl,
KeySessionIdGeneratorImpl,
IpTimeSessionIdGeneratorImpl,

KeyGuidSessionIdGeneratorFactoryImpl,
KeyRandSessionIdGeneratorFactoryImpl,
GuidSessionIdGeneratorFactoryImpl,
IpKeyGuidSessionIdGeneratorFactoryImpl,

FileSessionManagerImpl,
CookieSessionManagerImpl,

JsonSessionImpl,
JsonSessionFactoryImpl,

AbstractSessionManagerFactoryImpl,
JsonFileSessionManagerFactoryImpl,

IniSessionImpl,
IniSessionFactoryImpl,

IniFileSessionManagerFactoryImpl,

CookieSessionImpl,
CookieSessionFactoryImpl,

CookieSessionManagerFactoryImpl,

SessionMiddlewareExecutorImpl,

SessionResponseImpl,
