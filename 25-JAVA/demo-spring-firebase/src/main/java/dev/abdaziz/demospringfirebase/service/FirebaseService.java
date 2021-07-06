package dev.abdaziz.demospringfirebase.service;

import java.util.concurrent.ExecutionException;

import com.google.api.core.ApiFuture;
import com.google.cloud.firestore.Firestore;
import com.google.cloud.firestore.WriteResult;
import com.google.firebase.cloud.FirestoreClient;

import org.springframework.stereotype.Service;

import dev.abdaziz.demospringfirebase.model.Person;

@Service
public class FirebaseService {
    public String saveUserDetails(Person person) throws InterruptedException, ExecutionException {

        Firestore dbFirestore = FirestoreClient.getFirestore();
        ApiFuture<WriteResult> collectionApiFuture = dbFirestore.collection("users").document(person.getName())
                .set(person);
        return collectionApiFuture.get().getUpdateTime().toString();
    }
}
