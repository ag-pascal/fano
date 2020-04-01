{*!
 * Fano Web Framework (https://fanoframework.github.io)
 *
 * @link      https://github.com/fanoframework/fano
 * @copyright Copyright (c) 2018 Zamrony P. Juhara
 * @license   https://github.com/fanoframework/fano/blob/master/LICENSE (MIT)
 *}

unit FpcHttpPostImpl;

interface

{$MODE OBJFPC}
{$H+}

uses

    HttpPostClientIntf,
    ResponseStreamIntf,
    SerializeableIntf;

type

    (*!------------------------------------------------
     * class that send HTTP GET to server
     *
     * @author Zamrony P. Juhara <zamronypj@yahoo.com>
     *-----------------------------------------------*)
    TFpcHttpPost = class(TFpcHttpMethod, IHttpPostClient)
    public

        (*!------------------------------------------------
         * send HTTP POST request
         *-----------------------------------------------
         * @param url url to send request
         * @param data data related to this request
         * @return response from server
         *-----------------------------------------------*)
        function post(
            const url : string;
            const data : ISerializeable = nil
        ) : IResponseStream;

    end;

implementation

uses

    Classes,
    ResponseStreamImpl;

    (*!------------------------------------------------
     * send HTTP POST request
     *-----------------------------------------------
     * @param url url to send request
     * @param data data related to this request
     * @return current instance
     *-----------------------------------------------*)
    function TFpcHttpPost.post(
        const url : string;
        const data : ISerializeable = nil
    ) : IResponseStream;
    var stream : TStream;
    begin
        fullUrl := fQueryStrBuilder.buildUrlWithQueryParams(url, data);
        try
            stream := TMemoryStream.create();
            fpHttpClient.post(url, stream);
            //wrap as IResponseStream and delete stream when goes out of scope
            result := TResponseStream.create(stream);
        except
            //something is wrong
            stream.free();
            result := nil;
        end;
    end;

end.