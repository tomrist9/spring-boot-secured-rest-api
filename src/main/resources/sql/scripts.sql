

DROP TABLE IF EXISTS authorities CASCADE;
DROP TABLE IF EXISTS contact_messages CASCADE;
DROP TABLE IF EXISTS notice_details CASCADE;
DROP TABLE IF EXISTS cards CASCADE;
DROP TABLE IF EXISTS loans CASCADE;
DROP TABLE IF EXISTS account_transactions CASCADE;
DROP TABLE IF EXISTS accounts CASCADE;
DROP TABLE IF EXISTS customer CASCADE;


CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

-- customer
CREATE TABLE customer (
                          customer_id SERIAL PRIMARY KEY,
                          name VARCHAR(100) NOT NULL,
                          email VARCHAR(100) NOT NULL,
                          mobile_number VARCHAR(20) NOT NULL,
                          pwd VARCHAR(500) NOT NULL,
                          role VARCHAR(100) NOT NULL,
                          create_dt DATE DEFAULT CURRENT_DATE
);

INSERT INTO customer (name, email, mobile_number, pwd, role, create_dt)
VALUES ('Happy', 'happy@example.com', '5334122365',
        '{bcrypt}$2a$12$88.f6upbBvy0okEa7OfHFuorV29qeK.sVbB9VQ6J6dWM1bW6Qef8m',
        'admin', CURRENT_DATE);

-- accounts
CREATE TABLE accounts (
                          customer_id INTEGER NOT NULL REFERENCES customer(customer_id) ON DELETE CASCADE,
                          account_number BIGINT PRIMARY KEY,
                          account_type VARCHAR(100) NOT NULL,
                          branch_address VARCHAR(200) NOT NULL,
                          create_dt DATE DEFAULT CURRENT_DATE
);

INSERT INTO accounts (customer_id, account_number, account_type, branch_address, create_dt)
VALUES (1, 1865764534, 'Savings', '123 Main Street, New York', CURRENT_DATE);

CREATE TABLE account_transactions (
                                      transaction_id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
                                      account_number BIGINT NOT NULL REFERENCES accounts(account_number) ON DELETE CASCADE,
                                      customer_id INTEGER NOT NULL REFERENCES customer(customer_id) ON DELETE CASCADE,
                                      transaction_dt DATE NOT NULL,
                                      transaction_summary VARCHAR(200) NOT NULL,
                                      transaction_type VARCHAR(100) NOT NULL,
                                      transaction_amt INTEGER NOT NULL,
                                      closing_balance INTEGER NOT NULL,
                                      create_dt DATE DEFAULT CURRENT_DATE
);

INSERT INTO account_transactions (transaction_id, account_number, customer_id,
                                  transaction_dt, transaction_summary, transaction_type, transaction_amt,
                                  closing_balance, create_dt)
VALUES (uuid_generate_v4(), 1865764534, 1,
        CURRENT_DATE - INTERVAL '7 days', 'Coffee Shop', 'Withdrawal', 30, 34500, CURRENT_DATE - INTERVAL '7 days');

INSERT INTO account_transactions (transaction_id, account_number, customer_id,
                                  transaction_dt, transaction_summary, transaction_type, transaction_amt,
                                  closing_balance, create_dt)
VALUES (uuid_generate_v4(), 1865764534, 1,
        CURRENT_DATE - INTERVAL '6 days', 'Uber', 'Withdrawal', 100, 34400, CURRENT_DATE - INTERVAL '6 days');

INSERT INTO account_transactions (transaction_id, account_number, customer_id,
                                  transaction_dt, transaction_summary, transaction_type, transaction_amt,
                                  closing_balance, create_dt)
VALUES (uuid_generate_v4(), 1865764534, 1,
        CURRENT_DATE - INTERVAL '5 days', 'Self Deposit', 'Deposit', 500, 34900, CURRENT_DATE - INTERVAL '5 days');

INSERT INTO account_transactions (transaction_id, account_number, customer_id,
                                  transaction_dt, transaction_summary, transaction_type, transaction_amt,
                                  closing_balance, create_dt)
VALUES (uuid_generate_v4(), 1865764534, 1,
        CURRENT_DATE - INTERVAL '4 days', 'Ebay', 'Withdrawal', 600, 34300, CURRENT_DATE - INTERVAL '4 days');

INSERT INTO account_transactions (transaction_id, account_number, customer_id,
                                  transaction_dt, transaction_summary, transaction_type, transaction_amt,
                                  closing_balance, create_dt)
VALUES (uuid_generate_v4(), 1865764534, 1,
        CURRENT_DATE - INTERVAL '2 days', 'OnlineTransfer', 'Deposit', 700, 35000, CURRENT_DATE - INTERVAL '2 days');

INSERT INTO account_transactions (transaction_id, account_number, customer_id,
                                  transaction_dt, transaction_summary, transaction_type, transaction_amt,
                                  closing_balance, create_dt)
VALUES (uuid_generate_v4(), 1865764534, 1,
        CURRENT_DATE - INTERVAL '1 day', 'Amazon.com', 'Withdrawal', 100, 34900, CURRENT_DATE - INTERVAL '1 day');

-- loans
CREATE TABLE loans (
                       loan_number SERIAL PRIMARY KEY,
                       customer_id INTEGER NOT NULL REFERENCES customer(customer_id) ON DELETE CASCADE,
                       start_dt DATE NOT NULL,
                       loan_type VARCHAR(100) NOT NULL,
                       total_loan INTEGER NOT NULL,
                       amount_paid INTEGER NOT NULL,
                       outstanding_amount INTEGER NOT NULL,
                       create_dt DATE DEFAULT CURRENT_DATE
);

INSERT INTO loans (customer_id, start_dt, loan_type, total_loan, amount_paid, outstanding_amount, create_dt)
VALUES (1, '2020-10-13', 'Home', 200000, 50000, 150000, '2020-10-13');

INSERT INTO loans (customer_id, start_dt, loan_type, total_loan, amount_paid, outstanding_amount, create_dt)
VALUES (1, '2020-06-06', 'Vehicle', 40000, 10000, 30000, '2020-06-06');

INSERT INTO loans (customer_id, start_dt, loan_type, total_loan, amount_paid, outstanding_amount, create_dt)
VALUES (1, '2018-02-14', 'Home', 50000, 10000, 40000, '2018-02-14');

INSERT INTO loans (customer_id, start_dt, loan_type, total_loan, amount_paid, outstanding_amount, create_dt)
VALUES (1, '2018-02-14', 'Personal', 10000, 3500, 6500, '2018-02-14');

-- cards
CREATE TABLE cards (
                       card_id SERIAL PRIMARY KEY,
                       card_number VARCHAR(100) NOT NULL,
                       customer_id INTEGER NOT NULL REFERENCES customer(customer_id) ON DELETE CASCADE,
                       card_type VARCHAR(100) NOT NULL,
                       total_limit INTEGER NOT NULL,
                       amount_used INTEGER NOT NULL,
                       available_amount INTEGER NOT NULL,
                       create_dt DATE DEFAULT CURRENT_DATE
);

INSERT INTO cards (card_number, customer_id, card_type, total_limit, amount_used, available_amount, create_dt)
VALUES ('4565XXXX4656', 1, 'Credit', 10000, 500, 9500, CURRENT_DATE);

INSERT INTO cards (card_number, customer_id, card_type, total_limit, amount_used, available_amount, create_dt)
VALUES ('3455XXXX8673', 1, 'Credit', 7500, 600, 6900, CURRENT_DATE);

INSERT INTO cards (card_number, customer_id, card_type, total_limit, amount_used, available_amount, create_dt)
VALUES ('2359XXXX9346', 1, 'Credit', 20000, 4000, 16000, CURRENT_DATE);

-- notice_details
CREATE TABLE notice_details (
                                notice_id SERIAL PRIMARY KEY,
                                notice_summary VARCHAR(200) NOT NULL,
                                notice_details VARCHAR(500) NOT NULL,
                                notic_beg_dt DATE NOT NULL,
                                notic_end_dt DATE,
                                create_dt DATE DEFAULT CURRENT_DATE,
                                update_dt DATE
);

INSERT INTO notice_details (notice_summary, notice_details, notic_beg_dt, notic_end_dt, create_dt, update_dt)
VALUES
    ('Home Loan Interest rates reduced',
     'Home loan interest rates are reduced as per the goverment guidelines. The updated rates will be effective immediately',
     CURRENT_DATE - INTERVAL '30 days', CURRENT_DATE + INTERVAL '30 days', CURRENT_DATE, NULL),
    ('Net Banking Offers',
     'Customers who will opt for Internet banking while opening a saving account will get a $50 amazon voucher',
     CURRENT_DATE - INTERVAL '30 days', CURRENT_DATE + INTERVAL '30 days', CURRENT_DATE, NULL),
    ('Mobile App Downtime',
     'The mobile application of the Wallet-wave will be down from 2AM-5AM on 12/05/2020 due to maintenance activities',
     CURRENT_DATE - INTERVAL '30 days', CURRENT_DATE + INTERVAL '30 days', CURRENT_DATE, NULL),
    ('E Auction notice',
     'There will be a e-auction on 12/08/2020 on the Bank website for all the stubborn arrears.Interested parties can participate in the e-auction',
     CURRENT_DATE - INTERVAL '30 days', CURRENT_DATE + INTERVAL '30 days', CURRENT_DATE, NULL),
    ('Launch of Millennia Cards',
     'Millennia Credit Cards are launched for the premium customers of Wallet-wave. With these cards, you will get 5% cashback for each purchase',
     CURRENT_DATE - INTERVAL '30 days', CURRENT_DATE + INTERVAL '30 days', CURRENT_DATE, NULL),
    ('COVID-19 Insurance',
     'Wallet-wave launched an insurance policy which will cover COVID-19 expenses. Please reach out to the branch for more details',
     CURRENT_DATE - INTERVAL '30 days', CURRENT_DATE + INTERVAL '30 days', CURRENT_DATE, NULL);

-- contact_messages
CREATE TABLE contact_messages (
                                  contact_id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
                                  contact_name VARCHAR(50) NOT NULL,
                                  contact_email VARCHAR(100) NOT NULL,
                                  subject VARCHAR(500) NOT NULL,
                                  message VARCHAR(2000) NOT NULL,
                                  create_dt DATE DEFAULT CURRENT_DATE
);

-- authorities
CREATE TABLE authorities (
                             id SERIAL PRIMARY KEY,
                             customer_id INTEGER NOT NULL REFERENCES customer(customer_id) ON DELETE CASCADE,
                             name VARCHAR(50) NOT NULL
);

INSERT INTO authorities (customer_id, name)
VALUES (1, 'VIEWACCOUNT'),
       (1, 'VIEWCARDS'),
       (1, 'VIEWLOANS'),
       (1, 'VIEWBALANCE');

-- Sil (DELETE) və sonra role insert
DELETE FROM authorities;

INSERT INTO authorities (customer_id, name)
VALUES (1, 'ROLE_USER'),
       (1, 'ROLE_ADMIN');
