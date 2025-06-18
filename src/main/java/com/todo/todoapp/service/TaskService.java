package com.todo.todoapp.service;

import org.springframework.stereotype.Service;

import com.todo.todoapp.model.Task;
import com.todo.todoapp.repository.TaskRepository;

import java.util.List;

@Service
public class TaskService {
    private final TaskRepository taskRepository;

    public TaskService(TaskRepository taskRepository) {
        this.taskRepository = taskRepository;
    }

    public List<Task> getAllTasks() {
        return taskRepository.findAll();
    }

    public void saveTask(Task task) {
        taskRepository.save(task);
    }

    public void deleteTask(Long id) {
    	 if (taskRepository.existsById(id)) {
    	        taskRepository.deleteById(id);
    	    }
    }

    public Task getTask(Long id) {
        return taskRepository.findById(id).orElse(null);
    }
}
