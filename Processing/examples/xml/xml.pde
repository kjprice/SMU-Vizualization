// By the help of https://processing.org/reference/XML.html
// xml generated using https://msdn.microsoft.com/en-us/library/ms762271(v=vs.85).aspx
XML xml;

void setup() {
  xml = loadXML("books.xml");
  XML[] children = xml.getChildren("book");
  
  for (int i = 0; i < children.length; i++) {
    XML child = children[i];
    
    println(child.getChild("title").getContent());
  }
}