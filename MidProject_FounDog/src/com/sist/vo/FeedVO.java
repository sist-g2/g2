package com.sist.vo;

public class FeedVO {
	private int no;
	private String name;
	private int brand;
	private String feedImg;
	private int category;
	private int target;
	private String material;
	private String prntMtr;
	private int grain;
	private String info;
	private String infoImg;
	private int hit;
	private int lowPrice;
	private int favNum;
	private int rvwNum;
	private double starAvg;
	private Feed_brandVO brndVO = new Feed_brandVO();
	private Feed_cateVO cateVO = new Feed_cateVO();
	private Feed_grainVO grnVO = new Feed_grainVO();
	private Feed_mtrVO mtrVO = new Feed_mtrVO();
	private Feed_targetVO tgVO = new Feed_targetVO();
	private Feed_StoreVO svo;
	private Feed_FavoriteVO fvo;
	
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getBrand() {
		return brand;
	}
	public void setBrand(int brand) {
		this.brand = brand;
	}
	public String getFeedImg() {
		return feedImg;
	}
	public void setFeedImg(String feedImg) {
		this.feedImg = feedImg;
	}
	public int getCategory() {
		return category;
	}
	public void setCategory(int category) {
		this.category = category;
	}
	public int getTarget() {
		return target;
	}
	public void setTarget(int target) {
		this.target = target;
	}
	public String getMaterial() {
		return material;
	}
	public void setMaterial(String material) {
		this.material = material;
	}
	public String getPrntMtr() {
		return prntMtr;
	}
	public void setPrntMtr(String prntMtr) {
		this.prntMtr = prntMtr;
	}
	public int getGrain() {
		return grain;
	}
	public void setGrain(int grain) {
		this.grain = grain;
	}
	public String getInfo() {
		return info;
	}
	public void setInfo(String info) {
		this.info = info;
	}
	public String getInfoImg() {
		return infoImg;
	}
	public void setInfoImg(String infoImg) {
		this.infoImg = infoImg;
	}
	public int getHit() {
		return hit;
	}
	public void setHit(int hit) {
		this.hit = hit;
	}
	public int getLowPrice() {
		return lowPrice;
	}
	public void setLowPrice(int lowPrice) {
		this.lowPrice = lowPrice;
	}
	public int getFavNum() {
		return favNum;
	}
	public void setFavNum(int favNum) {
		this.favNum = favNum;
	}
	public int getRvwNum() {
		return rvwNum;
	}
	public void setRvwNum(int rvwNum) {
		this.rvwNum = rvwNum;
	}
	public double getStarAvg() {
		return starAvg;
	}
	public void setStarAvg(double starAvg) {
		this.starAvg = starAvg;
	}
	public Feed_brandVO getBrndVO() {
		return brndVO;
	}
	public void setBrndVO(Feed_brandVO brndVO) {
		this.brndVO = brndVO;
	}
	public Feed_cateVO getCateVO() {
		return cateVO;
	}
	public void setCateVO(Feed_cateVO cateVO) {
		this.cateVO = cateVO;
	}
	public Feed_grainVO getGrnVO() {
		return grnVO;
	}
	public void setGrnVO(Feed_grainVO grnVO) {
		this.grnVO = grnVO;
	}
	public Feed_mtrVO getMtrVO() {
		return mtrVO;
	}
	public void setMtrVO(Feed_mtrVO mtrVO) {
		this.mtrVO = mtrVO;
	}
	public Feed_targetVO getTgVO() {
		return tgVO;
	}
	public void setTgVO(Feed_targetVO tgVO) {
		this.tgVO = tgVO;
	}
	public Feed_StoreVO getSvo() {
		return svo;
	}
	public void setSvo(Feed_StoreVO svo) {
		this.svo = svo;
	}
	public Feed_FavoriteVO getFvo() {
		return fvo;
	}
	public void setFvo(Feed_FavoriteVO fvo) {
		this.fvo = fvo;
	}
	
}
