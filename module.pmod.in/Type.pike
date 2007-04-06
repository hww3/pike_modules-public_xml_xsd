inherit .Namespaces;

constant TYPE = "anyType";
constant VALID_CONSTRAINTS = (<>);

array(Facet) constraints = ({});

static mixed value;

//!
string getType()
{
	return TYPE;
}

//!
string getAddress()
{
	return NAMESPACE_BASE + "#" + getType();
}

void addConstraint(.Facet constraint)
{
  if(!VALID_CONSTRAINTS[object_program(constraint)])
    throw(.XSDError("Invalid constraint " + constraint->getType() + " for XSD:" + getType()));

  constraints += ({constraint});
}

//!
void setValue(mixed value);
{
  value = parseValue(value);
}

//!
void setXMLValue(string value)
{
  value = parseXMLValue(value);	
}

//!
mixed getValue();
{
  return value;	
}

//!
string getXMLValue()
{
	return convertToXML(value);
}

static mixed parseValue(mixed value)
{
   checkValidPikeType(value);

   foreach(constraints;; Facet constraint)
   {
	  constraint->validate(value);
   }
   return value;	
}

static mixed parseXMLValue(string value)
{
  // first, we convert from XML to Pike.	
  mixed pikeValue = convertToPike(value);

  // then, we parse the value as a Pike value.
  return parseValue(pikeValue);
}

//! classes implementing XSD types should override this function.
//! this function should take a pike value of this type, and return the appropriate XSD lexical representation of the value.
static string convertToXML(mixed value);
{
  return value;	
}

//! classes implementing XSD types should override this function.
static mixed convertToPike(string value)
{
   return value;	
}

//! classes implementing XSD types should override this function. 
//! if a class does not represent a valid pike datatype for this general, an error should be thrown.
static void checkValidPikeType(mixed value)
{
	return;
}