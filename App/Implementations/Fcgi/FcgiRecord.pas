{*!
 * Fano Web Framework (https://fano.juhara.id)
 *
 * @link      https://github.com/zamronypj/fano
 * @copyright Copyright (c) 2018 Zamrony P. Juhara
 * @license   https://github.com/zamronypj/fano/blob/master/LICENSE (GPL 3.0)
 *}

unit FcgiRecord;

interface

{$MODE OBJFPC}
{$H+}

type

    TFcgiRecord = class(TInterfacedObject, IFcgiRecord)
    private
    protected
        fVersion : byte;
        fType : byte;

        //two bytes with big endian order
        fRequestId : word;
        fContentLength : word;

        fPaddingLength : byte;
        fReserved : byte;

        fContentData : string;
        fPaddingData : shortstring;

        function setContentData(const data : string) : IFcgiRecord;
        function packPayload() : string;
    public
        constructor create();
    end;

implementation

uses

    fastcgi;

    constructor TFcgiRecord.create();
    begin
        fVersion := FCGI_VERSION_1;
        fType := FCGI_UNKNOWN_TYPE;
        fRequestId := FCGI_NULL_REQUEST_ID;
        fReserved := 0;
        fContentLength := 0;
        fPaddingLength := 0;
    end;

end.