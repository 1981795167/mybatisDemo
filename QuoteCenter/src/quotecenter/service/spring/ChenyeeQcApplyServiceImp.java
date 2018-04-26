package com.landray.kmss.chenyee.quotecenter.service.spring;
import java.io.File;
import java.io.FileOutputStream;
import java.text.DecimalFormat;
import java.util.Properties;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts.action.ActionForm;

import com.landray.kmss.chenyee.quotecenter.dao.hibernate.ChenyeeQcApplyDaoImp;
import com.landray.kmss.chenyee.quotecenter.forms.ChenyeeQcApplyForm;
import com.landray.kmss.chenyee.quotecenter.service.IChenyeeQcApplyService;
import com.landray.kmss.chenyee.quotecenter.service.IChenyeeQcProductService;
import com.landray.kmss.sys.authentication.user.KMSSUser;
import com.landray.kmss.sys.metadata.interfaces.ExtendDataServiceImp;
import com.landray.kmss.util.ResourceUtil;
import com.landray.kmss.util.UserUtil;
import com.lowagie.text.Chapter;
import com.lowagie.text.Chunk;
import com.lowagie.text.Document;
import com.lowagie.text.Element;
import com.lowagie.text.Font;
import com.lowagie.text.Image;
import com.lowagie.text.PageSize;
import com.lowagie.text.Paragraph;
import com.lowagie.text.Phrase;
import com.lowagie.text.Rectangle;
import com.lowagie.text.pdf.BaseFont;
import com.lowagie.text.pdf.PdfContentByte;
import com.lowagie.text.pdf.PdfGState;
import com.lowagie.text.pdf.PdfPCell;
import com.lowagie.text.pdf.PdfPTable;
import com.lowagie.text.pdf.PdfWriter;
/**
 * 报价申请业务接口实现
 * 
 * @author 
 * @version 1.0 2018-03-15
 */
public class ChenyeeQcApplyServiceImp extends ExtendDataServiceImp implements IChenyeeQcApplyService {
	
	public ChenyeeQcApplyDaoImp getApplyDao() {
		return (ChenyeeQcApplyDaoImp)getBaseDao();
	}
	
	@Override
	public String countGm(String s_applicationPrice, String s_costPrice) {
		double applicationPrice = Double.parseDouble(s_applicationPrice);
		double costPrice = Double.parseDouble(s_costPrice);
		Double gm = (applicationPrice - costPrice) / applicationPrice * 100;
		DecimalFormat df = new DecimalFormat("#.00");
        return df.format(gm);
	}

	//TODO pdf数据录入
	@Override
	public String createFile(ActionForm form, HttpServletRequest request, IChenyeeQcProductService chenyeeQcProductService) throws Exception {
		ChenyeeQcApplyForm applyForm = (ChenyeeQcApplyForm) form;
		String quotePath = getQuotePath(applyForm); 
		String fullPath = getFullQuotePath(quotePath);
		File file = new File(fullPath);
		if (!file.exists()) {
			file.getParentFile().mkdirs();
			file.createNewFile();
		}
		
		
		Document document = new Document(PageSize.A4, 20, 20, 20, 20);
		PdfWriter writer = PdfWriter.getInstance(document, new FileOutputStream(file));
		document.open();

		BaseFont bfChinese = BaseFont.createFont("STSong-Light", 
                "UniGB-UCS2-H", BaseFont.NOT_EMBEDDED);
		Font fontChinese = new Font(bfChinese, 16, Font.NORMAL);
		Font applyInfoFont = new Font(bfChinese, 12, Font.NORMAL);
		Font titleFont = new Font(bfChinese, 36, Font.BOLD);
		
		Paragraph title = new Paragraph(ResourceUtil.getString("chenyeeQcApply.applyBill", "chenyee-quotecenter"), titleFont);
		title.setAlignment(Element.ALIGN_CENTER);
		
		Chapter chapter = new Chapter(title, 1);

		chapter.setNumberDepth(0);

		document.add(title);
		
		document.add(new Phrase(" "));
		
		//document.add(Chunk.NEWLINE); //增加空行
		
		PdfPTable applyInfoTable = new PdfPTable(2);
		applyInfoTable.getDefaultCell().setBorder(Rectangle.NO_BORDER); //去掉表格边框
		//applyInfoTable.setSpacingBefore(25);设置前后间距
		//applyInfoTable.setSpacingAfter(25);
		float [] widths = {20f, 50f};
		applyInfoTable.setWidths(widths);

		applyInfoTable.addCell(new Phrase(ResourceUtil.getString("chenyeeQcApply.applyPerson", "chenyee-quotecenter"), applyInfoFont));
		applyInfoTable.addCell(new Phrase(applyForm.getDocCreatorName(), applyInfoFont));
		
		KMSSUser user = UserUtil.getKMSSUser();
		applyInfoTable.addCell(new Phrase(ResourceUtil.getString("chenyeeQcApply.salesArea", "chenyee-quotecenter"), applyInfoFont));
		applyInfoTable.addCell(new Phrase(user.getDeptName(), applyInfoFont));

		applyInfoTable.addCell(new Phrase(ResourceUtil.getString("chenyeeQcApply.createTime", "chenyee-quotecenter"), applyInfoFont));
		applyInfoTable.addCell(new Phrase(applyForm.getFdApplicationTime(), fontChinese));
		
		applyInfoTable.addCell(new Phrase(ResourceUtil.getString("chenyeeQcApply.salesCustomer", "chenyee-quotecenter"), applyInfoFont));
		applyInfoTable.addCell(new Phrase(applyForm.getFdCustomerName(), fontChinese));
		applyInfoTable.setHorizontalAlignment(Element.ALIGN_CENTER);
		applyInfoTable.setWidthPercentage(100);
		
		document.add(applyInfoTable);
		
		//document.add(Chunk.NEWLINE); //增加空行
		document.add(new Phrase(" "));
		document.add(new Phrase(" "));
		
		PdfPTable body = new PdfPTable(4);
		body.setHorizontalAlignment(Element.ALIGN_CENTER);
		
		body.addCell(new Phrase(ResourceUtil.getString("chenyeeQcApply.fdProjectName", "chenyee-quotecenter"), fontChinese));
		body.addCell(new Phrase(applyForm.getFdProjectName(), fontChinese));
		body.addCell(new Phrase(ResourceUtil.getString("chenyeeQcApply.fdRomRam", "chenyee-quotecenter"), fontChinese));
		body.addCell(new Phrase(applyForm.getFdRomRam(), fontChinese));
		
		//ChenyeeQcProduct product = chenyeeQcProductService.queryProductInfo(applyForm.getfdP)
		
		body.addCell(new Phrase(ResourceUtil.getString("chenyeeQcProduct.fdHardwarePlatform", "chenyee-quotecenter"), fontChinese));
		body.addCell(new Phrase(applyForm.getFdHardwarePlatform(), fontChinese));
		body.addCell(new Phrase(ResourceUtil.getString("chenyeeQcProduct.fdScreeSize", "chenyee-quotecenter"), fontChinese));
		body.addCell(new Phrase(applyForm.getFdScreeSize(), fontChinese));
		
		body.addCell(new Phrase(ResourceUtil.getString("chenyeeQcProduct.fdFrontCamera", "chenyee-quotecenter"), fontChinese));
		body.addCell(new Phrase(applyForm.getFdFrontCamera(), fontChinese));
		body.addCell(new Phrase(ResourceUtil.getString("chenyeeQcProduct.fdRearCamera", "chenyee-quotecenter"), fontChinese));
		body.addCell(new Phrase(applyForm.getFdRearCamera(), fontChinese));
		
		body.addCell(new Phrase(ResourceUtil.getString("chenyeeQcProduct.fdBatteryCapacity", "chenyee-quotecenter"), fontChinese));
		body.addCell(new Phrase(applyForm.getFdBatteryCapacity(), fontChinese));
		if(applyForm.getRfVersion() != null && !"".equals(applyForm.getRfVersion())) {
			body.addCell(new Phrase(ResourceUtil.getString("chenyeeQcApply.rfVersion", "chenyee-quotecenter"), fontChinese));
			body.addCell(new Phrase(ResourceUtil.getString("chenyeeQcApply.rfVersion." + applyForm.getRfVersion(), "chenyee-quotecenter"), fontChinese));
		}
		
		body.addCell(new Phrase(ResourceUtil.getString("chenyeeQcProduct.fdAndroidVersion", "chenyee-quotecenter"), fontChinese));
		body.addCell(new Phrase(applyForm.getFdAndroidVersion(), fontChinese));
		
		if(applyForm.getBoxName() != null && !"".equals(applyForm.getBoxName())) {
			body.addCell(new Phrase(ResourceUtil.getString("chenyeeQcApply.boxName", "chenyee-quotecenter"), fontChinese));
			body.addCell(new Phrase(applyForm.getBoxName(), fontChinese));
		}
		
		if(applyForm.getPartsName() != null && !"".equals(applyForm.getPartsName())) {
			body.addCell(new Phrase(ResourceUtil.getString("chenyeeQcApply.partsName", "chenyee-quotecenter"), fontChinese));
			PdfPCell parts = new PdfPCell(new Phrase(applyForm.getPartsName(), fontChinese));
			parts.setColspan(3);
			body.addCell(parts);
		}
		
		if(applyForm.getOther() != null && !"".equals(applyForm.getOther())) {
			body.addCell(new Phrase(ResourceUtil.getString("chenyeeQcApply.other", "chenyee-quotecenter"), fontChinese));
			PdfPCell other = new PdfPCell(new Phrase(applyForm.getOther(), fontChinese));
			other.setColspan(3);
			body.addCell(other);
		}
		body.setWidthPercentage(100);
		
		document.add(body);
		
		Paragraph lastPrice = new Paragraph(ResourceUtil.getString("chenyeeQcApply.lastPrice", "chenyee-quotecenter"), new Font(bfChinese, 20, Font.BOLD));
		lastPrice.setIndentationLeft(25);
		document.add(lastPrice);
		
		Paragraph price = new Paragraph(applyForm.getFdApplicationPrice(), new Font(bfChinese, 20, Font.NORMAL));
		price.setIndentationLeft(60);
		document.add(price);

		PdfContentByte canvas = writer.getDirectContentUnder();
		
		StringBuilder builder = new StringBuilder(request.getSession().getServletContext().getRealPath(""));
		builder.append("/chenyee/quotecenter/resource/logo.png");
		Image logo = Image.getInstance(builder.toString());
		logo.setAlignment(Image.DEFAULT);
		logo.setAbsolutePosition(0, 0);
		logo.scalePercent(25);
		//logo.setBorderWidth(50);
		canvas.saveState();
		PdfGState state = new PdfGState();
		//state.setFillOpacity(0.6f); //设置透明度
		canvas.setGState(state);
		canvas.addImage(logo);
		canvas.restoreState();
		
		document.close();

		return quotePath;
	}
	
	private Element createElement(String info, Font font) {
		
		return new Phrase(info, font);
	}
	
	
	
	@Override
	public String getFullQuotePath(String quotePath) throws Exception {
		Properties properties = new Properties();
		properties.load(
				ChenyeeQcApplyServiceImp.class
				.getClassLoader().getResourceAsStream("quotePath.properties"));
		StringBuilder builder = new StringBuilder();
		builder.append(properties.getProperty("quoteApplyPath"));
		builder.append(quotePath);
		builder.append(".pdf");
		
		return builder.toString();
	}
	
	private String getQuotePath(ChenyeeQcApplyForm applyForm) {
		StringBuilder builder = new StringBuilder();
		builder.append("/");
		builder.append(applyForm.getFdProjectName());
		builder.append("/");
		builder.append(applyForm.getFdApplicationTitle());

		return builder.toString();
	}

	@Override
	public int updateApply(String oldValue, String newValue, String fieldName) {
		
		return getApplyDao().updateApplyBill(oldValue, newValue, fieldName);
	}

	@Override
	public boolean deletePdf(String[] pdfPaths) {
		boolean status = true;
		for (String path : pdfPaths) {
			try {
				String fullPath = getFullQuotePath(path);
				File file = new File(fullPath);
				if(file.exists()) {
					boolean flag = file.delete();
					status = flag ? flag : false;
				}
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return status;
	}
	
}
