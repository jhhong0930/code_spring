package com.spring.security;

import com.spring.domain.CustomUser;
import com.spring.domain.MemberVO;
import com.spring.mapper.MemberMapper;
import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

@Log4j
@AllArgsConstructor
public class CustomUserDetailsService implements UserDetailsService {

    private MemberMapper mapper;

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        log.warn("Load user by username: " + username);

        MemberVO vo = mapper.read(username);

        log.warn("queried by member mapper: " + vo);

        return vo == null ? null : new CustomUser(vo);
    }
}
