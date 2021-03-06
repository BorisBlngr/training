package com.formation.cdb.mapper;

import java.time.LocalDate;

import org.junit.After;
import org.junit.AfterClass;
import org.junit.Assert;
import org.junit.Before;
import org.junit.BeforeClass;
import org.junit.Test;

import com.formation.cdb.model.Company;
import com.formation.cdb.model.Computer;
import com.formation.cdb.model.dto.ComputerDto;

public class ComputerMapperTest {
    Computer computer = null;
    ComputerDto computerDto = null;

    /**
     * Execute before Class.
     * @throws Exception Exceptions.
     */
    @BeforeClass
    public static void executerBeforeClass() throws Exception {
    }

    /**
     * Execute after Class.
     * @throws Exception Exceptions.
     */
    @AfterClass
    public static void executerAfterClass() throws Exception {
    }

    /**
     * Execute before test.
     * @throws Exception
     */
    @Before
    public void executerAvantChaqueTest() {
        computerDto = new ComputerDto.ComputerDtoBuilder().name("toto").id(36).introduced("1990-10-10")
                .discontinued("1999-10-10")
                .company(new Company.CompanyBuilder().name("titi").id(6).build()).build();
        computer = new Computer.ComputerBuilder().name("toto").id(36).introduced(LocalDate.of(1990, 10, 10))
                .discontinued(LocalDate.of(1999, 10, 10))
                .company(new Company.CompanyBuilder().name("titi").id(6).build()).build();
    }

    /**
     * Execute after test.
     * @throws Exception
     */
    @After
    public void executerApresChaqueTest() {
        computer = null;
        computerDto = null;
    }

    /**
     * Test map to dto.
     */
    @Test
    public void entityToDtoValid() {
        Assert.assertTrue(ComputerMapper.toDto(computer).equals(computerDto));
    }

    /**
     * Test map to entity.
     */
    @Test
    public void dtoToEntityValid() {
        Assert.assertTrue(ComputerMapper.toEntity(computerDto).equals(computer));
    }
}
