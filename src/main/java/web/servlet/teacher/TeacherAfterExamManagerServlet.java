package web.servlet.teacher;

import domain.Configuration;
import domain.Exam;
import domain.PageBean;
import domain.Teacher;
import service.TeacherService;
import service.impl.TeacherServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/teacherAfterExamManagerServlet")
public class TeacherAfterExamManagerServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String currentPage = request.getParameter("currentPage");
        Configuration config = (Configuration) this.getServletContext().getAttribute("config");
        String rows = Integer.toString(config.getRows());

        Teacher teacher = (Teacher) request.getSession().getAttribute("teacher");
        String username = teacher.getUsername();

        TeacherService teacherService = new TeacherServiceImpl();
        PageBean<Exam> pb = teacherService.findExamByPage(currentPage, rows, username);

        request.setAttribute("pb", pb);
        request.getRequestDispatcher("/jsp/teacher/afterExam.jsp").forward(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request, response);
    }
}
