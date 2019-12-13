{*!
 * Fano Web Framework (https://fanoframework.github.io)
 *
 * @link      https://github.com/fanoframework/fano
 * @copyright Copyright (c) 2018 Zamrony P. Juhara
 * @license   https://github.com/fanoframework/fano/blob/master/LICENSE (MIT)
 *}

unit RouteBuilderIntf;

interface

{$MODE OBJFPC}
{$H+}

uses

    RouterIntf;

type

    (*!------------------------------------------------
     * interface for any class that can build routes
     *
     * @author Zamrony P. Juhara <zamronypj@yahoo.com>
     *-------------------------------------------------*)
    IRouteBuilder = interface
        ['{46016416-B249-4258-B76A-7F5B55E8348D}']

        (*!----------------------------------------------
         * build application routes
         * ----------------------------------------------
         * @param router instance of router
         *-----------------------------------------------*)
        procedure buildRoutes(const router : IRouter);
    end;

implementation
end.
