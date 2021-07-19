package com.kh.projectMovie01.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.projectMovie01.vo.Admin_PageingDto;
import com.kh.projectMovie01.vo.MovieImageVo;
import com.kh.projectMovie01.vo.MovieVo;

@Repository
public class Admin_MovieDaoImpl implements Admin_MovieDao {

	private static final String NAMESPACE = "mappers.movie-mapper.";
	
	@Inject
	private SqlSession sqlSession;	

	@Override
	public List<MovieVo> getMovieList(){
		return sqlSession.selectList(NAMESPACE + "getMovieList");
	}
	@Override
	public void administerMovieRegistRun(MovieVo MovieVo){
		sqlSession.insert(NAMESPACE + "administerMovieRegistRun", MovieVo);
	}

	@Override
	public MovieVo selectByMovie(String movie_code){
		return sqlSession.selectOne(NAMESPACE + "selectByMovie", movie_code);
	}
	@Override
	public List<MovieImageVo> selectByMovieSubImage(String movie_code){
		return sqlSession.selectList(NAMESPACE + "selectByMovieSubImage", movie_code);
	}

	@Override
	public void movieModify(MovieVo MovieVo){
		sqlSession.update(NAMESPACE + "updateMovie", MovieVo);
	}
	@Override
	public String selectMovieCode(){
		return sqlSession.selectOne(NAMESPACE + "selectMovieCode");
	}
	@Override
	public void administerMovieSubImageRegistRun(String movie_code, String movie_sub_image){
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("movie_code", movie_code);
		map.put("movie_sub_image", movie_sub_image);
		sqlSession.insert(NAMESPACE + "administerMovieSubImageRegistRun", map)	;
	}
	@Override
	public void deleteMovieImage(String movie_code){
		sqlSession.delete(NAMESPACE + "deleteMovieImage", movie_code);
	}
	@Override
	public int getCountMovie(Admin_PageingDto admin_PageingDto){
		int count = sqlSession.selectOne(NAMESPACE + "getCountMovie", admin_PageingDto);
		return count;
	}
	@Override
	public List<MovieVo> moviePagingList(Admin_PageingDto admin_PageingDto){
		return sqlSession.selectList(NAMESPACE + "movieListPaging", admin_PageingDto);
	}

}
