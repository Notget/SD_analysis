/* Party */
DELETE FROM `pplan_v3_7_test1`.`test1_party`;
INSERT INTO `pplan_v3_7_test1`.`test1_party`

(`partyID`,
`personName`,
`personAge`,
`contactName`,
`contactNumber`,
`contactEmail`,
`numSkaters`,
`numOfTables`,
`dateScheduled`,
`custConfirmDate`,
`Notes`,
`calculatedSubtTotal`,
`calculatedTax`,
`calculatedTotal`,
`downPaymentAmt`,
`payConfNum`,
`checkedIn`,
`paidOnsiteAmt`,
`BookedBy`,
`ConfCode`,
`isConfirmed`)

SELECT `party`.`partyID`,
    `party`.`personName`,
    `party`.`personAge`,
    `party`.`contactName`,
    `party`.`contactNumber`,
    `party`.`contactEmail`,
    `party`.`numSkaters`,
    `party`.`numOfTables`,
    `party`.`dateScheduled`,
    `party`.`custConfirmDate`,
    `party`.`Notes`,
    `party`.`calculatedSubtTotal`,
    `party`.`calculatedTax`,
    `party`.`calculatedTotal`,
    `party`.`downPaymentAmt`,
    `party`.`payConfNum`,
    `party`.`checkedIn`,
    `party`.`paidOnsiteAmt`,
    `party`.`BookedBy`,
    `party`.`ConfCode`,
    `party`.`isConfirmed`

FROM `pplan_v1_esd`.`party`;

/* DeletedParty */

DELETE FROM `pplan_v3_7_test1`.`test1_deletedparty`;
INSERT INTO `pplan_v3_7_test1`.`test1_deletedparty`

(`partyID`,
`personName`,
`personAge`,
`contactName`,
`contactNumber`,
`contactEmail`,
`numSkaters`,
`numOfTables`,
`dateScheduled`,
`custConfirmDate`,
`Notes`,
`calculatedSubtTotal`,
`calculatedTax`,
`calculatedTotal`,
`downPaymentAmt`,
`payConfNum`,
`checkedIn`,
`paidOnsiteAmt`,
`BookedBy`,
`ConfCode`,
`isConfirmed`)


SELECT `deletedparty`.`partyID`,
    `deletedparty`.`personName`,
    `deletedparty`.`personAge`,
    `deletedparty`.`contactName`,
    `deletedparty`.`contactNumber`,
    `deletedparty`.`contactEmail`,
    `deletedparty`.`numSkaters`,
    `deletedparty`.`numOfTables`,
    `deletedparty`.`dateScheduled`,
    `deletedparty`.`custConfirmDate`,
    `deletedparty`.`Notes`,
    `deletedparty`.`calculatedSubtTotal`,
    `deletedparty`.`calculatedTax`,
    `deletedparty`.`calculatedTotal`,
    `deletedparty`.`downPaymentAmt`,
    `deletedparty`.`payConfNum`,
    `deletedparty`.`checkedIn`,
    `deletedparty`.`paidOnsiteAmt`,
    `deletedparty`.`BookedBy`,
    `deletedparty`.`ConfCode`,
    `deletedparty`.`isConfirmed`

FROM `pplan_v1_esd`.`deletedparty`;

/* Calendar */
DELETE FROM `pplan_v3_7_test1`.`test1_calendar`;
INSERT INTO `pplan_v3_7_test1`.`test1_calendar`
(`datenum`,
`dayofyear`,
`dayofweekshort`,
`dayofweeknum`,
`dayofweek`,
`weeknum`,
`isclosed`,
`isholiday`,
`daytitle`)

SELECT `calendar`.`datenum`,
    `calendar`.`dayofyear`,
    `calendar`.`dayofweekshort`,
    `calendar`.`dayofweeknum`,
    `calendar`.`dayofweek`,
    `calendar`.`weeknum`,
    `calendar`.`isclosed`,
    `calendar`.`isholiday`,
    `calendar`.`daytitle`

FROM `pplan_v1_esd`.`calendar`;

/* Logs */

DELETE FROM `pplan_v3_7_test1`.`test1_log`;
INSERT INTO `pplan_v3_7_test1`.`test1_log`
(`DateTime`,
`Type`,
`Description`,
`Message`,
`Level`,
`UserID`,
`PageName`,
`AppVersion`)

SELECT `log`.`DateTime`,
    `log`.`Type`,
    `log`.`Description`,
    `log`.`Message`,
    `log`.`Level`,
    `log`.`UserID`,
    `log`.`PageName`,
    '1.11'

FROM `pplan_v1_esd`.`log`;

/* Party Notes */
DELETE FROM `pplan_v3_7_test1`.`test1_partynotes`;
INSERT INTO `pplan_v3_7_test1`.`test1_partynotes`
(`partyid`,
`NoteSeq`,
`LineItem`,
`isPrivateComment`)

SELECT `partynotes`.`partyid`,
    `partynotes`.`NoteSeq`,
    `partynotes`.`LineItem`,
    `partynotes`.`isPrivateComment`

FROM `pplan_v1_esd`.`partynotes`;

/* PartyPizza */

DELETE FROM `pplan_v3_7_test1`.`test1_partypizza`;
INSERT INTO `pplan_v3_7_test1`.`test1_partypizza`
(`partyID`,
`pizzaNumber`,
`toppings`,
`Notes`)

SELECT `partypizza`.`partyID`,
    `partypizza`.`pizzaNumber`,
    `partypizza`.`toppings`,
    `partypizza`.`Notes`

FROM `pplan_v1_esd`.`partypizza`;

/* PartyReceipt - These will not match historicaly */
DELETE FROM  `pplan_v3_7_test1`.`test1_partyreceipt`;
INSERT INTO `pplan_v3_7_test1`.`test1_partyreceipt`
(`partyID`,
`LineItem`,
`SubLineitem`,
`IsVisible`,
`qty`,
`description`,
`unitPrice`,
`subTotal`,
`tax`,
`total`)

SELECT `partyreceipt`.`partyID`,
    `partyreceipt`.`LineItem`,
    0,
    `partyreceipt`.`IsVisible`,
    `partyreceipt`.`qty`,
    `partyreceipt`.`description`,
    `partyreceipt`.`unitPrice`,
    `partyreceipt`.`subTotal`,
    `partyreceipt`.`tax`,
    `partyreceipt`.`total`

FROM `pplan_v1_esd`.`partyreceipt`;

/* Party Tables */

DELETE FROM `pplan_v3_7_test1`.`test1_partytable`;
INSERT INTO `pplan_v3_7_test1`.`test1_partytable`
(`partyID`,
`sessionID`,
`sessionDate`,
`tableID`)

SELECT `partytable`.`partyID`,
    `partytable`.`sessionID`,
    `partytable`.`sessionDate`,
    `partytable`.`tableID`

FROM `pplan_v1_esd`.`partytable`;

/* Session no AllowInflate! */

DELETE FROM `pplan_v3_7_test1`.`test1_session`;
INSERT INTO `pplan_v3_7_test1`.`test1_session`
(`sessionDate`,
`sessionID`,
`startTime`,
`endTime`,
`private`,
`sessiontitle`,
`allowParties`,
`PartyDiscountAmt`,
`endDate`,
`sessionMemo`,
`RegSkate`,
`UpgradeSkate`,
`ownSkate`)

SELECT `session`.`sessionDate`,
    `session`.`sessionID`,
    `session`.`startTime`,
    `session`.`endTime`,
    `session`.`private`,
    `session`.`sessiontitle`,
    `session`.`allowParties`,
    `session`.`PartyDiscountAmt`,
    `session`.`endDate`,
    `session`.`sessionMemo`,
    `session`.`RegSkate`,
    `session`.`UpgradeSkate`,
    `session`.`ownSkate`

FROM `pplan_v1_esd`.`session`;

/* Session Party Table */

DELETE FROM `pplan_v3_7_test1`.`test1_partytable`;
INSERT INTO `pplan_v3_7_test1`.`test1_partytable`
(`partyID`,
`sessionID`,
`sessionDate`,
`tableID`)

SELECT `partytable`.`partyID`,
    `partytable`.`sessionID`,
    `partytable`.`sessionDate`,
    `partytable`.`tableID`

FROM `pplan_v1_esd`.`partytable`;

/* TableResources */

DELETE FROM `pplan_v3_7_test1`.`test1_tableresource`;
INSERT INTO `pplan_v3_7_test1`.`test1_tableresource`
(`tableID`,
`peopleAmount`,
`adjacentTable`,
`TableName`)

SELECT `tableresource`.`tableID`,
    `tableresource`.`peopleAmount`,
    `tableresource`.`adjacentTable`,
    `tableresource`.`TableName`

FROM `pplan_v1_esd`.`tableresource`;

/* SessionParty */

DELETE FROM `pplan_v3_7_test1`.`test1_sessionparty`;
INSERT INTO `pplan_v3_7_test1`.`test1_sessionparty`
(`sessionDate`,
`sessionID`,
`partyID`,
`tableStartTime`,
`tableCount`)

SELECT `sessionparty`.`sessionDate`,
    `sessionparty`.`sessionID`,
    `sessionparty`.`partyID`,
    `sessionparty`.`tableStartTime`,
    `sessionparty`.`tableCount`

FROM `pplan_v1_esd`.`sessionparty`;

/* SessionTableTimes */

DELETE FROM `pplan_v3_7_test1`.`test1_sessiontabletimes`;
INSERT INTO `pplan_v3_7_test1`.`test1_sessiontabletimes`
(`sessionDate`,
`sessionID`,
`tableStartTime`,
`tableEndTime`,
`tableEndDate`)

SELECT `sessiontabletimes`.`sessionDate`,
    `sessiontabletimes`.`sessionID`,
    `sessiontabletimes`.`tableStartTime`,
    `sessiontabletimes`.`tableEndTime`,
    `sessiontabletimes`.`tableEndDate`

FROM `pplan_v1_esd`.`sessiontabletimes`;

/* Resolve Addon Linkage */

DELETE FROM  `pplan_v3_7_test1`.`test1_party_addon`;
INSERT INTO `pplan_v3_7_test1`.`test1_party_addon`
(`partyID`,
`qty`,
`addonID`,
`optionID`)

/* - All parties that have skaters */

SELECT `party`.`partyID`, `party`.`numSkaters` , 1,0
FROM `pplan_v1_esd`.`party`
union

/* - Copy Tables */

SELECT `party`.`partyID`, `party`.`numOfTables` , 5,0
FROM `pplan_v1_esd`.`party`
union

/* Inflatabes */

SELECT `party`.`partyID`, `party`.`numSkaters` , 2,0
FROM `pplan_v1_esd`.`party`
where  `party`.`addInflate` = 1
union
SELECT `party`.`partyID`, `party`.`numSkaters`, 3,0
FROM `pplan_v1_esd`.`party`
where  `party`.`addBags` = 1
union
SELECT `party`.`partyID`, `party`.`numSkaters`, 4,0
FROM `pplan_v1_esd`.`party`
where  `party`.`addBucks` = 1
union
SELECT `party`.`partyID`, `party`.`numSkaters`, 7,7
FROM `pplan_v1_esd`.`party`;
