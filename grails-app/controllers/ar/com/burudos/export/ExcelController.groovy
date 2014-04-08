package ar.com.burudos.export;

import static org.springframework.http.HttpStatus.*
import jxl.Workbook
import jxl.write.Label
import jxl.write.WritableSheet
import jxl.write.WritableWorkbook

class ExcelController {

	static allowedMethods = [downloadExcel: "POST"]

	def index() {
	}

	def downloadExcel() {

		response.setContentType('application/vnd.ms-excel')
		response.setHeader('Content-Disposition', 'Attachment;Filename="errors.xls"')

		log.debug(response)
		
		WritableWorkbook workbook = Workbook.createWorkbook(response.outputStream)
		WritableSheet sheet1 = workbook.createSheet("Errors", 0)
		
		//La tabla tiene la lista numerada del 1 al x
		def data = params.report
		
		log.debug("La data es: " + data)

		def lit = []
		def ma = [:]
		ArrayList<String> milista = new ArrayList<String>()

		data = data.replace("], ", "],")
		data = data.replace(", ", "\t")
		data = data.replace("{", "")
		data = data.replace("}","")
		data = data.replace("]","")
		data = data.replace("[","")
		milista = data.split(',')

		log.debug("La lista es: " + milista)
		
		def cell = 1
		def col = 0

		for (String line:milista){
			//print line
			ArrayList<String> tlinea = new ArrayList<String>()
			tlinea = line.split("=")
			if (tlinea[1])
			{
				col = 0
				ArrayList<String> fila = new ArrayList<String>()
				fila = tlinea[1].split("\t")
				for (String scell:fila){
					sheet1.addCell( new Label( col, cell-1,scell ))
					col += 1
				}
			}
			cell += 1
		}

		log.debug("Todavia no hizo write")
		
		workbook.write();
		workbook.close();
		
		return
	}
}
