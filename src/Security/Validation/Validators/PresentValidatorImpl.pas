{*!
 * Fano Web Framework (https://fanoframework.github.io)
 *
 * @link      https://github.com/fanoframework/fano
 * @copyright Copyright (c) 2018 Zamrony P. Juhara
 * @license   https://github.com/fanoframework/fano/blob/master/LICENSE (MIT)
 *}

unit PresentValidatorImpl;

interface

{$MODE OBJFPC}
{$H+}

uses

    ListIntf,
    ValidatorIntf,
    BaseValidatorImpl;

type

    (*!------------------------------------------------
     * basic class having capability to
     * validate data that must be present and but
     * allowed to be empty
     *
     * @author Zamrony P. Juhara <zamronypj@yahoo.com>
     *-------------------------------------------------*)
    TPresentValidator = class(TBaseValidator)
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
         *-------------------------------------------------*)
        constructor create();

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

uses

    KeyValueTypes;

resourcestring

    sErrFieldIsPresent = 'Field %s must be present';

    (*!------------------------------------------------
     * constructor
     *-------------------------------------------------*)
    constructor TPresentValidator.create();
    begin
        inherited create(sErrFieldIsPresent);
    end;

    (*!------------------------------------------------
     * Validate data
     *-------------------------------------------------
     * @param key name of field
     * @param dataToValidate input data
     * @return true if data is valid otherwise false
     *-------------------------------------------------
     * We assume dataToValidate <> nil
     *-------------------------------------------------*)
    function TPresentValidator.isValid(
        const key : shortstring;
        const dataToValidate : IList
    ) : boolean;
    var val : PKeyValue;
    begin
        val := dataToValidate.find(key);
        result := (val <> nil) and isValidData(val^.value);
    end;

    (*!------------------------------------------------
     * actual data validation
     *-------------------------------------------------
     * @param dataToValidate input data
     * @return true if data is valid otherwise false
     *-------------------------------------------------*)
    function TPresentValidator.isValidData(const dataToValidate : string) : boolean;
    begin
        //we only need that key is present but it can be empty
        //so just return true here
        result := true;
    end;
end.
