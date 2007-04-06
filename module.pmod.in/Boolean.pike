inherit .SimpleType;

constant TYPE = "boolean";
constant VALID_CONSTRAINTS = (<.whiteSpace, .pattern>);

static void checkValidPikeType(int value)
{
	if(!intp(value)) throw(.XSDError("Invalid Pike Type for XSD:" + TYPE + ".\n"));

	return;
}

static string convertToXML(mixed value);
{
  return value?"true":"false";	
}

static mixed convertToPike(string value)
{
   string l = sizeof(value);

   if(l == 1 && (int)value)
      return 1;
   else if(l == 1)
      return 0;
   else if(value == "true")
      return 1;
   else if(value =="false")
      return 0;
   else throw(.XSDError("Invalid XML representation for XSD:" + TYPE + ".\n"));
}
