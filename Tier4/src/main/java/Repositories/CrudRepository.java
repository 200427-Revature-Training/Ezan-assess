package Repositories;

import java.util.Set;

public interface CrudRepository<T> {
	T save(T t);
	Set<T> findAll();
	T findById(int id);
	boolean update(T t);
	boolean deleteById(int id);
}
