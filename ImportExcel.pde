/*
Denne kode er skrevet af conorblack og bruges til at importere excel-filer. 
Koden er blevet brugt, da der ikke findes et bibliotek til processing, der kan importere .xslx filer, samt på grund af opgavens kompleksitet. 
Alt kode i fil samt alle filer under 'code' mappen er skrevet af ham.
*/
SXSSFWorkbook swb=null;
Sheet sh=null;
InputStream inp=null;
Workbook wb=null;
Row row;
String[][] importExcel(String filepath) {
  String[][] temp;
  try {
    inp = new FileInputStream(filepath);
  }
  catch(Exception e) {
  }
  try {
    wb = WorkbookFactory.create(inp);
  }
  catch(Exception e) {
  }
  Sheet sheet = wb.getSheetAt(0);
  int sizeX = sheet.getLastRowNum()+1;
  int sizeY = 4;
  for (int i=0;i<sizeX;++i) {
    if(sheet.getRow(i)!=null) {
     row = sheet.getRow(i);
    }
    for (int j=0;j<sizeY;++j) {
      try {
        if(row.getCell(j)!=null) {
        Cell cell = row.getCell(j);
        }
      }
      catch(Exception e) {
        if (j>sizeY) {
          sizeY = j;
        }
      }
    }
  }
  temp = new String[sizeX][sizeY];
  for (int i=0;i<sizeX;++i) {
    for (int j=0;j<sizeY;++j) {
      
      Row row = sheet.getRow(i);
      try {
        Cell cell = row.getCell(j);
        if (cell.getCellType()==0 || cell.getCellType()==2 || cell.getCellType()==3)cell.setCellType(1);
        temp[i][j] = cell.getStringCellValue();
      }
      catch(Exception e) {
      }
    }
  }
  println("Excel file imported: " + filepath + " successfully!");
  return temp;
}

void exportExcel(String[][] data, String filepath) {
  SXSSFWorkbook wwb = new SXSSFWorkbook(100);
  Sheet sh = wwb.createSheet();
  int sizeX = data.length;
  int sizeY = data[0].length;
  for (int i=0;i<sizeX;++i) {
    Row row = sh.createRow(i);
    for (int j=0;j<sizeY;++j) {
      Cell cell = row.createCell(j);
      if (cell.getCellType()==0 || cell.getCellType()==2 || cell.getCellType()==3)cell.setCellType(1);
      cell.setCellValue(data[i][j]);
    }
  }
  try {
    FileOutputStream out = new FileOutputStream(filepath);
    wwb.write(out);
    println("Excel file exported: " + filepath + " sucessfully!");
  }
  catch (Exception e) {
    println("Error in saving the file...sorry!");
  }
}
