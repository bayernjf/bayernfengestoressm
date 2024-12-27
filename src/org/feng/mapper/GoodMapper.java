/**
 * 
 */
package org.feng.mapper;

import java.util.List;

import org.feng.bean.Good;
import org.feng.bean.query.QueryGood;

/**
 * @author ½ª·å
 *
 */
public interface GoodMapper {
	
	List<Good> getTopTenGoods();

	/**
	 * @return
	 */
	List<Good> getTopTenNewGoods();

	/**
	 * @param id
	 * @return
	 */
	Good getById(Integer id);

	/**
	 * @param category_id
	 * @return
	 */
	List<Good> getGoodsByCategory_Id(Integer category_id);

	/**
	 * @return
	 */
	List<Good> getAll();

	/**
	 * @param parentid
	 * @return
	 */
	List<Good> getGoodsByCategoryParentid(Integer parentid);

	/**
	 * @param category_ids
	 * @return
	 */
	List<Good> getGoodsByCategory_ids(QueryGood qg);

	/**
	 * @param qg
	 * @return
	 */
	List<Good> getGoodsByLike(QueryGood qg);

	/**
	 * @param integer
	 * @param integer2
	 * @return
	 */
	List<Good> getAllGoodsByPage(Integer firstValueOfLimit, Integer secondValueOfLimit);

	/**
	 * @param category_id
	 * @param integer
	 * @param integer2
	 * @return
	 */
	List<Good> getGoodsByCategory_IdByPage(Integer category_id, Integer firstValueOfLimit, Integer secondValueOfLimit);

	/**
	 * @param qg
	 * @param integer
	 * @param integer2
	 * @return
	 */
	List<Good> getGoodsByCategory_IdsOfParentidByPage(QueryGood qg);

	/**
	 * @param qg
	 * @return
	 */
	List<Good> getGoodsByLikeAndPage(QueryGood qg);

	/**
	 * @param good
	 * @return
	 */
	Integer add(Good good);

	/**
	 * @param good
	 * @return
	 */
	Integer updateGood(Good good);

	/**
	 * @param id
	 * @return
	 */
	Integer deleteById(String id);

	/**
	 * @param qg
	 * @return
	 */
	Integer deleteByIdS(QueryGood qg);

	/**
	 * @param qg
	 * @return
	 */
	List<Good> getGoodsByLikeAndPageOnlyOffshelf(QueryGood qg);

	/**
	 * @param qg
	 * @return
	 */
	List<Good> getGoodsByLikeOnlyOffshelf(QueryGood qg);

	/**
	 * @param good
	 * @return
	 */
	Integer modifyStat(Good good);

	/**
	 * @param listOfId
	 * @return
	 */
	Integer turnONStatOfGoodsByIdS(QueryGood qg);

	/**
	 * @param qg
	 * @return
	 */
	Integer turnOFFStatOfGoodsByIdS(QueryGood qg);

	/**
	 * @param qg
	 * @return
	 */
	List<Good> getGoodsByCategory_IdsOfParentidByPageOnlyOffshelf(QueryGood qg);

	/**
	 * @param qg
	 * @return
	 */
	List<Good> getGoodsByCategory_idsOnlyOffshelf(QueryGood qg);

	/**
	 * @param category_id
	 * @param integer
	 * @param integer2
	 * @return
	 */
	List<Good> getGoodsByCategory_IdByPageOnlyOffshelf(Integer category_id, Integer firstValueOfLimit, Integer secondValueOfLimit);

	/**
	 * @param category_id
	 * @return
	 */
	List<Good> getGoodsByCategory_IdOnlyOffshelf(Integer category_id);

	/**
	 * @param stat
	 * @return
	 */
	List<Good> getGoodsByStat(String stat);

	/**
	 * @param stat
	 * @param integer
	 * @param integer2
	 * @return
	 */
	List<Good> getGoodsByStatAndPage(String stat, Integer firstValueOfLimit, Integer secondValueOfLimit);

	/**
	 * @param id
	 * @return
	 */
	Good getByIdOnlyOffshelf(Integer id);

}
