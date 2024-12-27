/**
 * 
 */
package org.feng.product.service;

import java.util.List;

import org.feng.bean.Good;
import org.feng.bean.query.QueryGood;
import org.feng.mapper.GoodMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.alibaba.fastjson.JSONObject;

/**
 * @author ½ª·å
 *
 */
@Service("goodService")
public class GoodServiceImpl implements GoodService {

	@Autowired
	private GoodMapper mapper;

	/* (non-Javadoc)
	 * @see org.feng.product.service.GoodService#getTopTenGoods()
	 */
	@Override
	public List<Good> getTopTenGoods() {
		return this.mapper.getTopTenGoods();
	}

	/* (non-Javadoc)
	 * @see org.feng.product.service.GoodService#getTopTenNewGoods()
	 */
	@Override
	public List<Good> getTopTenNewGoods() {
		return this.mapper.getTopTenNewGoods();
	}

	/* (non-Javadoc)
	 * @see org.feng.product.service.GoodService#getGoodById(java.lang.Integer)
	 */
	@Override
	public Good getGoodById(Integer id) {
		return this.mapper.getById(id);
	}

	/* (non-Javadoc)
	 * @see org.feng.product.service.GoodService#getGoodsByCategory_Id(java.lang.Integer)
	 */
	@Override
	public List<Good> getGoodsByCategory_Id(Integer category_id) {
		return this.mapper.getGoodsByCategory_Id(category_id);
	}

	/* (non-Javadoc)
	 * @see org.feng.product.service.GoodService#getAllGoods()
	 */
	@Override
	public List<Good> getAllGoods() {
		return this.mapper.getAll();
	}

	/* (non-Javadoc)
	 * @see org.feng.product.service.GoodService#getGoodsByParentCategory_Id(java.lang.Integer)
	 */
	@Override
	public List<Good> getGoodsByParentCategory_Id(Integer parentid) {
		return this.mapper.getGoodsByCategoryParentid(parentid);
	}

	/* (non-Javadoc)
	 * @see org.feng.product.service.GoodService#getGoodsByCategory_IdsOfParentid(java.util.List)
	 */
	@Override
	public List<Good> getGoodsByCategory_IdsOfParentid(List<Integer> category_ids) {
		QueryGood qg = new QueryGood();
		qg.setCategory_ids(category_ids);
		return this.mapper.getGoodsByCategory_ids(qg);
	}

	/* (non-Javadoc)
	 * @see org.feng.product.service.GoodService#getGoodsByParentCategoryId(java.lang.Integer)
	 */
	@Override
	public List<Good> getGoodsByParentCategoryId(Integer parentCategoryid) {
		// TODO Auto-generated method stub
		
		return null;
	}

	/* (non-Javadoc)
	 * @see org.feng.product.service.GoodService#getGoodsByFuzzySearch(java.lang.String)
	 */
	@Override
	public List<Good> getGoodsByFuzzySearch(QueryGood qg) {
		return this.mapper.getGoodsByLike(qg);
	}

	/* (non-Javadoc)
	 * @see org.feng.product.service.GoodService#getAllGoodsByPage(java.lang.Integer[])
	 */
	@Override
	public List<Good> getAllGoodsByPage(Integer[] valsForLimit) {
		return this.mapper.getAllGoodsByPage(valsForLimit[0], valsForLimit[1]);
	}

	/* (non-Javadoc)
	 * @see org.feng.product.service.GoodService#getGoodsByCategory_IdByPage(java.lang.Integer, java.lang.Integer[])
	 */
	@Override
	public List<Good> getGoodsByCategory_IdByPage(Integer category_id, Integer[] valsForLimit) {
		return this.mapper.getGoodsByCategory_IdByPage(category_id, valsForLimit[0], valsForLimit[1]);
	}

	/* (non-Javadoc)
	 * @see org.feng.product.service.GoodService#getGoodsByCategory_IdsOfParentidByPage(java.util.List, java.lang.Integer[])
	 */
	@Override
	public List<Good> getGoodsByCategory_IdsOfParentidByPage(List<Integer> category_ids, Integer[] valsForLimit) {
		QueryGood qg = new QueryGood();
		qg.setCategory_ids(category_ids);
		qg.setFirstValueOfLimit(valsForLimit[0]);
		qg.setSecondValueOfLimit(valsForLimit[1]);
		return this.mapper.getGoodsByCategory_IdsOfParentidByPage(qg);
	}

	/* (non-Javadoc)
	 * @see org.feng.product.service.GoodService#getGoodsByFuzzySearchAndPage(org.feng.bean.query.QueryGood)
	 */
	@Override
	public List<Good> getGoodsByFuzzySearchAndPage(QueryGood qg) {
		return this.mapper.getGoodsByLikeAndPage(qg);
	}

	/* (non-Javadoc)
	 * @see org.feng.product.service.GoodService#addGood(org.feng.bean.Good)
	 */
	@Override
	public Integer addGood(Good good) {
		return this.mapper.add(good);
	}

	/* (non-Javadoc)
	 * @see org.feng.product.service.GoodService#updateGood(org.feng.bean.Good)
	 */
	@Override
	public Integer updateGood(Good good) {
		return this.mapper.updateGood(good);
	}

	/* (non-Javadoc)
	 * @see org.feng.product.service.GoodService#deleteGoodById(java.lang.String)
	 */
	@Override
	public Integer deleteGoodById(String id) {
		return this.mapper.deleteById(id);
	}

	/* (non-Javadoc)
	 * @see org.feng.product.service.GoodService#deleteGoodByIdS(java.util.List)
	 */
	@Override
	public Integer deleteGoodByIdS(List<Integer> listOfId) {
		QueryGood qg = new QueryGood();
		qg.setIds(listOfId);
		return this.mapper.deleteByIdS(qg);
	}

	/* (non-Javadoc)
	 * @see org.feng.product.service.GoodService#getGoodsByFuzzySearchAndPageOnlyOffshelf(org.feng.bean.query.QueryGood)
	 */
	@Override
	public List<Good> getGoodsByFuzzySearchAndPageOnlyOffshelf(QueryGood qg) {
		return this.mapper.getGoodsByLikeAndPageOnlyOffshelf(qg);
	}

	/* (non-Javadoc)
	 * @see org.feng.product.service.GoodService#getGoodsByFuzzySearchOnlyOffshelf(org.feng.bean.query.QueryGood)
	 */
	@Override
	public List<Good> getGoodsByFuzzySearchOnlyOffshelf(QueryGood qg) {
		return this.mapper.getGoodsByLikeOnlyOffshelf(qg);
	}

	/* (non-Javadoc)
	 * @see org.feng.product.service.GoodService#modiyfyStatOfGood(org.feng.bean.Good)
	 */
	@Override
	public Integer modiyfyStatOfGood(Good good) {
		return this.mapper.modifyStat(good);
	}

	/* (non-Javadoc)
	 * @see org.feng.product.service.GoodService#turnONStatOfGoodsByIdS(java.util.List)
	 */
	@Override
	public Integer turnONStatOfGoodsByIdS(List<Integer> listOfId) {
		QueryGood qg = new QueryGood();
		qg.setIds(listOfId);
		return this.mapper.turnONStatOfGoodsByIdS(qg);
	}

	/* (non-Javadoc)
	 * @see org.feng.product.service.GoodService#turnOFFStatOfGoodsByIdS(java.util.List)
	 */
	@Override
	public Integer turnOFFStatOfGoodsByIdS(List<Integer> listOfId) {
		QueryGood qg = new QueryGood();
		qg.setIds(listOfId);
		return this.mapper.turnOFFStatOfGoodsByIdS(qg);
	}

	/* (non-Javadoc)
	 * @see org.feng.product.service.GoodService#getGoodsByCategory_IdsOfParentidByPageOnlyOffshelf(java.util.List, java.lang.Integer[])
	 */
	@Override
	public List<Good> getGoodsByCategory_IdsOfParentidByPageOnlyOffshelf(List<Integer> category_ids, Integer[] valsForLimit) {
		QueryGood qg = new QueryGood();
		qg.setCategory_ids(category_ids);
		qg.setFirstValueOfLimit(valsForLimit[0]);
		qg.setSecondValueOfLimit(valsForLimit[1]);
		return this.mapper.getGoodsByCategory_IdsOfParentidByPageOnlyOffshelf(qg);
	}

	/* (non-Javadoc)
	 * @see org.feng.product.service.GoodService#getGoodsByCategory_IdsOfParentidOnlyOffshelf(java.util.List)
	 */
	@Override
	public List<Good> getGoodsByCategory_IdsOfParentidOnlyOffshelf(List<Integer> category_ids) {
		QueryGood qg = new QueryGood();
		qg.setCategory_ids(category_ids);
		return this.mapper.getGoodsByCategory_idsOnlyOffshelf(qg);
	}

	/* (non-Javadoc)
	 * @see org.feng.product.service.GoodService#getGoodsByCategory_IdByPageOnlyOffshelf(java.lang.Integer, java.lang.Integer[])
	 */
	@Override
	public List<Good> getGoodsByCategory_IdByPageOnlyOffshelf(Integer category_id, Integer[] valsForLimit) {
		return this.mapper.getGoodsByCategory_IdByPageOnlyOffshelf(category_id, valsForLimit[0], valsForLimit[1]);
	}

	/* (non-Javadoc)
	 * @see org.feng.product.service.GoodService#getGoodsByCategory_IdOnlyOffshelf(java.lang.Integer)
	 */
	@Override
	public List<Good> getGoodsByCategory_IdOnlyOffshelf(Integer category_id) {
		return this.mapper.getGoodsByCategory_IdOnlyOffshelf(category_id);
	}

	/* (non-Javadoc)
	 * @see org.feng.product.service.GoodService#getGoodsByStat(java.lang.String)
	 */
	@Override
	public List<Good> getGoodsByStat(String stat) {
		return this.mapper.getGoodsByStat(stat);
		
	}

	/* (non-Javadoc)
	 * @see org.feng.product.service.GoodService#getGoodsByStatAndPage(java.lang.String, java.lang.Integer[])
	 */
	@Override
	public List<Good> getGoodsByStatAndPage(String stat, Integer[] valsForLimit) {
		return this.mapper.getGoodsByStatAndPage(stat, valsForLimit[0], valsForLimit[1]);
	}

	/* (non-Javadoc)
	 * @see org.feng.product.service.GoodService#getGoodByIdOnlyOffshelf(java.lang.Integer)
	 */
	@Override
	public Good getGoodByIdOnlyOffshelf(Integer id) {
		return this.mapper.getByIdOnlyOffshelf(id);
	}
	
}
