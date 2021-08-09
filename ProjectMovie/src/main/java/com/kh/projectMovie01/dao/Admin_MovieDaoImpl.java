package com.kh.projectMovie01.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.projectMovie01.vo.Admin_PageingDto;
import com.kh.projectMovie01.vo.MovieImageVo;
import com.kh.projectMovie01.vo.MovieScheduleVo;
import com.kh.projectMovie01.vo.MovieVo;

@Repository
public class Admin_MovieDaoImpl implements Admin_MovieDao {

	private static final String NAMESPACE = "com.kh.projectMovie01.movie.";
	
	@Inject
	private SqlSession sqlSession;	

	// MoviePoster 관련 ______________________________________________
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
	public List<MovieVo> listAll(Admin_PageingDto admin_PageingDto){
		return sqlSession.selectList(NAMESPACE + "listAll", admin_PageingDto);
	}

	@Override
	public void deleteMovie(String movie_code) {
		sqlSession.selectOne(NAMESPACE + "deleteMovie", movie_code);
		
	}

	@Override
	public List<MovieVo> nameListAll() {
		List<MovieVo> list = sqlSession.selectList(NAMESPACE + "nameListAll");
		return list;
	}

	@Override
	public MovieVo getMovieInfo(String movie_name) {
		MovieVo movieVo = sqlSession.selectOne(NAMESPACE + "getMovieInfo", movie_name);
		return movieVo;
	}

	@Override
	public void insertMoviSchedule(MovieScheduleVo movieScheduleVo) {
		sqlSession.insert(NAMESPACE + "insertMoviSchedule", movieScheduleVo);
	}

	@Override
	public void countUp(String movie_name) {
		sqlSession.update(NAMESPACE + "countUp", movie_name);
	}

	@Override
	public MovieScheduleVo lastMovieSchedule(int theater_no) {
		MovieScheduleVo movieScheduleVo = sqlSession.selectOne(NAMESPACE + "lastMovieSchedule", theater_no);
		return movieScheduleVo;
	}

	@Override
	public List<MovieScheduleVo> getMovieScheduleList(int theater_no, String movieSchedule_registTime) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("theater_no", theater_no);
		map.put("movieSchedule_registTime", movieSchedule_registTime);
		List<MovieScheduleVo> list = sqlSession.selectList(NAMESPACE + "getMovieScheduleList", map);
		return list;
	}
//티케팅관련
	@Override
	public List<MovieScheduleVo> getMovieScheduleListTikecting(String movie_name, String movieSchedule_registTime) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("movie_name", movie_name);
		map.put("movieSchedule_registTime", movieSchedule_registTime);
		List<MovieScheduleVo> list = sqlSession.selectList(NAMESPACE + "getMovieScheduleListTikecting", map);
		return list;
	}
}
