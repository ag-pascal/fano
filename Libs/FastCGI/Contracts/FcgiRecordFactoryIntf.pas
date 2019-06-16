{*!
 * Fano Web Framework (https://fanoframework.github.io)
 *
 * @link      https://github.com/fanoframework/fano
 * @copyright Copyright (c) 2018 Zamrony P. Juhara
 * @license   https://github.com/fanoframework/fano/blob/master/LICENSE (MIT)
 *}

unit FcgiRecordFactoryIntf;

interface

{$MODE OBJFPC}
{$H+}

uses

    FcgiRecordIntf;

type

    (*!-----------------------------------------------
     * Interface for any class having capability to create
     * FastCGI record
     *
     * @author Zamrony P. Juhara <zamronypj@yahoo.com>
     *-----------------------------------------------*)
    IFcgiRecordFactory = interface
        ['{5B1B7CED-8804-4837-B0DE-D88C02BE66A2}']

        (*!------------------------------------------------
         * build fastcgi record instance
         *-----------------------------------------------*)
        function build() : IFcgiRecord;

        (*!------------------------------------------------
         * set request id
         *-----------------------------------------------
         * @return current instance
         *-----------------------------------------------*)
        function setRequestId(const reqId : word) : IFcgiRecordFactory;

        (*!------------------------------------------------
         * set content
         *-----------------------------------------------
         * @return current instance
         *-----------------------------------------------*)
        function setContent(const content : string) : IFcgiRecordFactory;
    end;

implementation

end.
