{*!
 * Fano Web Framework (https://fano.juhara.id)
 *
 * @link      https://github.com/zamronypj/fano
 * @copyright Copyright (c) 2018 Zamrony P. Juhara
 * @license   https://github.com/zamronypj/fano/blob/master/LICENSE (GPL 3.0)
 *}

unit AlphaNumValidatorImpl;

interface

{$MODE OBJFPC}
{$H+}

uses

    RegexIntf,
    ValidatorIntf,
    BaseValidatorImpl;

type

    (*!------------------------------------------------
     * basic class having capability to
     * validate input data using regex matching
     *
     * @author Zamrony P. Juhara <zamronypj@yahoo.com>
     *-------------------------------------------------*)
    TRegexValidator = class(TBaseValidator)
    private
        regex : IRegex;
        regexPattern : string;
    public
        (*!------------------------------------------------
         * constructor
         *-------------------------------------------------
         * @param regexInst instance of IRegex
         * @param pattern regex pattern to use for matching
         * @param errMsgFormat message that is used as template
         *                    for error message
         *-------------------------------------------------
         * errMsgFormat can use format that is support by
         * SysUtils.Format() function
         *-------------------------------------------------*)
        constructor create(
            const regexInst : IRegex;
            const pattern : string;
            const errMsgFormat : string
        );
        destructor destroy(); override;

        (*!------------------------------------------------
         * Validate data
         *-------------------------------------------------
         * @param key name of field
         * @param dataToValidate input data
         * @return true if data is valid otherwise false
         *-------------------------------------------------*)
         function isValid(
             const key : shortstring;
             const dataToValidate : IHashList
         ) : boolean; override;
    end;

implementation

    (*!------------------------------------------------
     * constructor
     *-------------------------------------------------
     * @param regexInst instance of IRegex
     * @param pattern regex pattern to use for matching
     * @param errMsgFormat message that is used as template
     *                    for error message
     *-------------------------------------------------
     * errMsgFormat can use format that is support by
     * SysUtils.Format() function
     *-------------------------------------------------*)
    constructor TRegexValidator.create(
        const regexInst : IRegex;
        const pattern : string;
        const errMsgFormat : string
    );
    begin
        inherited create(errMsgFormat);
        regex := regexInst;
        regexPattern := pattern;
    end;

    destructor TRegexValidator.destroy();
    begin
        inherited destroy();
        regex := nil;
    end;

    (*!------------------------------------------------
     * Validate data
     *-------------------------------------------------
     * @param dataToValidate data to validate
     * @return true if data is valid otherwise false
     *-------------------------------------------------*)
    function TRegexValidator.isValid(const dataToValidate : string) : boolean;
    begin
        result := regex.match(regexPattern, dataToValidate).matched;
    end;
end.