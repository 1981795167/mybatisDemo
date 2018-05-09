package sqlmap;

import java.util.List;

import com.po.Orders;

public interface UserChildMapper {

	public List<Orders> findOrdersUserLazyloading();
}
