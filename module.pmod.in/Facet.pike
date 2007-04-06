inherit .Namespaces;

constant TYPE = "";

.Type of; 


string getType()
{
	return TYPE;
}

string getAddress()
{
	if(of)
	{
		return of->getAddress() + "." + getType();
	}
	
	else return NAMESPACE_BASE + "#" + getType();
}