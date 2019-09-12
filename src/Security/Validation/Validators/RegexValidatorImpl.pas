{*!
 * Fano Web Framework (https://fanoframework.github.io)
 *
 * @link      https://github.com/fanoframework/fano
 * @copyright Copyright (c) 2018 Zamrony P. Juhara
 * @license   https://github.com/fanoframework/fano/blob/master/LICENSE (MIT)
 *}

unit RegexValidatorImpl;

interface

{$MODE OBJFPC}
{$H+}

uses

    ListIntf,
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
    protected
        (*!------------------------------------------------
         * actual data validation
         *-------------------------------------------------
         * @param dataToValidate input data
         * @return true if data is valid otherwise false
         *-------------------------------------------------*)
        function isValidData(var dataToValidate : string) : boolean; override;
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
             const dataToValidate : IList
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
        regex := nil;
        inherited destroy();
    end;

    (*!------------------------------------------------
     * actual data validation
     *-------------------------------------------------
     * @param dataToValidate input data
     * @return true if data is valid otherwise false
     *-------------------------------------------------*)
    function TRegexValidator.isValidData(const dataToValidate : string) : boolean;
    begin
        result := regex.match(regexPattern, dataToValidate).matched;
    end;
end.
