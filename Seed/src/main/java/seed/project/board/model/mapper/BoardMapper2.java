package seed.project.board.model.mapper;

import java.util.List;
import java.util.Map;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.session.RowBounds;
import seed.project.board.model.dto.Board;
import seed.project.board.model.dto.Comment;

@Mapper
public interface BoardMapper2 {

	/** [공통] 게시판 종류 조회
	 * @return boardTypeList
	 */
	List<Map<String, Object>> selectBoardTypeList();

	
	/** [공통] 게시판 게시글 수 조회
	 * @param boardCode
	 * @return listCount
	 */
	int getListCount(int boardCode);
  
  
  
	/** 문의 게시판 게시글 조회
	 * @param rowBounds 
	 * @param boardCode 
	 * @return
	 */
	List<Board> selectBoard2List(int boardCode, RowBounds rowBounds);

	
	/** 게시글 정보 가져오기
	 * @param boardNo
	 * @return
	 */
	Board board2Detail(int boardNo);

	/** 게시글 댓글 정보
	 * @param boardNo
	 * @return
	 */
	List<Comment> board2CommentList(int boardNo);

	
	
	

	/** [2] 게시글 삭제(업데이트)
	 * @param boardNo
	 * @return
	 */
	int board2Delete(int boardNo);


	/** [2] 게시글 작성하기
	 * @param board
	 * @return
	 */
	int board2Write(Map<String, String> board);


	/** [2] 게시글 정보 가져오기
	 * @param boardNo
	 * @return
	 */
	Board board2Info(int boardNo);


	/** [2] 게시글 수정하기
	 * @param board
	 * @return
	 */
	int board2Update(Map<String, Object> board);

	


	/** [2] 문의 게시판 검색 삭제되지 않은 게시글들
	 * @param paramMap
	 * @return
	 */
	List<Board> getSearchCount2(Map<String, Object> paramMap);


	/** [2] 검색한 게시글 반환
	 * @param paramMap
	 * @param rowBounds
	 * @return
	 */
	List<Board> getSearchCount2(Map<String, Object> paramMap, RowBounds rowBounds);


	
  
	/** [2] 댓글 달기
	 * @param commentMap
	 * @return
	 */
	int board2Comment(Map<String, Object> commentMap);


	/** [2] 댓글 삭제
	 * @param commentNo
	 * @return
	 */
	int board2CommentDelete(int commentNo);
  
	


	/** [2] 댓글 수정하기
	 * @param commentMap
	 * @return
	 */
	int board2CommentUpdate(Map<String, Object> commentMap);


	/** [2] 좋아요 여부
	 * @param likeMap
	 * @return
	 */
	int board2Like(Map<String, Integer> likeMap);


	/** [2] 좋아요 취소
	 * @param likeMap
	 */
	void board2LikeBack(Map<String, Integer> likeMap);


	/** [2] 좋아요 누르기
	 * @param likeMap
	 */
	void board2LikePush(Map<String, Integer> likeMap);


	/** [2] 좋아요 개수 반환
	 * @param integer
	 * @return
	 */
	int board2LikeCount(int boardNo);


	/** [2] 조회수 증가
	 * @param boardNo
	 */
	void boardView(int boardNo);


	/** [2] 게시글 글쓴이 번호
	 * @param boardNo
	 * @return
	 */
	int boardWriter(int boardNo);





}
