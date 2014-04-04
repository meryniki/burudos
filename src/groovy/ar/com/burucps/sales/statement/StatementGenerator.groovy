package ar.com.burucps.sales.statement;

import java.util.ArrayList;
import java.util.Collection;

import org.drools.KnowledgeBase;
import org.drools.KnowledgeBaseFactory;
import org.drools.agent.KnowledgeAgent;
import org.drools.builder.KnowledgeBuilder;
import org.drools.builder.KnowledgeBuilderFactory;
import org.drools.builder.ResourceType;
import org.drools.definition.KnowledgePackage;
import org.drools.io.ResourceFactory;
import org.drools.runtime.StatefulKnowledgeSession;

import ar.com.burudos.business.BussinesUnit;
import ar.com.burudos.party.Employee;
import ar.com.burudos.sales.Summary;
import ar.com.burudos.sales.Transaction;
import ar.com.burudos.sales.statement.Parameter;
import ar.com.burudos.sales.statement.Statement;

public class StatementGenerator {

	public void generateStatement(Integer month) {
		final KnowledgeBuilder kbuilder = KnowledgeBuilderFactory
		.newKnowledgeBuilder();
		
		kbuilder.add(ResourceFactory.newClassPathResource("SellerRules.drl",
				StatementGenerator.class), ResourceType.DRL);
		
		// Check the builder for errors
		if (kbuilder.hasErrors()) {
			System.out.println(kbuilder.getErrors().toString());
			throw new RuntimeException("Unable to compile \"SellerRules.drl\".");
		}
		
		// get the compiled packages (which are serializable)
		final Collection<KnowledgePackage> pkgs = kbuilder
				.getKnowledgePackages();
        
		// add the packages to a knowledgebase (deploy the knowledge packages).
        final KnowledgeBase kbase = KnowledgeBaseFactory.newKnowledgeBase();
        kbase.addKnowledgePackages( pkgs );
        
        final StatefulKnowledgeSession ksession = kbase
                .newStatefulKnowledgeSession();
        
		// Load Statement parameters
        ksession.setGlobal( "parameters", Parameters.findAll());
        // Load Business Units
        ksession.setGlobal( "businessUnits", BussinesUnit.findAll());
        
        // Load EmployeeList and their statements
        for (Employee employee : Employee.findAll()) {
        	ksession.insert(employee);
        	Statement statement = new Statement();
			statement.employee = employee;
			statement.month = month;
			ksession.insert(statement);
        }
        
        // Load Transactions
        for (Transaction transaction : Transaction.findAllByMonth(month)) {
        	ksession.insert(transaction);
        }
        
        // Load Summary
        for (Summary summary : Summary.findAllByMonth(month)) {
        	ksession.insert(summary);
        }
        
        ksession.fireAllRules();

        ksession.dispose();
	}
}
