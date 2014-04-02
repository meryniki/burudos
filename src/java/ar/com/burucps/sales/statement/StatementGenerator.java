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

import ar.com.burudos.sales.Summary;

public class StatementGenerator {

	final KnowledgeBuilder kbuilder = KnowledgeBuilderFactory
			.newKnowledgeBuilder();

	// Drools session
	KnowledgeAgent kagent;

	public void generateStatement() {
		kbuilder.add(ResourceFactory.newClassPathResource("HelloWorld.drl",
				StatementGenerator.class), ResourceType.DRL);
		
		// Check the builder for errors
		if (kbuilder.hasErrors()) {
			System.out.println(kbuilder.getErrors().toString());
			throw new RuntimeException("Unable to compile \"HelloWorld.drl\".");
		}
		
		// get the compiled packages (which are serializable)
        final Collection<KnowledgePackage> pkgs = kbuilder
                .getKnowledgePackages();
        
     // add the packages to a knowledgebase (deploy the knowledge packages).
        final KnowledgeBase kbase = KnowledgeBaseFactory.newKnowledgeBase();
        kbase.addKnowledgePackages( pkgs );
        
        final StatefulKnowledgeSession ksession = kbase
                .newStatefulKnowledgeSession();
        ksession.setGlobal( "list",
                            new ArrayList<Object>() );
        
        Summary summary = new Summary();
        
        ksession.insert( summary );

        ksession.fireAllRules();

        ksession.dispose();
	}
}
