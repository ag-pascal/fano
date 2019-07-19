{*!
 * Fano Web Framework (https://fanoframework.github.io)
 *
 * @link      https://github.com/fanoframework/fano
 * @copyright Copyright (c) 2018 Zamrony P. Juhara
 * @license   https://github.com/fanoframework/fano/blob/master/LICENSE (MIT)
 *}
unit BaseDispatcherImpl;

interface

{$MODE OBJFPC}
{$H+}

uses

    DispatcherIntf,
    EnvironmentIntf,
    ResponseIntf,
    ResponseFactoryIntf,
    RequestFactoryIntf,
    RouteMatcherIntf,
    RouteHandlerIntf,
    InjectableObjectImpl;

type
    (*!------------------------------------------------
     * base abstract dispatcher implementation
     *
     * @author Zamrony P. Juhara <zamronypj@yahoo.com>
     *-----------------------------------------------*)
    TBaseDispatcher = class(TInjectableObject, IDispatcher)
    protected
        routeCollection : IRouteMatcher;
        responseFactory : IResponseFactory;
        requestFactory : IRequestFactory;

        function getRouteHandler(const env: ICGIEnvironment) : IRouteHandler;
    public
        constructor create(
            const routes : IRouteMatcher;
            const respFactory : IResponseFactory;
            const reqFactory : IRequestFactory
        );
        destructor destroy(); override;
        function dispatchRequest(const env: ICGIEnvironment) : IResponse; virtual; abstract;
    end;

implementation

uses
    sysutils,
    UrlHelpersImpl;

    constructor TBaseDispatcher.create(
        const routes : IRouteMatcher;
        const respFactory : IResponseFactory;
        const reqFactory : IRequestFactory
    );
    begin
        routeCollection := routes;
        responseFactory := respFactory;
        requestFactory := reqFactory;
    end;

    destructor TBaseDispatcher.destroy();
    begin
        inherited destroy();
        routeCollection := nil;
        responseFactory := nil;
        requestFactory := nil;
    end;

    function TBaseDispatcher.getRouteHandler(const env: ICGIEnvironment) : IRouteHandler;
    begin
        result := routeCollection.match(
            env.requestMethod(),
            //remove any query string parts to avoid messing up pattern matching
            env.requestUri().stripQueryString()
        );
    end;
end.