public with sharing class ChangeImagen {

	public String idRegistro{get;set;}
	public String idreg{get;set;}
	public Attachment document{get;set;}


	public ChangeImagen() {
		idRegistro = Apexpages.currentPage().getParameters().get('idImagen');
		idreg = Apexpages.currentPage().getParameters().get('id');
		document = new Attachment();
		document = [SELECT Id, Name, Description, CreatedDate FROM Attachment WHERE Id =: idRegistro];
	}

	public PageReference returnToSlide(){
		delete document;
		PageReference pag = new PageReference('/apex/imagesSlide');
		pag.getParameters().put('id',idreg);
		return pag;
	}

	public PageReference regresar(){
		PageReference pa = new PageReference('/apex/Schema_Comunity');
		pa.getParameters().put('id',idreg);
		return pa;
	}

}