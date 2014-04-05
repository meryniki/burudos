dataSource{
	pooled = true
	driverClassName = "com.mysql.jdbc.Driver"
	dialect = "org.hibernate.dialect.MySQL5InnoDBDialect"
	//driverClassName="org.h2.Driver"
}

hibernate {
	cache.use_second_level_cache = true
	cache.use_query_cache = false
	cache.region.factory_class = 'net.sf.ehcache.hibernate.EhCacheRegionFactory' // Hibernate 3
//    cache.region.factory_class = 'org.hibernate.cache.ehcache.EhCacheRegionFactory' // Hibernate 4
}

// environment specific settings
environments {
	development {
		dataSource {
			dbCreate = "update" // one of 'create', 'create-drop', 'update', 'validate', ''
			//url = "jdbc:h2:devDb;MVCC=TRUE;LOCK_TIMEOUT=10000;DB_CLOSE_ON_EXIT=FALSE"
			url = "jdbc:mysql://localhost/burucps?useUnicode=yes&characterEncoding=UTF-8"
			username = "dev"
			password = "devpwd"
		}
		hibernate {
			show_sql = true
		}
	}
	test {
		dataSource {
			dbCreate = "update"
			//url = "jdbc:h2:mem:testDb;MVCC=TRUE;LOCK_TIMEOUT=10000;DB_CLOSE_ON_EXIT=FALSE"
			url = "jdbc:mysql://localhost/burucps?useUnicode=yes&characterEncoding=UTF-8"
			username = "test"
			password = "testpwd"
		}
		hibernate {
			show_sql = true
		}
	}
	production {
		dataSource{
			dbCreate = "create"
			//url = "jdbc:h2:prodDb;MVCC=TRUE;LOCK_TIMEOUT=10000;DB_CLOSE_ON_EXIT=FALSE"
			url = "jdbc:mysql://localhost/burucps?useUnicode=yes&characterEncoding=UTF-8"
			username = "buru"
			password = "prodamoaamo"
			properties {
			   maxActive = -1
			   minEvictableIdleTimeMillis=1800000
			   timeBetweenEvictionRunsMillis=1800000
			   numTestsPerEvictionRun=3
			   testOnBorrow=true
			   testWhileIdle=true
			   testOnReturn=false
			   validationQuery="SELECT 1"
			   jdbcInterceptors="ConnectionState"
			}
		}
	}
}