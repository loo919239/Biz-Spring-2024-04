package com.nono.nemo.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.nono.nemo.model.GameBoard;

@Controller
public class GameController {
    private static final String SESSION_ATTRIBUTE_GAME_BOARD = "gameBoard";

    @RequestMapping(value = {"/",""}, method = RequestMethod.GET)
    public ModelAndView showGamePage(HttpSession session) {
        GameBoard gameBoard = (GameBoard) session.getAttribute(SESSION_ATTRIBUTE_GAME_BOARD);
        if (gameBoard == null) {
            gameBoard = new GameBoard(5); // 적절한 보드 크기로 변경하세요
            // 게임 보드 초기화 또는 행/열 힌트 설정 등의 작업을 수행하세요
            session.setAttribute(SESSION_ATTRIBUTE_GAME_BOARD, gameBoard);
        }
        return new ModelAndView("game", "gameBoard", gameBoard);
    }

    @RequestMapping(value = "/", method = RequestMethod.POST)
    public String checkClickedCell(@RequestParam("row") int row, @RequestParam("col") int col, HttpSession session) {
        GameBoard gameBoard = (GameBoard) session.getAttribute(SESSION_ATTRIBUTE_GAME_BOARD);
        // 클릭된 셀에 대한 처리를 수행하고 게임 보드를 업데이트합니다.
        // 적절한 로직을 구현하세요
        return "redirect:/";
    }
}
