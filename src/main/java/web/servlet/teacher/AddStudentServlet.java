package web.servlet.teacher;

import domain.Student;
import org.apache.commons.beanutils.BeanUtils;
import service.TeacherService;
import service.impl.TeacherServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.util.List;
import java.util.Map;

@WebServlet("/addStudentServlet")
public class AddStudentServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setCharacterEncoding("utf-8");

        Map<String, String[]> maps = request.getParameterMap();
        Student student = new Student();

        try {
            BeanUtils.populate(student, maps);
        } catch (IllegalAccessException e) {
            e.printStackTrace();
        } catch (InvocationTargetException e) {
            e.printStackTrace();
        }
        student.setPassword(student.getStudentName());

        TeacherService teacherService = new TeacherServiceImpl();
        teacherService.addStudent(student);
        String header = request.getHeader("referer");
        if (header.contains("studentManager.jsp")) {
            response.sendRedirect("jsp/teacher/studentManager.jsp");
        } else if (header.contains("studentManagerServlet")) {
            String username = request.getParameter("username");
            response.sendRedirect(request.getContextPath() + "/studentManagerServlet?username=" + username + "&currentPage=1&rows=5");
        }
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        this.doPost(req, resp);
    }
}