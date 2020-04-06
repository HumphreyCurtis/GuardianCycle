import React, { useState } from "react";

function Login() {
  const [contact, setContact] = useState({
    uName: "",
    email: "",
    password: ""
  });

  function handleChange(event) {
    const { name, value } = event.target;
    console.log(contact);

    setContact(prevValue => {
      return {
        ...prevValue,
        [name]: value
      };
    });
  }

  return (
    <div className="container">
      <h1>Welcome to Guardian Cycle</h1>
      <p>Protecting heads of all sizes since February 2020</p>
      <form>
        <input
          onChange={handleChange}
          name="uName"
          value={contact.fName}
          placeholder="Username"
        />
        <input
          onChange={handleChange}
          name="email"
          type="email"
          value={contact.email}
          placeholder="Email"
        />
        <input
          onChange={handleChange}
          name="password"
          type="password"
          value={contact.password}
          placeholder="Password"
        />
        <button>Login</button>
      </form>
    </div>
  );
}

export default Login;
