package dev.abdaziz.demospringfirebase.service;

import java.util.concurrent.ExecutionException;

import com.google.api.core.ApiFuture;
import com.google.cloud.firestore.DocumentReference;
import com.google.cloud.firestore.DocumentSnapshot;
import com.google.cloud.firestore.Firestore;
import com.google.cloud.firestore.WriteResult;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dev.abdaziz.demospringfirebase.model.Person;

@Service
public class FirebaseService {
    @Autowired
    private FirebaseInitialize firebase;

    public String saveUserDetails(Person person) throws InterruptedException, ExecutionException {

        Firestore db = firebase.getFireStore();
        ApiFuture<WriteResult> future = db.collection("users").document(person.getName()).set(person);
        return future.get().getUpdateTime().toString();
    }

    public Person getUserDetails(String name) throws InterruptedException, ExecutionException {
        Firestore db = firebase.getFireStore();
        DocumentReference docRef = db.collection("users").document(name);
        // asynchronously retrieve the document
        ApiFuture<DocumentSnapshot> future = docRef.get();
        // block on response
        DocumentSnapshot document = future.get();
        Person person = null;
        if (document.exists()) {
            // convert document to POJO
            person = document.toObject(Person.class);
            System.out.println(person);
            return person;
        } else {
            System.out.println("No such document!");
            return null;
        }
    }

    public String deleteUser(String name) throws InterruptedException, ExecutionException {
        Firestore db = firebase.getFireStore();
        ApiFuture<WriteResult> writeResult = db.collection("users").document(name).delete();
        return writeResult.get().getUpdateTime().toString();
    }
}
