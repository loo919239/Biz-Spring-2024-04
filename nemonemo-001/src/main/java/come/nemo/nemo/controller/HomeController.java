package come.nemo.nemo.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import come.nemo.nemo.model.NemoVO;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
//	@RequestMapping(value = "/", method = RequestMethod.GET)
//	public String home(Locale locale, Model model) {
//		
//		Date date = new Date();
//		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
//		
//		String formattedDate = dateFormat.format(date);
//		
//		model.addAttribute("serverTime", formattedDate );
//		
//		return "home";
//	}

	private static final String SESSION_ATTRIBUTE_GAME_BOARD = "nemoVO";

    @RequestMapping(value = "/", method = RequestMethod.GET)
    public String showGamePage(HttpSession session) {
        NemoVO nemoVO = (NemoVO) session.getAttribute(SESSION_ATTRIBUTE_GAME_BOARD);
        if (nemoVO == null) {
        	nemoVO = new NemoVO(5); // 적절한 보드 크기로 변경하세요
            // 게임 보드 초기화 또는 행/열 힌트 설정 등의 작업을 수행하세요
            session.setAttribute(SESSION_ATTRIBUTE_GAME_BOARD, nemoVO);
        }
        return "home";
    }

    @RequestMapping(value = "/check", method = RequestMethod.POST)
    public String checkClickedCell(@RequestParam("row") int row, @RequestParam("col") int col, HttpSession session) {
    	NemoVO nemoVO = (NemoVO) session.getAttribute(SESSION_ATTRIBUTE_GAME_BOARD);
        // 클릭된 셀에 대한 처리를 수행하고 게임 보드를 업데이트합니다.
        // 적절한 로직을 구현하세요
        return "/:redirect";
    }
	
	
}
