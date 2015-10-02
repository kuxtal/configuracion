// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package mx.japs.portal.configuracion.modelo;

import java.util.Iterator;
import java.util.List;
import javax.validation.ConstraintViolation;
import javax.validation.ConstraintViolationException;
import mx.japs.portal.configuracion.modelo.PerfilDataOnDemand;
import mx.japs.portal.configuracion.modelo.PerfilIntegrationTest;
import mx.japs.portal.configuracion.repositorio.PerfilRepository;
import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;

privileged aspect PerfilIntegrationTest_Roo_IntegrationTest {
    
    declare @type: PerfilIntegrationTest: @RunWith(SpringJUnit4ClassRunner.class);
    
    declare @type: PerfilIntegrationTest: @ContextConfiguration(locations = "classpath*:/META-INF/spring/applicationContext*.xml");
    
    declare @type: PerfilIntegrationTest: @Transactional;
    
    @Autowired
    PerfilDataOnDemand PerfilIntegrationTest.dod;
    
    @Autowired
    PerfilRepository PerfilIntegrationTest.perfilRepository;
    
    @Test
    public void PerfilIntegrationTest.testCount() {
        Assert.assertNotNull("Data on demand for 'Perfil' failed to initialize correctly", dod.getRandomPerfil());
        long count = perfilRepository.count();
        Assert.assertTrue("Counter for 'Perfil' incorrectly reported there were no entries", count > 0);
    }
    
    @Test
    public void PerfilIntegrationTest.testFind() {
        Perfil obj = dod.getRandomPerfil();
        Assert.assertNotNull("Data on demand for 'Perfil' failed to initialize correctly", obj);
        Long id = obj.getId();
        Assert.assertNotNull("Data on demand for 'Perfil' failed to provide an identifier", id);
        obj = perfilRepository.findOne(id);
        Assert.assertNotNull("Find method for 'Perfil' illegally returned null for id '" + id + "'", obj);
        Assert.assertEquals("Find method for 'Perfil' returned the incorrect identifier", id, obj.getId());
    }
    
    @Test
    public void PerfilIntegrationTest.testFindAll() {
        Assert.assertNotNull("Data on demand for 'Perfil' failed to initialize correctly", dod.getRandomPerfil());
        long count = perfilRepository.count();
        Assert.assertTrue("Too expensive to perform a find all test for 'Perfil', as there are " + count + " entries; set the findAllMaximum to exceed this value or set findAll=false on the integration test annotation to disable the test", count < 250);
        List<Perfil> result = perfilRepository.findAll();
        Assert.assertNotNull("Find all method for 'Perfil' illegally returned null", result);
        Assert.assertTrue("Find all method for 'Perfil' failed to return any data", result.size() > 0);
    }
    
    @Test
    public void PerfilIntegrationTest.testFindEntries() {
        Assert.assertNotNull("Data on demand for 'Perfil' failed to initialize correctly", dod.getRandomPerfil());
        long count = perfilRepository.count();
        if (count > 20) count = 20;
        int firstResult = 0;
        int maxResults = (int) count;
        List<Perfil> result = perfilRepository.findAll(new org.springframework.data.domain.PageRequest(firstResult / maxResults, maxResults)).getContent();
        Assert.assertNotNull("Find entries method for 'Perfil' illegally returned null", result);
        Assert.assertEquals("Find entries method for 'Perfil' returned an incorrect number of entries", count, result.size());
    }
    
    @Test
    public void PerfilIntegrationTest.testFlush() {
        Perfil obj = dod.getRandomPerfil();
        Assert.assertNotNull("Data on demand for 'Perfil' failed to initialize correctly", obj);
        Long id = obj.getId();
        Assert.assertNotNull("Data on demand for 'Perfil' failed to provide an identifier", id);
        obj = perfilRepository.findOne(id);
        Assert.assertNotNull("Find method for 'Perfil' illegally returned null for id '" + id + "'", obj);
        boolean modified =  dod.modifyPerfil(obj);
        Integer currentVersion = obj.getVersion();
        perfilRepository.flush();
        Assert.assertTrue("Version for 'Perfil' failed to increment on flush directive", (currentVersion != null && obj.getVersion() > currentVersion) || !modified);
    }
    
    @Test
    public void PerfilIntegrationTest.testSaveUpdate() {
        Perfil obj = dod.getRandomPerfil();
        Assert.assertNotNull("Data on demand for 'Perfil' failed to initialize correctly", obj);
        Long id = obj.getId();
        Assert.assertNotNull("Data on demand for 'Perfil' failed to provide an identifier", id);
        obj = perfilRepository.findOne(id);
        boolean modified =  dod.modifyPerfil(obj);
        Integer currentVersion = obj.getVersion();
        Perfil merged = perfilRepository.save(obj);
        perfilRepository.flush();
        Assert.assertEquals("Identifier of merged object not the same as identifier of original object", merged.getId(), id);
        Assert.assertTrue("Version for 'Perfil' failed to increment on merge and flush directive", (currentVersion != null && obj.getVersion() > currentVersion) || !modified);
    }
    
    @Test
    public void PerfilIntegrationTest.testSave() {
        Assert.assertNotNull("Data on demand for 'Perfil' failed to initialize correctly", dod.getRandomPerfil());
        Perfil obj = dod.getNewTransientPerfil(Integer.MAX_VALUE);
        Assert.assertNotNull("Data on demand for 'Perfil' failed to provide a new transient entity", obj);
        Assert.assertNull("Expected 'Perfil' identifier to be null", obj.getId());
        try {
            perfilRepository.save(obj);
        } catch (final ConstraintViolationException e) {
            final StringBuilder msg = new StringBuilder();
            for (Iterator<ConstraintViolation<?>> iter = e.getConstraintViolations().iterator(); iter.hasNext();) {
                final ConstraintViolation<?> cv = iter.next();
                msg.append("[").append(cv.getRootBean().getClass().getName()).append(".").append(cv.getPropertyPath()).append(": ").append(cv.getMessage()).append(" (invalid value = ").append(cv.getInvalidValue()).append(")").append("]");
            }
            throw new IllegalStateException(msg.toString(), e);
        }
        perfilRepository.flush();
        Assert.assertNotNull("Expected 'Perfil' identifier to no longer be null", obj.getId());
    }
    
    @Test
    public void PerfilIntegrationTest.testDelete() {
        Perfil obj = dod.getRandomPerfil();
        Assert.assertNotNull("Data on demand for 'Perfil' failed to initialize correctly", obj);
        Long id = obj.getId();
        Assert.assertNotNull("Data on demand for 'Perfil' failed to provide an identifier", id);
        obj = perfilRepository.findOne(id);
        perfilRepository.delete(obj);
        perfilRepository.flush();
        Assert.assertNull("Failed to remove 'Perfil' with identifier '" + id + "'", perfilRepository.findOne(id));
    }
    
}
