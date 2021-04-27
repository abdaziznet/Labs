package dev.abdaziz.procuderkafka;

import java.util.Properties;
import org.apache.kafka.clients.producer.KafkaProducer;
import org.apache.kafka.clients.producer.Producer;
import org.apache.kafka.clients.producer.ProducerConfig;
import org.apache.kafka.clients.producer.ProducerRecord;
import org.apache.kafka.common.serialization.StringSerializer;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
public class ProcuderKafkaApplication {

	public static void main(String[] args) {
		try {

			Properties props = new Properties();
			props.put(ProducerConfig.BOOTSTRAP_SERVERS_CONFIG, "localhost:9092");
			props.put(ProducerConfig.ACKS_CONFIG, "all");
			props.put(ProducerConfig.RETRIES_CONFIG, 0);
			props.put(ProducerConfig.LINGER_MS_CONFIG, 1);
			props.put(ProducerConfig.KEY_SERIALIZER_CLASS_CONFIG, StringSerializer.class.getName());
			props.put(ProducerConfig.VALUE_SERIALIZER_CLASS_CONFIG, StringSerializer.class.getName());

			Producer<String, String> producer = new KafkaProducer<>(props);
			for (int i = 0; i < 5; i++)
				producer.send(new ProducerRecord<String, String>("topic-java", "masuk data ke " + Integer.toString(i)));
			producer.close();

		} catch (Exception e) {
			System.out.println("error with message: " + e.getMessage());
		}

	}

}
