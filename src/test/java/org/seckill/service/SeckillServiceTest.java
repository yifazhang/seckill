package org.seckill.service;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.seckill.dto.Exposer;
import org.seckill.dto.SeckillExecution;
import org.seckill.entity.Seckill;
import org.seckill.exception.RepeatKillException;
import org.seckill.exception.SeckillCloseException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.List;


/**
 * Created by zyf on 2017/6/5.
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({
        "classpath:spring/spring-dao.xml",
        "classpath:spring/spring-service.xml"})
public class SeckillServiceTest {

    private static final Logger logger = LoggerFactory.getLogger(SeckillServiceTest.class);

    @Autowired
    private SeckillService seckillService;

    @Test
    public void getSeckillList() throws Exception {
        List<Seckill> list = seckillService.getSeckillList();
        logger.info("list={}",list);
    }

    @Test
    public void getById() throws Exception {
        long id = 1000;
        Seckill seckill = seckillService.getById(id);
        logger.info("seckill={}",seckill);
    }

    @Test
    public void exportSeckillUrl() throws Exception {
        long id = 1000;
        Exposer exposer = seckillService.exportSeckillUrl(id);
        logger.info("exposer={}",exposer);
        // Exposer{
        // exposed=true,
        // md5='3a3c61b1a5c9bd86a9f2df688479d872',
        // seckillId=1000,
        // now=0, start=0, end=0}

    }

    //集成测试代码完整逻辑,注意可重复执行
    @Test
    public void seckillLogic() throws Exception {
        long id = 1001;
        Exposer exposer = seckillService.exportSeckillUrl(id);
        if (exposer.isExposed()) {
            logger.info("exposer={}",exposer);
            long phone = 13211111111L;
            String md5 = exposer.getMd5();
            try {
                SeckillExecution execution = seckillService.executeSeckill(id,phone,md5);
                logger.info("result={}",execution);
            } catch (RepeatKillException e1) {
                logger.error(e1.getMessage());
            } catch (SeckillCloseException e2) {
                logger.error(e2.getMessage());
            }
        } else {
            //秒杀未开启
            logger.warn("exposer={}",exposer);
        }

    }

    @Test
    public void executeSeckill() throws Exception {
        try {
            long id = 1000;
            long phone = 13211111111L;
            String md5 = "3a3c61b1a5c9bd86a9f2df688479d872";
            SeckillExecution execution = seckillService.executeSeckill(id,phone,md5);
            logger.info("execution={}",execution);
        } catch (RepeatKillException e1) {
            logger.error(e1.getMessage());
        } catch (SeckillCloseException e2) {
            logger.error(e2.getMessage());
        }
    }

}