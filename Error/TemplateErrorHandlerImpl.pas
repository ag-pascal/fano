{*!
 * Fano Web Framework (https://fano.juhara.id)
 *
 * @link      https://github.com/zamronypj/fano
 * @copyright Copyright (c) 2018 Zamrony P. Juhara
 * @license   https://github.com/zamronypj/fano/blob/master/LICENSE (GPL 2.0)
 *}

unit TemplateErrorHandlerImpl;

interface

{$H+}

uses
    sysutils,
    DependencyIntf,
    ErrorHandlerIntf,
    BaseErrorHandlerImpl;

type

    (*!------------------------------------------------
     * default error handler that display error message
     * using HTML template file
     *
     * @author Zamrony P. Juhara <zamronypj@yahoo.com>
     *-----------------------------------------------*)
    TTemplateErrorHandler = class(TBaseErrorHandler, IErrorHandler, IDependency)
    private
        templateStr : string;
    public
        constructor create(const templateFile : string);
        function handleError(
            const exc : Exception;
            const status : integer = 500;
            const msg : string  = 'Internal Server Error'
        ) : IErrorHandler; override;
    end;

implementation

uses

    classes;

    constructor TTemplateErrorHandler.create(const templateFile : string);
    var fstream : TFileStream;
        len : longint;
    begin
        fstream := TFileStream.create(templateFile, fmOpenRead or fmShareDenyWrite);
        try
            len := fstream.size;
            setLength(templateStr, len);
            fstream.read(templateStr[1], len);
        finally
            fstream.free();
        end;
    end;

    function TTemplateErrorHandler.handleError(
        const exc : Exception;
        const status : integer = 500;
        const msg : string  = 'Internal Server Error'
    ) : IErrorHandler;
    begin
        writeln('Content-Type: text/html');
        writeln('Status: ', intToStr(status), ' ', msg);
        writeln();
        writeln(templateStr);
    end;
end.
