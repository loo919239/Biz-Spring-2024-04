package come.nemo.nemo.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

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



		@RequestMapping(value = "/", method = RequestMethod.GET)
	    public String showNonogram(Model model) {
	        int[][] board = {
	            {1, 0, 1, 0, 1},
	            {0, 1, 0, 1, 0},
	            {1, 0, 1, 0, 1},
	            {0, 1, 0, 1, 0},
	            {1, 0, 1, 0, 1}
	        };
	        model.addAttribute("board", board);
	        return "nonogram";
	    }
	
	
}
