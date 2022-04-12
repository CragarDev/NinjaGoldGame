package com.cragardev.ninjagoldgame.controllers;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class HomeController {

	@RequestMapping("/gold")
	public String gold(HttpSession session, Model model) {

		// If the count is not already in session
		if (session.getAttribute("gold") == null) {
			// Use setAttribute to initialize the count in session
			session.setAttribute("gold", 0);
		}
		// If the array list is not already in session
		if (session.getAttribute("activityList") == null) {
			// Use setAttribute to initialize the a list and put it in session
			ArrayList<String> activityList = new ArrayList<String>();
			session.setAttribute("activityList", activityList);
		}

		// get the gold count to pass to index.jsp
		int goldCounter = (Integer) session.getAttribute("gold");
		model.addAttribute("gold", goldCounter);

		// get the activity list and pass to index.jsp
		ArrayList<String> activityList = (ArrayList<String>) session.getAttribute("activityList");
		model.addAttribute("activityList", activityList);

		return "index.jsp";
	}

	@RequestMapping("/gold/process")
	public String goldProcess(HttpSession session, Model model, @RequestParam(value = "place") String place) {

		// create a hash map for the string out puts
		HashMap<String, String> activityOutput = new HashMap<String, String>();

		// Start the if statements for the outputs
		// variables for string output
		String placeForString = "";
		int goldEarnAmount = 0;
		String outputType = ""; // either positive or negative
		String stringOutput = "";

		if (place.equals("farm")) {
			// set the place for string
			placeForString = "Farm";
			// random number between 15 and 50
			goldEarnAmount = (int) (Math.random() * (51 - 15) + 15);
			// set the output type to positive
			outputType = "positive";

		} else if (place.equals("cave")) {
			// set the place for string
			placeForString = "Cave";
			// random number between 2 and 10
			goldEarnAmount = (int) (Math.random() * (11 - 2) + 2);
			// set the output type to positive
			outputType = "positive";

		} else if (place.equals("home")) {
			// set the place for string
			placeForString = "Home";
			// random number between 5 and 20
			goldEarnAmount = (int) (Math.random() * (21 - 5) + 5);
			// set the output type to positive
			outputType = "positive";

		} else {
			// set the place for string
			placeForString = "Quest";
			// random number between 0 and 100
			goldEarnAmount = (int) (Math.random() * (101 - 0) + 0);
			// set the output type to positive

			// check if the result is fail or pass
			// fail or pass random variable
			int failOrPass = (int) (Math.random() * (2 - 0) + 0);

			if (failOrPass == 0) {
				outputType = "positive";
			} else {
				outputType = "negative";
				goldEarnAmount *= -1;
			}
		}

		// create a date/time stamp
		String dateTimeStamp = java.time.LocalDateTime.now().toString();

		// String output either positive or negative
		if (outputType.equals("positive")) {
			stringOutput = "You entered a " + placeForString + " and earned " + goldEarnAmount + " gold ("
					+ dateTimeStamp
					+ ")";
		} else {
			stringOutput = "You failed a Quest and lost " + goldEarnAmount + " gold (" + dateTimeStamp
					+ ")";
		}

		// get the gold count to work it to index.jsp
		int goldCounter = (Integer) session.getAttribute("gold");
		model.addAttribute("gold", goldCounter);

		// get the activity list and pass to index.jsp
		ArrayList<String> activityList = (ArrayList<String>) session.getAttribute("activityList");

		model.addAttribute("activityList", activityList);
		activityList.add(stringOutput);

		int goldUpdater = (Integer) session.getAttribute("gold");
		session.setAttribute("gold", goldUpdater + goldEarnAmount);

		session.setAttribute("activityList", activityList);

		// String checkOutputType = outputType;
		// model.addAttribute("checkOutputType", checkOutputType);

		// reset variables
		placeForString = "";
		goldEarnAmount = 0;
		outputType = "";
		stringOutput = "";
		return "redirect:/gold";
	}

	@RequestMapping("/reset")
	public String reset(HttpSession session) {

		session.removeAttribute("gold");
		session.setAttribute("gold", 0);
		session.removeAttribute("activityList");
		ArrayList<String> activityList = new ArrayList<String>();
		session.setAttribute("activityList", activityList);

		return "index.jsp";
	}
}
