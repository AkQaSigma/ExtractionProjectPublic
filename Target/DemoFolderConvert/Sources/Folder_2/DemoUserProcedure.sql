/*** MSC-WARNING - MSCEWI1039 - SEMANTIC INFORMATION COULD NOT BE LOADED FOR InsertDemoUser. CHECK IF THE NAME IS INVALID OR DUPLICATED. ***/
CREATE OR REPLACE PROCEDURE PUBLIC.InsertDemoUser (IN_FIRSTNAME STRING, IN_LASTNAME STRING, IN_PHONENUMBER FLOAT, IN_EMAIL STRING, IN_REGISTRATIONDATE DATE
)
RETURNS STRING
LANGUAGE JAVASCRIPT
EXECUTE AS CALLER
AS
$$
 	// REGION SnowConvert Helpers Code
	var HANDLE_NOTFOUND;
	var _RS, ROW_COUNT, _ROWS, MESSAGE_TEXT, SQLCODE = 0, SQLSTATE = '00000', ERROR_HANDLERS, ACTIVITY_COUNT = 0, INTO, _OUTQUERIES = [], DYNAMIC_RESULTS = -1;
	var formatDate = (arg) => (new Date(arg - (arg.getTimezoneOffset() * 60000))).toISOString().slice(0,-1);
	var fixBind = function (arg) {
	   arg = arg == undefined ? null : arg instanceof Date ? formatDate(arg) : arg;
	   return arg;
	};
	var EXEC = function (stmt,binds,noCatch,catchFunction,opts) {
	   try {
	      binds = binds ? binds.map(fixBind) : binds;
	      _RS = snowflake.createStatement({
	            sqlText : stmt,
	            binds : binds
	         });
	      _ROWS = _RS.execute();
	      ROW_COUNT = _RS.getRowCount();
	      ACTIVITY_COUNT = _RS.getNumRowsAffected();
	      HANDLE_NOTFOUND && HANDLE_NOTFOUND(_RS);
	      if (INTO) return {
	         INTO : function () {
	            return INTO();
	         }
	      };
	      if (_OUTQUERIES.length < DYNAMIC_RESULTS) _OUTQUERIES.push(_ROWS.getQueryId());
	      if (opts && opts.temp) return _ROWS.getQueryId();
	   } catch(error) {
	      MESSAGE_TEXT = error.message;
	      SQLCODE = error.code;
	      SQLSTATE = error.state;
	      var msg = `ERROR CODE: ${SQLCODE} SQLSTATE: ${SQLSTATE} MESSAGE: ${MESSAGE_TEXT}`;
	      if (catchFunction) catchFunction(error);
	      if (!noCatch && ERROR_HANDLERS) ERROR_HANDLERS(error); else throw new Error(msg);
	   }
	};
	// END REGION
	
	// ** MSC-WARNING - MSCEWI1022 - ONE OR MORE IDENTIFIERS IN THIS STATEMENT WERE CONSIDERED PARAMETERS BY DEFAULT. REFERENCED TABLE NOT FOUND. **
	EXEC(`INSERT INTO PUBLIC.DemoUsers (FirstName, LastName, PhoneNumber, Email, RegistrationDate)
	VALUES (:1, :2, :3, :4, :5)`,[IN_FIRSTNAME,IN_LASTNAME,IN_PHONENUMBER,IN_EMAIL,IN_REGISTRATIONDATE]);
 
$$;