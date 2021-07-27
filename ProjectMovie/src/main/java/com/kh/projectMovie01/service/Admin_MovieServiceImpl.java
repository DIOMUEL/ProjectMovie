package com.kh.projectMovie01.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.projectMovie01.dao.Admin_MovieDao;
import com.kh.projectMovie01.utill.MovieFileUploadUtil;
import com.kh.projectMovie01.vo.Admin_PageingDto;
import com.kh.projectMovie01.vo.MovieImageVo;
import com.kh.projectMovie01.vo.MovieScheduleVo;
import com.kh.projectMovie01.vo.MovieVo;

@Service
public class Admin_MovieServiceImpl implements Admin_MovieService {
	
	@Inject
	private Admin_MovieDao movieDao;

	@Transactional
	@Override
	public void administerMovieRegistRun(MovieVo movieVo){
		movieDao.administerMovieRegistRun(movieVo);
		String movie_code = movieDao.selectMovieCode();
		//System.out.println("movie_code :" + movie_code);
		String[] files = movieVo.getMovie_sub_image();
		for (String movie_sub_image : files) {
			movieDao.administerMovieSubImageRegistRun(movie_code, movie_sub_image);
		}
	}

	@Transactional
	@Override
	public void movieModify(MovieVo movieVo) throws Exception{
		//부사진 등록
		movieDao.movieModify(movieVo);
		String movie_code = movieVo.getMovie_code();
		List<MovieImageVo> list = movieDao.selectByMovieSubImage(movie_code);
		int size = list.size();
		
		for (int i = 0; i < size; i ++) {
			MovieImageVo movieImageVo = list.get(i);
			String movie_sub_image = movieImageVo.getMovie_sub_image();
			MovieFileUploadUtil.deleteFile(movie_sub_image);
		}
		//부사진 삭제
		movieDao.deleteMovieImage(movie_code);
		String[] files = movieVo.getMovie_sub_image();
		for (String movie_sub_image : files) {
			movieDao.administerMovieSubImageRegistRun(movie_code, movie_sub_image);
		}
	}
	@Override
	public String selectMovieCode(){
		String movie_code = movieDao.selectMovieCode();
		return movie_code;
	}
	@Override
	public MovieVo selectByMovie(String movie_code){
		MovieVo movieVo= movieDao.selectByMovie(movie_code);
		return movieVo;
	}
		
	@Override
	public List<MovieImageVo> selectByMovieSubImage(String movie_code){
		List<MovieImageVo> list = movieDao.selectByMovieSubImage(movie_code);
		return list;
	}
	@Override
	public int getCountMovie(Admin_PageingDto admin_PageingDto){
		int count = movieDao.getCountMovie(admin_PageingDto);
		return count;
	}
	@Override
	public List<MovieVo> listAll(Admin_PageingDto admin_PageingDto){
		List<MovieVo> list = movieDao.listAll(admin_PageingDto);
		return list;
	}

	@Transactional
	@Override
	public void deleteMovie(String movie_code) {
		movieDao.deleteMovieImage(movie_code);
		movieDao.deleteMovie(movie_code);
		//System.out.println("잘실행됨");
	}

	@Override
	public List<MovieVo> nameListAll() {
		List<MovieVo>list = movieDao.nameListAll();
		return list;
	}

	@Override
	public MovieVo getMovieInfo(String movie_name) {
		MovieVo movieVo = movieDao.getMovieInfo(movie_name);
		return movieVo;
	}

	@Transactional
	@Override
	public void insertMoviSchedule(MovieScheduleVo movieScheduleVo) {
		movieDao.insertMoviSchedule(movieScheduleVo);
		String movie_name = movieScheduleVo.getMovie_name();
		movieDao.countUp(movie_name);
	}
	@Override
	public MovieScheduleVo lastMovieSchedule(int area_theater_no) {
		MovieScheduleVo movieScheduleVo = movieDao.lastMovieSchedule(area_theater_no);
		return movieScheduleVo;
	}

}
