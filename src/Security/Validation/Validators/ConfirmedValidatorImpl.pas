{*!
 * Fano Web Framework (https://fanoframework.github.io)
 *
 * @link      https://github.com/fanoframework/fano
 * @copyright Copyright (c) 2018 Zamrony P. Juhara
 * @license   https://github.com/fanoframework/fano/blob/master/LICENSE (MIT)
 *}

unit ConfirmedValidatorImpl;

interface

{$MODE OBJFPC}
{$H+}

uses

    ListIntf,
    RequestIntf,
    ValidatorIntf,
    BaseValidatorImpl;

type

    (*!------------------------------------------------
     * basic class having capability to
     * validate data that must be equal to other field.
     * This is mostly used for password confirmation
     *
     * @author Zamrony P. Juhara <zamronypj@yahoo.com>
     *-------------------------------------------------*)
    TConfirmedValidator = class(TBaseValidator)
    private
        fConfirmationField : shortstring;
    protected
        (*!------------------------------------------------
         * actual data validation
         *-------------------------------------------------
         * @param dataToValidate input data
         * @return true if data is valid otherwise false
         *-------------------------------------------------*)
        function isValidData(const dataToValidate : string) : boolean; override;
    public
        (*!------------------------------------------------
         * constructor
         *-------------------------------------------------*)
        constructor create(const confirmationField : shortstring);

        (*!------------------------------------------------
         * Validate data
         *-------------------------------------------------
         * @param fieldName name of field
         * @param dataToValidate input data
         * @param request request object
         * @return true if data is valid otherwise false
         *-------------------------------------------------*)
        function isValid(
            const fieldName : shortstring;
            const dataToValidate : IList;
            const request : IRequest
        ) : boolean; override;
    end;

implementation

uses

    KeyValueTypes;

resourcestring

    sErrFieldIsConfirmed = 'Field %s value must be equals to %s value';

    (*!------------------------------------------------
     * constructor
     *-------------------------------------------------*)
    constructor TConfirmedValidator.create(const confirmationField : shortstring);
    begin
        inherited create(sErrFieldIsConfirmed);
        fConfirmationField := confirmationField;
    end;

    (*!------------------------------------------------
     * Validate data
     *-------------------------------------------------
     * @param fieldName name of field
     * @param dataToValidate input data
     * @param request request object
     * @return true if data is valid otherwise false
     *-------------------------------------------------
     * We assume dataToValidate <> nil
     *-------------------------------------------------*)
    function TConfirmedValidator.isValid(
        const fieldName : shortstring;
        const dataToValidate : IList;
        const request : IRequest
    ) : boolean;
    var val, confirmVal : PKeyValue;
    begin
        val := dataToValidate.find(fieldName);
        confirmVal := dataToValidate.find(fConfirmationField);
        result := (val <> nil) and
            isValidData(val^.value) and
            (confirmVal <> nil) and
            (val^.value = confirmVal^.value);
    end;

    (*!------------------------------------------------
     * actual data validation
     *-------------------------------------------------
     * @param dataToValidate input data
     * @return true if data is valid otherwise false
     *-------------------------------------------------*)
    function TConfirmedValidator.isValidData(const dataToValidate : string) : boolean;
    begin
        result := true;
    end;
end.