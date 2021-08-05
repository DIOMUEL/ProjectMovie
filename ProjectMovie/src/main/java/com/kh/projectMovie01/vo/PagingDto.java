package com.kh.projectMovie01.vo;

public class PagingDto {
	private int page = 1;
	private int startRow = 1;
	private int endRow = 10;
	private int count;
	private int startPage;
	private int endPage;
	private int totalPage;
	private int perPage = 10;
	private final int PAGE_BLOCK = 10;
	private String searchType;
	private String keyword;
	
	public String getSearchType() {
		return searchType;
	}

	public void setSearchType(String searchType) {
		this.searchType = searchType;
	}

	public String getKeyword() {
		return keyword;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}

	public int getPerPage() {
		return perPage;
	}

	public void setPerPage(int perPage) {
		this.perPage = perPage;
	}

	public int getTotalPage() {
		return totalPage;
	}

	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}

	public PagingDto() {
		super();
	}
	
	public PagingDto(int page) {
		this.page = page;
	}

	public PagingDto(int page, int startRow, int endRow, int count) {
		super();
		this.page = page;
		this.startRow = startRow;
		this.endRow = endRow;
		this.count = count;
	}

	public int getPage() {
		return page;
	}

	public void setPage(int page) {
		this.page = page;
	}

	public int getStartRow() {
		return startRow;
	}

	public void setStartRow(int startRow) {
		this.startRow = startRow;
	}

	public int getEndRow() {
		return endRow;
	}

	public void setEndRow(int endRow) {
		this.endRow = endRow;
	}

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
		
		this.endRow = page * this.perPage;
		this.startRow = endRow - (this.perPage - 1);
		
		if (page % PAGE_BLOCK == 0) {
			this.endPage = ((int)(page / PAGE_BLOCK)) * PAGE_BLOCK;
		} else {
			this.endPage = ((int)(page / PAGE_BLOCK) + 1) * PAGE_BLOCK;
		}
		
		this.startPage = endPage - 9;
		
		this.totalPage = count / perPage;
		if (count % perPage != 0) {
			this.totalPage += 1;
		}

		if (this.endPage > this.totalPage) {
			this.endPage = this.totalPage;
		}
		
	}

	public int getStartPage() {
		return startPage;
	}

	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}

	public int getEndPage() {
		return endPage;
	}

	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}

	@Override
	public String toString() {
		return "PagingDto [page=" + page + ", startRow=" + startRow + ", endRow=" + endRow + ", count=" + count
				+ ", startPage=" + startPage + ", endPage=" + endPage + ", totalPage=" + totalPage + ", perPage="
				+ perPage + ", PAGE_BLOCK=" + PAGE_BLOCK + ", searchType=" + searchType + ", keyword=" + keyword + "]";
	}

	

	

	

	

}
