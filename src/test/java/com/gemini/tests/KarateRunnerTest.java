package com.gemini.tests;

import com.intuit.karate.junit4.Karate;
import com.intuit.karate.KarateOptions;
import org.junit.runner.RunWith;

@RunWith(Karate.class)
@KarateOptions(
        features = "classpath:features/sample.feature",
        tags = "@api" // @getRequest, @postRequest, @putRequest, @deleteRequest, @javaFunctionCall
)

public class KarateRunnerTest {
}
