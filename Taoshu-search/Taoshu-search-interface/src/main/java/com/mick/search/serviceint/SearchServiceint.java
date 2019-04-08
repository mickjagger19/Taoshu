package com.mick.search.serviceint;


import com.mick.manager.dto.SearchResult;


public interface SearchServiceint {

	/**
	 * ES商品搜索
	 * @param keyword
	 * @param page
	 * @param size
	 * @return
	 */
	SearchResult search(String keyword, int page, int size);

	/**
	 * restful搜索接口
	 * @param key
	 * @return
	 */
	String quickSearch(String key);
}
