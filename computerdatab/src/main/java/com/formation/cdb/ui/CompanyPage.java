package com.formation.cdb.ui;

import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import org.apache.commons.configuration2.Configuration;
import org.apache.commons.configuration2.FileBasedConfiguration;
import org.apache.commons.configuration2.PropertiesConfiguration;
import org.apache.commons.configuration2.builder.FileBasedConfigurationBuilder;
import org.apache.commons.configuration2.builder.fluent.Parameters;
import org.apache.commons.configuration2.ex.ConfigurationException;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.formation.cdb.model.dto.CompanyDto;
import com.formation.cdb.service.CompanyService;

public class CompanyPage {

    int maxInPage = 0;
    int indexMaPage = 0;
    List<CompanyDto> list = new ArrayList<CompanyDto>();
    final Properties prop = new Properties();
    Parameters params = new Parameters();
    Configuration config;

    private CompanyService companyService;

    /**
     * Constrcteur.
     * @param index Page index.
     */
    public CompanyPage(int index) {
        ApplicationContext context = new ClassPathXmlApplicationContext("Spring-Module.xml");
        companyService = (CompanyService) context.getBean("companyService");

        FileBasedConfigurationBuilder<FileBasedConfiguration> builder = new FileBasedConfigurationBuilder<FileBasedConfiguration>(
                PropertiesConfiguration.class).configure(params.properties().setFileName("conf.properties"));
        try {
            config = builder.getConfiguration();

        } catch (ConfigurationException cex) {
            // loading of the configuration file failed
        }

        maxInPage = config.getInt("pagination.maxpage");
        indexMaPage = index;
        this.list = companyService.findCompaniesInRange(index, maxInPage);
    }

    public int getMaxInPage() {
        return maxInPage;
    }

    public void setMaxInPage(int maxInPage) {
        this.maxInPage = maxInPage;
    }

    public int getIndexMaPage() {
        return indexMaPage;
    }

    public void setIndexMaPage(int indexMaPage) {
        this.indexMaPage = indexMaPage;
    }

    public List<CompanyDto> getList() {
        return list;
    }

    public void setList(List<CompanyDto> list) {
        this.list = list;
    }
}