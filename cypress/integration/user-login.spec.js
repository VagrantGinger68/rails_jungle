describe('User Login', () => {

  it("Create a user, log out, then log back in", () => {
    cy.visit('/signup');

    cy.get("#user_first_name").type("Test");
    cy.get("#user_last_name").type("Test");
    cy.get("#user_email").type("test@test.com");
    cy.get("#user_password").type("password");
    cy.get("#user_password_confirmation").type("password");
    cy.get('.btn').contains('Submit').click({force: true});
    cy.get('.nav-link').contains('Log Out').click({force: true});

    cy.get('.navbar').should('contain', 'Log In');

    cy.get('#email').type("test@test.com");

    cy.get('#password').type("password");

    cy.get('.btn').contains('Submit').click({force: true});

    cy.get('.navbar').should('contain', 'Log Out');
  });
  
});