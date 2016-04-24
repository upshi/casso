package top.casso.cas.security;

import java.util.Collection;
import java.util.HashSet;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

import top.casso.cas.dao.UserMapper;
import top.casso.cas.dao.UserRoleMapper;
import top.casso.cas.model.User;
import top.casso.cas.model.UserRole;

public class UserDetailsServiceImpl implements UserDetailsService {

	@Autowired
	private UserMapper userMapper;
	
	@Autowired
	private UserRoleMapper userRoleMapper;
	
	public UserDetails loadUserByUsername(String userName) throws UsernameNotFoundException {
		User user = userMapper.selectByUserName(userName);
		
		boolean enabled = true;
		boolean accountNonExpired = true;
		boolean credentialsNonExpired = true;
		boolean accountNonLocked = true;
		
		Collection<GrantedAuthority> authorities = new HashSet<GrantedAuthority>();
		if(user != null) {
			List<UserRole> userRoles = userRoleMapper.selectRolesByUserUuid(user.getUuid());
			for(UserRole ur : userRoles) {
				authorities.add(new SimpleGrantedAuthority(ur.getRole().geteName()));
			}
		}
		
		org.springframework.security.core.userdetails.User securityUser = new org.springframework.security.core.userdetails.User(userName, user.getPassword(), enabled, accountNonExpired, credentialsNonExpired, accountNonLocked, authorities);
		return securityUser;
	}

}
