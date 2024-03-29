// import { where, query, collection, getDocs } from "firebase/firestore"
import { signInWithEmailAndPassword, createUserWithEmailAndPassword } from "firebase/auth";
import {  Timestamp } from "firebase/firestore";
import { generateAlgorandKeyPair } from "../algorand/algo_create_import";
// import AlgoOperations from "../algorand/algo_operations";
import { auth } from "./init.js";
// import { UserCollection } from "./user_collection.js";
const UserCollection = require("./user_collection.js").default;



class FirebaseOperations
{
    constructor()
    {
        // keep track of the current user data
        this.user=new UserCollection();
        // this.asset_operation=new Asset();
        this.SignInState=false;
    }

    // sign in function
    // return 1 if successfully signed in
    // return 0 if the email is not registered or password invalid
    
    async sign_in(email,password)  {
        try {
            // if the email exist, try to use firebase authentication to sign in
            await signInWithEmailAndPassword(auth,email, password);
            this.SignInState=true;
            console.log("Successfully signed in!");
            // get the user data from the database
            this.user.user_collection.email=email;
            var status=0;
            while(true)
            {
                status=await this.user.read();
                // console.log(this.user.user_collection);
                if(status==1)
                {
                    break;
                }
            }
            // this.user.user_collection=await this.user.read();
            console.log(this.user.user_collection);
            console.log("Successfully read the user data from the database!");
            return 1;
            } catch (error) {
            console.error("The email is not registered or the password is invalid.", error);
            return 0;
            }
    }

    // sign up function
    // return 1 if successfully signed up
    // return 0 if the email is already registered
    // return -1 if the email address does not end with @ucsb.edu
    // return -2 if the password and confirm password do not match
    // return -3 if the password is too weak
    // return -4 if the email is in use or invalid
    async sign_up(name,email,password,confirm_password) {
    // fetch the user from the database with the given email
        // const q = query(collection(db, "login"), where("email", "==", email));
        // const querySnapshot = await getDocs(q);

        this.user.user_collection.email=email;
        const read_type=await this.user.read()
        if(read_type==1)
        {
            console.error("The email is already registered");
            console.log(this.user.user_collection)
            return 0;
        }
        // console.log("The email is not registered");
        // if the user exists, check if the password matches
        
        // if the email address does not end with @ucsb.edu, return -2
        if(!email.endsWith("@ucsb.edu"))
        {
            console.error("The email address must end with @ucsb.edu");
            return -1;
        }
        else if(password!= confirm_password)
        {
            console.error("The password and confirm password do not match");
            return -2;
        }
        else
        {   
            try{
                // if the email does not exist, try to use firebase authentication to sign up
                const KeyPair = generateAlgorandKeyPair();
                const passphrase = KeyPair[1];
                const address = KeyPair[0];
                console.log(address);
                console.log(passphrase);
                // console.log(KeyPair);
                const docData = {
                    name: name,
                    email: email,
                    address: address,
                    passphrase: passphrase,
                    timestamp: Timestamp.now(),
                    courses: [],
                    role:0
                };
                this.user.user_collection=docData;
                console.log(this.user.user_collection);
                // await setDoc(doc(db, "login",email), docData);
                // this.user.user_collection.email=email;
                await this.user.update();
                console.log("Successfully signed up!");
                await createUserWithEmailAndPassword(auth,email, password);
                return 1;
            }
            catch(error){
                if (error.code === 'auth/weak-password') {
                    console.log('The password is too weak.');
                    return -3;
                } else {
                    console.log(error);
                    return -4;
                }
            }
        }
    }
    

    async prof_sign_up(name,email,password,confirm_password) {
        // fetch the user from the database with the given email
            // const q = query(collection(db, "login"), where("email", "==", email));
            // const querySnapshot = await getDocs(q);
    
            this.user.user_collection.email=email;
            const read_type=await this.user.read()
            if(read_type==1)
            {
                console.error("The email is already registered");
                console.log(this.user.user_collection)
                return 0;
            }
            // console.log("The email is not registered");
            // if the user exists, check if the password matches
            
            // if the email address does not end with @ucsb.edu, return -2
            if(!email.endsWith("@ucsb.edu"))
            {
                console.error("The email address must end with @ucsb.edu");
                return -1;
            }
            else if(password!= confirm_password)
            {
                console.error("The password and confirm password do not match");
                return -2;
            }
            else
            {   
                try{
                    // if the email does not exist, try to use firebase authentication to sign up
                    const KeyPair = generateAlgorandKeyPair();
                    const passphrase = KeyPair[1];
                    const address = KeyPair[0];
                    console.log(address);
                    console.log(passphrase);
                    // console.log(KeyPair);
                    const docData = {
                        name: name,
                        email: email,
                        address: address,
                        passphrase: passphrase,
                        timestamp: Timestamp.now(),
                        courses: [],
                        role:1
                    };
                    this.user.user_collection=docData;
                    console.log(this.user.user_collection);
                    // await setDoc(doc(db, "login",email), docData);
                    // this.user.user_collection.email=email;
                    await this.user.update();
                    console.log("Successfully signed up!");
                    await createUserWithEmailAndPassword(auth,email, password);
                    return 1;
                }
                catch(error){
                    if (error.code === 'auth/weak-password') {
                        console.log('The password is too weak.');
                        return -3;
                    } else {
                        console.log(error);
                        return -4;
                    }
                }
            }
        }


    async sign_out() {
        try{
            await auth.signOut();
            this.SignInState=false;
            console.log("Successfully signed out!");
            return 1;
        }
        catch(error){
            console.log(error);
            return 0;
        }

    }
    
}

export default FirebaseOperations;