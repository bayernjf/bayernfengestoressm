/**
 * 
 */
package org.feng.product.service;

import java.util.List;

import org.feng.bean.Good;
import org.feng.bean.query.QueryGood;

import com.alibaba.fastjson.JSONObject;

/**
 * @author ½ª·å
 *
 */
public interface GoodService {

	List<Good> getTopTenGoods();

	/**
	 * @return
	 */
	List<Good> getTopTenNewGoods();

	/**
	 * @param parseInt
	 * @return
	 */
	Good getGoodById(Integer id);

	/**
	 * @param parseInt
	 * @return
	 */
	List<Good> getGoodsByCategory_Id(Integer category_id);

	/**
	 * @return
	 */
	List<Good> getAllGoods();

	/**
	 * @param intId
	 * @return
	 */
	List<Good> getGoodsByParentCategory_Id(Integer parentid);

	/**
	 * @param ids
	 * @return
	 */
	List<Good> getGoodsByCategory_IdsOfParentid(List<Integer> category_ids);

	/**
	 * @param intId
	 * @return
	 */
	List<Good> getGoodsByParentCategoryId(Integer parentCategoryid);

	/**
	 * @param qg
	 * @return
	 */
	List<Good> getGoodsByFuzzySearch(QueryGood qg);

	/**
	 * @param valsForLimit
	 * @return
	 */
	List<Good> getAllGoodsByPage(Integer[] valsForLimit);

	/**
	 * @param intId
	 * @param valsForLimit
	 * @return
	 */
	List<Good> getGoodsByCategory_IdByPage(Integer category_id, Integer[] valsForLimit);

	/**
	 * @param ids
	 * @param valsForLimit
	 * @return
	 */
	List<Good> getGoodsByCategory_IdsOfParentidByPage(List<Integer> category_ids, Integer[] valsForLimit);

	/**
	 * @param qg
	 * @return
	 */
	List<Good> getGoodsByFuzzySearchAndPage(QueryGood qg);

	/**
	 * @param good
	 * @return
	 */
	Integer addGood(Good good);

	/**
	 * @param good
	 * @return
	 */
	Integer updateGood(Good good);

	/**
	 * @param id
	 * @return
	 */
	Integer deleteGoodById(String id);

	/**
	 * @param listOfId
	 * @return
	 */
	Integer deleteGoodByIdS(List<Integer> listOfId);

	/**
	 * @param qg
	 * @return
	 */
	List<Good> getGoodsByFuzzySearchAndPageOnlyOffshelf(QueryGood qg);

	/**
	 * @param qg
	 * @return
	 */
	List<Good> getGoodsByFuzzySearchOnlyOffshelf(QueryGood qg);

	/**
	 * @param good
	 * @return
	 */
	Integer modiyfyStatOfGood(Good good);

	/**
	 * @param listOfId
	 * @return
	 */
	Integer turnONStatOfGoodsByIdS(List<Integer> listOfId);

	/**
	 * @param listOfId
	 * @return
	 */
	Integer turnOFFStatOfGoodsByIdS(List<Integer> listOfId);

	/**
	 * @param ids
	 * @param valsForLimit
	 * @return
	 */
	List<Good> getGoodsByCategory_IdsOfParentidByPageOnlyOffshelf(List<Integer> ids, Integer[] valsForLimit);

	/**
	 * @param ids
	 * @return
	 */
	List<Good> getGoodsByCategory_IdsOfParentidOnlyOffshelf(List<Integer> ids);

	/**
	 * @param intId
	 * @param valsForLimit
	 * @return
	 */
	List<Good> getGoodsByCategory_IdByPageOnlyOffshelf(Integer intId, Integer[] valsForLimit);

	/**
	 * @param intId
	 * @return
	 */
	List<Good> getGoodsByCategory_IdOnlyOffshelf(Integer intId);

	/**
	 * @param stat
	 * @return
	 */
	List<Good> getGoodsByStat(String stat);

	/**
	 * @param stat
	 * @param valsForLimit
	 * @return
	 */
	List<Good> getGoodsByStatAndPage(String stat, Integer[] valsForLimit);

	/**
	 * @param parseInt
	 * @return
	 */
	Good getGoodByIdOnlyOffshelf(Integer id);
	
}
