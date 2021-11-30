package kr.happyjob.study.mnp.controller;

import java.io.FileInputStream;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.apache.poi.xssf.usermodel.XSSFCell;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.happyjob.study.login.service.LoginService;

@Controller
@RequestMapping("/mnp/")
public class ExcelInsert {

	@Autowired
	LoginService loginService;

	// Set logger
	private final Logger logger = LogManager.getLogger(this.getClass());

	// Get class name for logger
	private final String className = this.getClass().toString();

	/* 컬럼인지 체크 */
	// row가 0인 컬럼명만 key에 저장하고, map에서 key값으로 사용함.
	public void checkColumnRow(int row, int col, String value, String[] key) {

		if (row == 0) {
			key[col] = value;
		}
	}

	@RequestMapping("excel.do")
	public String excelCall() throws Exception {

		try {
			FileInputStream file = new FileInputStream(
					"F:/eGov/workspace/lmselv/src/main/resources/excel/ToadExport5.xlsx");
			XSSFWorkbook workbook = new XSSFWorkbook(file);

			int rowindex = 0;
			int columnindex = 0;

			// 시트 수 (첫번째에만 존재하므로 0을 준다)
			// 만약 각 시트를 읽기위해서는 FOR문을 한번더 돌려준다
			XSSFSheet sheet = workbook.getSheetAt(0);

			// 행의 수
			int rows = sheet.getPhysicalNumberOfRows();

			List<Map<String, Object>> mapList = new ArrayList<Map<String, Object>>(rows - 1);

			String key[] = new String[rows - 1];
			System.out.println("Row수: " + rows);

			for (rowindex = 0; rowindex < rows; rowindex++) {
				// row 한줄씩 넣어야 하므로 row 한 줄 다 읽을 때마다 새로 생성해서 초기화.
				Map<String, Object> mapTest = new HashMap<String, Object>();

				// 행을읽는다
				XSSFRow row = sheet.getRow(rowindex);

				if (row != null) {
					int cells = row.getPhysicalNumberOfCells();

					for (columnindex = 0; columnindex <= cells; columnindex++) {
						// 셀값을 읽는다
						XSSFCell cell = row.getCell(columnindex);
						String value = "";

						// 셀이 빈 값 일경우를 위한 널체크
						if (cell == null) {
							continue;

							// 셀이 널이 아닐 경우 실행.
						} else {
							// 타입별로 내용 읽기
							switch (cell.getCellType()) {
							case XSSFCell.CELL_TYPE_FORMULA:
								value = cell.getCellFormula();
								checkColumnRow(rowindex, columnindex, value, key);
								break;

							case XSSFCell.CELL_TYPE_NUMERIC:
								value = cell.getNumericCellValue() + "";
								checkColumnRow(rowindex, columnindex, value, key);
								break;
								
							case XSSFCell.CELL_TYPE_STRING:
								value = cell.getStringCellValue() + "";
								checkColumnRow(rowindex, columnindex, value, key);
								break;

							case XSSFCell.CELL_TYPE_BLANK:
								value = cell.getBooleanCellValue() + "";
								checkColumnRow(rowindex, columnindex, value, key);
								break;

							case XSSFCell.CELL_TYPE_ERROR:
								value = cell.getErrorCellValue() + "";
								checkColumnRow(rowindex, columnindex, value, key);
								break;
							}
						}
						// rowindex가 0이 아닐때, 즉, 컬럼명이 아닌 것만 map에 추가.
						if (rowindex != 0)
							mapTest.put(key[columnindex], value);

						//System.out.println(rowindex + "번 행 : " + columnindex + "번 열 값은: " + value);
					}
					// row 한줄씩 mapList에 추가함.
					if (rowindex != 0)
						mapList.add(mapTest);
				}
			}
			loginService.insertExcelMap(mapList);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return "mnp/professorMgt";

	}

}