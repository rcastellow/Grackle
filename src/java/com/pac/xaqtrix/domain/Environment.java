/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.pac.xaqtrix.domain;

import java.util.List;

/**
 *
 * @author robert
 */
public class Environment {

    private String name;
    private String description;
    private List<Host> host;

    /**
     * @return the name
     */
    public String getName() {
        return name;
    }

    /**
     * @param name the name to set
     */
    public void setName(String name) {
        this.name = name;
    }

    /**
     * @return the description
     */
    public String getDescription() {
        return description;
    }

    /**
     * @param description the description to set
     */
    public void setDescription(String description) {
        this.description = description;
    }

    /**
     * @return the host
     */
    public List<Host> getHost() {
        return host;
    }

    /**
     * @param host the host to set
     */
    public void setHost(List<Host> host) {
        this.host = host;
    }


}
