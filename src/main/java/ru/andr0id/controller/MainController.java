package ru.andr0id.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.support.PagedListHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import ru.andr0id.model.User;
import ru.andr0id.service.UserService;

import java.util.List;


/**
 * Created by paa on 11.05.2016.
 */
@Controller
@RequestMapping(value = "/main")
public class MainController {

    private UserService userService;

    @Autowired(required = true)
    @Qualifier(value = "userService")
    public void setUserService(UserService userService) {
        this.userService = userService;
    }


    @RequestMapping(value = "/users", method = RequestMethod.GET)
    public ModelAndView getUserList(@RequestParam(required = false) Integer page)
    {
        ModelAndView modelAndView = new ModelAndView("hello");
        List<User> users = userService.listUsers();
        PagedListHolder<User> pagedListHolder = new PagedListHolder<>(users);
        pagedListHolder.setPageSize(10);
        modelAndView.addObject("maxPages", pagedListHolder.getPageCount());
        if(page == null || page > pagedListHolder.getPageCount())
            page = 1;
        modelAndView.addObject("page", page);
        if (page == null || page < 1 || page > pagedListHolder.getPageCount())
        {
            pagedListHolder.setPage(0);
            modelAndView.addObject("users", pagedListHolder.getPageList());
        } else if (page <= pagedListHolder.getPageCount())
        {
            pagedListHolder.setPage(page - 1);
            modelAndView.addObject("users",pagedListHolder.getPageList());
        }
        return modelAndView;
        }

    @RequestMapping(value = "/users/add", method = RequestMethod.GET)
    public String getAddUser(ModelMap model)
    {
        model.addAttribute("user",new User());
        return "addpage";
    }

    @RequestMapping(value = "/users/add", method = RequestMethod.POST)
    public String addUser(@ModelAttribute("user") User user)
    {
        this.userService.addUser(user);
        return "addedpage";
    }

    @RequestMapping(value = "/users/delete/{id}")
    public String deleteUser(@ModelAttribute("id") int id)
    {
        this.userService.deleteUser(id);
        return "redirect:/main/users";
    }

    @RequestMapping(value = "/users/edit", method = RequestMethod.GET)
    public String getEditUser(@RequestParam(value = "id") Integer id, ModelMap model)
    {
        model.addAttribute("user", userService.getUserById(id));
        return "editpage";
    }

    @RequestMapping(value = "/users/edit", method = RequestMethod.POST)
    public String editUser(@ModelAttribute("user") User user, @RequestParam(value = "id") Integer id, Model model)
    {
        user.setId(id);
        userService.updateUser(user);
        model.addAttribute("id", id);
        return "editedpage";
    }

    @RequestMapping(value = "/users/search", method = RequestMethod.GET)
    public ModelAndView editUser(@RequestParam(required = false) Integer page, @ModelAttribute("name") String name)
    {
        ModelAndView modelAndView = new ModelAndView("searchpage");
        modelAndView.addObject("name", name);
        List<User> users = userService.getUserByName(name);
        PagedListHolder<User> pagedListHolder = new PagedListHolder<>(users);
        pagedListHolder.setPageSize(10);
        modelAndView.addObject("maxPages", pagedListHolder.getPageCount());
        if(page == null || page > pagedListHolder.getPageCount())
            page = 1;
        modelAndView.addObject("page", page);
        if (page == null || page < 1 || page > pagedListHolder.getPageCount())
        {
            pagedListHolder.setPage(0);
            modelAndView.addObject("users", pagedListHolder.getPageList());
        } else if (page <= pagedListHolder.getPageCount())
        {
            pagedListHolder.setPage(page - 1);
            modelAndView.addObject("users",pagedListHolder.getPageList());
        }
        return modelAndView;
    }
}
