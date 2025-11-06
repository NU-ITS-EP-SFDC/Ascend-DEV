/**
 * @author Stefan Cudjoe
 * @description A helper class for handling errors that occur in Lightning context.
 *
 * History
 * <Date>       <Author Name>       <User Story>        <Change Description>
 * 2023-06-12    Stefan Cudjoe         CFG-175                Initial Creation
 */

// Schema imports
import { ShowToastEvent } from "lightning/platformShowToastEvent";
import { createRecord } from "lightning/uiRecordApi";

// Object imports
import ERR_OBJECT from "@salesforce/schema/cfg_Error__c";
import ERR_CONTEXT_TYPE_FIELD from "@salesforce/schema/cfg_Error__c.cfg_Context_Type__c";
import ERR_DATETIME_FIELD from "@salesforce/schema/cfg_Error__c.cfg_Datetime__c";
import ERR_FULL_MESSAGE_FIELD from "@salesforce/schema/cfg_Error__c.cfg_Full_Message__c";
import ERR_OBJECT_TYPE_FIELD from "@salesforce/schema/cfg_Error__c.cfg_Object_Type__c";
import ERR_STACK_TRACE_FIELD from "@salesforce/schema/cfg_Error__c.cfg_Stack_Trace__c";
import ERR_RELATED_SYSTEM_FIELD from "@salesforce/schema/cfg_Error__c.cfg_Related_System__c";
import ERR_ERROR_TYPE_FIELD from "@salesforce/schema/cfg_Error__c.cfg_Error_Type__c";
import ERR_RECORD_URL_FIELD from '@salesforce/schema/cfg_Error__c.cfg_Record_URL__c';


// Custom label imports
import TOAST_TITLE_LABEL from '@salesforce/label/c.LWCErrorToastTitle';
import TOAST_MESSAGE_LABEL from '@salesforce/label/c.LWCErrorToastMessage';

// Default toast values.
const TOAST_TITLE = TOAST_TITLE_LABEL;
const TOAST_MESSAGE = TOAST_MESSAGE_LABEL;

/**
 * Builds a new Error__c record and inserts it. Then returns a Promise
 * resolution with a new ShowToastEvent for component to fire on the front end.
 *
 * @param {string} contextType The Context Type of Error.
 * @param {Object} error The error object to read error messages from.
 * @param {string} errorType The Type of Error.
 * @param {boolean} isAura Whether or not this error is being created an Aura context.
 * @param {string} message The Full message of Error.
 * @param {string} objectType The Object Type of Error.
 * @param {string} system The Related System of Error.
 * @param {string} recordUrl The Record Url of Error.
 * @param {string} [toastMessage] The value to give the message on the Toast that is displayed.
 * @param {string} [toastTitle] The value to give the title on the Toast that is displayed.
 * @returns {Promise.<ShowToastEvent>} a new ShowToastEvent value to fire in the UI.
 */
const buildErrorAndToast = (
    contextType,
    error,
    errorType,
    isAura = false,
    message,
    objectType,
    system,
    recordUrl,
    toastMessage = TOAST_MESSAGE,
    toastTitle = TOAST_TITLE,
) => {
    return new Promise((resolve, reject) => {
        // Create the Error record, then resolve/reject.
        createRecord({
            apiName: ERR_OBJECT.objectApiName,
            fields: buildErrorRecord(contextType, error, errorType, isAura, message, objectType, system, recordUrl)
        })
            .then(() => {
                // Return a new Toast Event to fire in a LightningElement context.
                resolve(new ShowToastEvent({
                    title: toastTitle,
                    message: toastMessage,
                    variant: "error",
                    mode: "dismissible"
                }));
            })
            .catch((error) => {
                reject(error);
            });
    });
}

/**
 * Creates a new fields object to use in createRecord call for a new cfg_Error__c record.
 *
 * @param {string} contextType The Context Type of Error.
 * @param {Object} error The error object to read error messages from.
 * @param {string} errorType The Type of Error.
 * @param {boolean} isAura Whether or not this is being called from an Aura context.
 * @param {string} message The Full message of Error.
 * @param {string} objectType The Object Type of Error.
 * @param {string} system The Related System of Error.
 * @param {string} recordUrl The Record Url of Error.
 * @returns {Object} A new fields object to pass to createRecord.
 */
const buildErrorRecord = (
    contextType,
    error,
    errorType,
    isAura = false,
    message,
    objectType,
    system,
    recordUrl
) => {
    const fields = {};
    fields[ERR_CONTEXT_TYPE_FIELD.fieldApiName] = contextType;
    fields[ERR_DATETIME_FIELD.fieldApiName] = new Date().toISOString();
    fields[ERR_RELATED_SYSTEM_FIELD.fieldApiName] = system;
    fields[ERR_ERROR_TYPE_FIELD.fieldApiName] = errorType;
    fields[ERR_OBJECT_TYPE_FIELD.fieldApiName] = objectType;
    fields[ERR_RECORD_URL_FIELD.fieldApiName] = recordUrl

    // Parse error message data differently if in Aura context.
    if (error) {
        if (isAura) {
            fields[ERR_FULL_MESSAGE_FIELD.fieldApiName] = `${message} | ${getFormattedAuraErrors(error)}`;
            fields[ERR_STACK_TRACE_FIELD.fieldApiName] = `${Array.isArray(error)
                ? error.map(e => e.stackTrace).join(' | ')
                : error.stackTrace}`;
        } else {
            fields[ERR_FULL_MESSAGE_FIELD.fieldApiName] = `${message} | ${getFormattedLWCErrors(error)}`;
            fields[ERR_STACK_TRACE_FIELD.fieldApiName] = `${Array.isArray(error.body)
                ? error.body.map(e => e.stackTrace).join(' | ')
                : error.body.stackTrace}`;
        }
    } else {
        fields[ERR_FULL_MESSAGE_FIELD.fieldApiName] = message;
    }

    return fields;
};

/**
 * Parses out the error message from the provided error object specific for
 * Aura. If an Array, concatenates the messages.
 *
 * @param {Object} error The error object to parse the error message from.
 * @returns {string} The error message as a single string.
 */
const getFormattedAuraErrors = (error) => {
    return Array.isArray(error)
        ? error.map(e => e.message).join(' | ')
        : error.message;
};

/**
 * Parses out the error message from the provided error object specific for
 * LWC. If an Array, concatenates the messages.
 *
 * @param {Object} error The error object to parse the error message from.
 * @returns {string} The error message as a single string.
 */
const getFormattedLWCErrors = (error) => {
    return Array.isArray(error.body)
        ? error.body.map(e => e.message).join(' | ')
        : error.body.message;
};

export { buildErrorAndToast };