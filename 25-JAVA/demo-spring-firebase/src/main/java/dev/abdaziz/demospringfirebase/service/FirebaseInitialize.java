package dev.abdaziz.demospringfirebase.service;

import java.io.InputStream;

import javax.annotation.PostConstruct;

import com.google.auth.oauth2.GoogleCredentials;
import com.google.cloud.firestore.Firestore;
import com.google.firebase.FirebaseApp;
import com.google.firebase.FirebaseOptions;
import com.google.firebase.cloud.FirestoreClient;

import org.springframework.stereotype.Service;

@Service
public class FirebaseInitialize {

    @PostConstruct
    public void initialize() {
        try {

            InputStream serviceAccount = getClass().getClassLoader().getResourceAsStream("serviceAccount.json");
            FirebaseOptions options = new FirebaseOptions.Builder()
                    .setCredentials(GoogleCredentials.fromStream(serviceAccount))
                    .setDatabaseUrl("https://abd-springdb.firebaseio.com/").build();

            if (FirebaseApp.getApps().isEmpty()) {
                FirebaseApp.initializeApp(options);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

    }

    public Firestore getFireStore() {
        return FirestoreClient.getFirestore();
    }
}
