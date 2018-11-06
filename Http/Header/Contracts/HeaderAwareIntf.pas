{*!
 * Fano Web Framework (https://fanoframework.github.io)
 *
 * @link      https://github.com/zamronypj/fano
 * @copyright Copyright (c) 2018 Zamrony P. Juhara
 * @license   https://github.com/zamronypj/fano/blob/master/LICENSE (GPL 3.0)
 *}

unit HeaderAwareIntf;

interface

{$MODE OBJFPC}

uses

    HeadersIntf;

type

    (*!------------------------------------------------
     * interface for any class having access to headers
     *
     * @author Zamrony P. Juhara <zamronypj@yahoo.com>
     *-----------------------------------------------*)
    IHeaderAwareIntf = interface
        ['{EC774511-6651-470B-862B-A2F0A82EAF9F}']

        (*!------------------------------------
         * get http header instance
         *-------------------------------------
         * @return header instance
         *-------------------------------------*)
        function headers() : IHeaders;
    end;

implementation
end.