-- -----------------------------------------------------
-- Mockup data for table 'Donor'
-- -----------------------------------------------------
INSERT INTO `Donor` (`d_id`, `d_name`, `d_type`, `d_email`, `d_address`, `d_telephone`) VALUES
(101, 'FutureTech Foundation', 'Research Organization', 'contact@futuretech.org', '123 Tech Avenue, New York, NY', '+1-555-0101'),
(102, 'Government Innovation Agency', 'International Organization', 'info@govinnov.gov', '456 Public Street, Washington, DC', '+1-555-1234'),
(103, 'Global Health Corp', 'International Organization', 'info@globalhealth.com', '789 Global Road, Geneva, Switzerland', '+41-22-555-0103'),
(104, 'Tech Solutions Inc.', 'Private Company', 'contact@techsolutions.com', '101 Solution Drive, Seattle, WA', '+1-206-555-0104'),
(105, 'Environmental Conservation Trust', 'Research Organization', 'info@ect.org', '202 Nature Lane, London, UK', '+44-20-7555-0105'),
(106, 'National Science Fund', 'International Organization', 'grants@nsf.gov', '303 Science Way, Berlin, Germany', '+49-30-555-0106'),
(107, 'Innovative Minds NGO', 'Research Organization', 'contact@innovativeminds.org', '404 Minds Street, Paris, France', '+33-1-555-0107'),
(108, 'Phoenix Venture Capital', 'Private Company', 'info@phoenixvc.com', '505 Venture Blvd, San Francisco, CA', '+1-415-555-0108'),
(109, 'Foundation for the Arts', 'Research Organization', 'arts@foundation.org', '606 Art Gallery, Rome, Italy', '+39-06-555-0109'),
(110, 'Health and Wellness Fund', 'International Organization', 'health@fund.org', '707 Wellness Circle, Tokyo, Japan', '+81-3-555-0110'),
(111, 'Green Energy Alliance', 'Research Organization', 'contact@gea.com', '808 Green Plaza, Sydney, Australia', '+61-2-555-0111'),
(112, 'Urban Development Board', 'International Organization', 'info@udb.gov', '909 City Block, Dubai, UAE', '+971-4-555-0112');

-- -----------------------------------------------------
-- Mockup data for table 'Department'
-- -----------------------------------------------------
INSERT INTO `Department` (`dp_id`, `dp_name`, `dp_location`, `dp_email`, `dp_telephone`) VALUES
(1, 'Research', '123 University Blvd, Boston, MA', 'research.dept@university.edu', 123456789),
(2, 'Administration', '456 Campus Drive, Boston, MA', 'admin.dept@university.edu', 234567890),
(3, 'Engineering', '789 Tech Road, Boston, MA', 'eng.dept@university.edu', 345678901),
(4, 'Sciences', '101 Science Plaza, Boston, MA', 'sci.dept@university.edu', 456789012);

-- -----------------------------------------------------
-- Mockup data for table 'Project'
-- -----------------------------------------------------
INSERT INTO `Project` (`p_id`, `p_title`, `p_description`, `p_category`, `p_status`, `p_contract_start_date`, `p_contract_end_date`, `budget_amount`, `budget_status`, `Donor_d_id`) VALUES
(1001, 'AI-Powered Drug Discovery', 'A project to develop new algorithms for faster drug discovery using machine learning.', 'Research and Development', 'Complete', '2024-01-15 09:00:00', '2025-01-15 17:00:00', 2500000.00, 'Complete', 101),
(1002, 'Renewable Energy Grid Optimization', 'Optimization of renewable energy sources for smart grids to increase efficiency.', 'Research and Development', 'On going', '2024-03-01 09:00:00', '2025-09-01 17:00:00', 3500000.00, 'Incomplete', 102),
(1003, 'Sustainable Urban Farming', 'Research into vertical farming techniques for sustainable food production in urban environments.', 'Research and Development', 'On going', '2024-05-20 09:00:00', '2026-05-20 17:00:00', 1800000.00, 'Incomplete', 103),
(1004, 'Next-Gen Quantum Computing', 'Developing the next generation of quantum computing algorithms and hardware.', 'Research and Development', 'On going', '2024-06-10 09:00:00', '2026-06-10 17:00:00', 4200000.00, 'Incomplete', 104),
(1005, 'Marine Biodiversity Study', 'A comprehensive study of marine biodiversity in the Pacific Ocean.', 'Training/Capacity Building', 'Complete', '2024-07-01 09:00:00', '2025-07-01 17:00:00', 1500000.00, 'Complete', 105),
(1006, 'Advanced Robotics for Manufacturing', 'Integration of advanced robotics to streamline manufacturing processes.', 'Training/Capacity Building', 'On going', '2024-08-15 09:00:00', '2025-08-15 17:00:00', 2100000.00, 'Incomplete', 106),
(1007, 'Early Childhood Education Models', 'Research on new models for effective early childhood education in rural areas.', 'Training/Capacity Building', 'On going', '2024-09-01 09:00:00', '2026-09-01 17:00:00', 1200000.00, 'Incomplete', 107),
(1008, 'Cybersecurity Protocol Development', 'Developing new cybersecurity protocols for protecting critical infrastructure.', 'Training/Capacity Building', 'On going', '2024-10-10 09:00:00', '2025-10-10 17:00:00', 4800000.00, 'Incomplete', 108),
(1009, 'Historical Preservation Techniques', 'Study of modern techniques for the preservation of historical artifacts.', 'Conference/Workshop', 'On going', '2024-11-05 09:00:00', '2025-11-05 17:00:00', 1100000.00, 'Incomplete', 109),
(1010, 'Genomic Sequencing of Rare Diseases', 'Sequencing of genomes to identify genetic markers for rare diseases.', 'Conference/Workshop', 'On going', '2024-12-01 09:00:00', '2026-12-01 17:00:00', 3200000.00, 'Incomplete', 110),
(1011, 'Microbial Fuel Cells', 'Research and development of microbial fuel cells for sustainable energy generation.', 'Conference/Workshop', 'On going', '2025-01-01 09:00:00', '2026-01-01 17:00:00', 2800000.00, 'Incomplete', 111),
(1012, 'Smart City Traffic Management', 'Developing intelligent systems for traffic management in urban centers.', 'Conference/Workshop', 'On going', '2025-02-15 09:00:00', '2027-02-15 17:00:00', 3000000.00, 'Incomplete', 112);

-- -----------------------------------------------------
-- Mockup data for table 'Keyword'
-- -----------------------------------------------------
INSERT INTO `Keyword` (`k_id`, `k_type`) VALUES
(1, 'AI'), (2, 'machine learning'), (3, 'drug discovery'),
(4, 'renewable energy'), (5, 'smart grid'), (6, 'optimization'),
(7, 'vertical farming'), (8, 'sustainability'), (9, 'urban agriculture'),
(10, 'quantum'), (11, 'computing'), (12, 'algorithm'),
(13, 'marine'), (14, 'biodiversity'), (15, 'ocean'),
(16, 'robotics'), (17, 'manufacturing'), (18, 'automation'),
(19, 'education'), (20, 'childhood'), (21, 'rural'),
(22, 'cybersecurity'), (23, 'protocol'), (24, 'infrastructure'),
(25, 'history'), (26, 'preservation'), (27, 'artifacts'),
(28, 'genomics'), (29, 'rare diseases'), (30, 'genetics'),
(31, 'microbial'), (32, 'fuel cells'), (33, 'energy'),
(34, 'smart city'), (35, 'traffic'), (36, 'urban');

-- -----------------------------------------------------
-- Mockup data for table 'Research_areas'
-- -----------------------------------------------------
INSERT INTO `Research_areas` (`ra_id`, `ra_type`) VALUES
(1, 'Biomedical Informatics'), (2, 'Electrical Engineering'), (3, 'Environmental Science'),
(4, 'Quantum Physics'), (5, 'Marine Biology'), (6, 'Robotics'),
(7, 'Sociology'), (8, 'Computer Science'), (9, 'Archaeology'),
(10, 'Genetics'), (11, 'Biochemistry'), (12, 'Urban Planning');

-- -----------------------------------------------------
-- Mockup data for table 'Project_has_Keyword'
-- -----------------------------------------------------
INSERT INTO `Project_has_Keyword` (`Project_p_id`, `Project_Donor_d_id`, `Keyword_k_id`) VALUES
(1001, 101, 1), (1001, 101, 2), (1001, 101, 3),
(1002, 102, 4), (1002, 102, 5), (1002, 102, 6),
(1003, 103, 7), (1003, 103, 8), (1003, 103, 9),
(1004, 104, 10), (1004, 104, 11), (1004, 104, 12),
(1005, 105, 13), (1005, 105, 14), (1005, 105, 15),
(1006, 106, 16), (1006, 106, 17), (1006, 106, 18),
(1007, 107, 19), (1007, 107, 20), (1007, 107, 21),
(1008, 108, 22), (1008, 108, 23), (1008, 108, 24),
(1009, 109, 25), (1009, 109, 26), (1009, 109, 27),
(1010, 110, 28), (1010, 110, 29), (1010, 110, 30),
(1011, 111, 31), (1011, 111, 32), (1011, 111, 33),
(1012, 112, 34), (1012, 112, 35), (1012, 112, 36);

-- -----------------------------------------------------
-- Mockup data for table 'Research_areas_has_Project'
-- -----------------------------------------------------
INSERT INTO `Research_areas_has_Project` (`Research_areas_ra_id`, `Project_p_id`, `Project_Donor_d_id`) VALUES
(1, 1001, 101),
(2, 1002, 102),
(3, 1003, 103),
(4, 1004, 104),
(5, 1005, 105),
(6, 1006, 106),
(7, 1007, 107),
(8, 1008, 108),
(9, 1009, 109),
(10, 1010, 110),
(11, 1011, 111),
(12, 1012, 112);

-- -----------------------------------------------------
-- Mockup data for table 'Staff'
-- -----------------------------------------------------
INSERT INTO `Staff` (`s_id`, `s_firstname`, `s_middlename`, `s_lastname`, `s_email`, `s_gender`, `s_area_of_expertise`, `s_role`, `Project_p_id`, `Project_Donor_d_id`, `Department_dp_id`) VALUES
(1, 'Alex', 'J.', 'Chen', 'alex.chen@university.edu', 'Male', 'Machine Learning', 'Principle Investigator', 1001, 101, 1),
(2, 'Laura', 'T.', 'Evans', 'laura.evans2@university.edu', 'Female', 'Data Science', 'Project Member', 1001, 101, 1),
(3, 'David', 'S.', 'Lee', 'david.lee@university.edu', 'Male', 'Algorithm Development', 'Project Member', 1001, 101, 3),
(4, 'Michael', 'B.', 'Brown', 'michael.brown@university.edu', 'Male', 'Software Engineering', 'Project Member', 1001, 101, 3),
(5, 'David', 'S.', 'Lee', 'david.lee2@university.edu', 'Male', 'Power Systems', 'Principle Investigator', 1002, 102, 3),
(6, 'Megan', 'L.', 'Hall', 'megan.hall2@university.edu', 'Female', 'Renewable Energy', 'Project Member', 1002, 102, 3),
(7, 'John', 'P.', 'Smith', 'john.smith2@university.edu', 'Male', 'Electrical Engineering', 'Project Member', 1002, 102, 1),
(8, 'Grace', 'N.', 'Adams', 'grace.adams@university.edu', 'Female', 'Smart Grid Technology', 'Project Member', 1002, 102, 3),
(9, 'Maria', 'A.', 'Garcia', 'maria.garcia@university.edu', 'Female', 'Horticulture', 'Principle Investigator', 1003, 103, 4),
(10, 'Catherine', 'C.', 'Hall', 'catherine.hall@university.edu', 'Female', 'Botany', 'Project Member', 1003, 103, 4),
(11, 'Jessica', 'L.', 'Wilson', 'jessica.wilson2@university.edu', 'Female', 'Environmental Science', 'Project Member', 1003, 103, 4),
(12, 'Fiona', 'J.', 'Green', 'fiona.green@university.edu', 'Female', 'Urban Planning', 'Project Member', 1003, 103, 4),
(13, 'John', 'P.', 'Smith', 'john.smith@university.edu', 'Male', 'Quantum Computing', 'Principle Investigator', 1004, 104, 1),
(14, 'Jacob', 'E.', 'King', 'jacob.king@university.edu', 'Male', 'Theoretical Physics', 'Project Member', 1004, 104, 4),
(15, 'Daniel', 'M.', 'Miller', 'daniel.miller2@university.edu', 'Male', 'Algorithm Design', 'Project Member', 1004, 104, 1),
(16, 'Zoe', 'B.', 'Mitchell', 'zoe.mitchell2@university.edu', 'Female', 'Quantum Mechanics', 'Project Member', 1004, 104, 1),
(17, 'Emily', 'R.', 'Davis', 'emily.davis@university.edu', 'Female', 'Marine Biology', 'Principle Investigator', 1005, 105, 2),
(18, 'Nancy', 'G.', 'Phillips', 'nancy.phillips@university.edu', 'Female', 'Oceanography', 'Project Member', 1005, 105, 4),
(19, 'Olivia', 'C.', 'Moore', 'olivia.moore2@university.edu', 'Female', 'Ecosystem Modeling', 'Project Member', 1005, 105, 2),
(20, 'Rebecca', 'W.', 'Thomas', 'rebecca.thomas@university.edu', 'Female', 'Marine Conservation', 'Project Member', 1005, 105, 4),
(21, 'Michael', 'B.', 'Brown', 'michael.brown2@university.edu', 'Male', 'Robotics', 'Principle Investigator', 1006, 106, 3),
(22, 'Quentin', 'T.', 'Davis', 'quentin.davis@university.edu', 'Male', 'Automation', 'Project Member', 1006, 106, 3),
(23, 'Robert', 'D.', 'Clark', 'robert.clark2@university.edu', 'Male', 'Mechanical Engineering', 'Project Member', 1006, 106, 2),
(24, 'Vincent', 'A.', 'Harris', 'vincent.harris@university.edu', 'Male', 'Industrial Design', 'Project Member', 1006, 106, 3),
(25, 'Jessica', 'L.', 'Wilson', 'jessica.wilson@university.edu', 'Female', 'Sociology', 'Principle Investigator', 1007, 107, 4),
(26, 'Amy', 'H.', 'Miller', 'amy.miller@university.edu', 'Female', 'Development Studies', 'Project Member', 1007, 107, 4),
(27, 'Hannah', 'G.', 'Wright', 'hannah.wright@university.edu', 'Female', 'Community Outreach', 'Project Member', 1007, 107, 1),
(28, 'Yvonne', 'D.', 'Wilson', 'yvonne.wilson@university.edu', 'Female', 'Education Policy', 'Project Member', 1007, 107, 2),
(29, 'Daniel', 'M.', 'Miller', 'daniel.miller@university.edu', 'Male', 'Cybersecurity', 'Principle Investigator', 1008, 108, 1),
(30, 'Derek', 'N.', 'Anderson', 'derek.anderson@university.edu', 'Male', 'Network Security', 'Project Member', 1008, 108, 3),
(31, 'Tyler', 'V.', 'Scott', 'tyler.scott@university.edu', 'Male', 'Protocol Development', 'Project Member', 1008, 108, 2),
(32, 'Henry', 'U.', 'Evans', 'henry.evans@university.edu', 'Male', 'IT Infrastructure', 'Project Member', 1008, 108, 3),
(33, 'Olivia', 'C.', 'Moore', 'olivia.moore@university.edu', 'Female', 'Archaeology', 'Principle Investigator', 1009, 109, 2),
(34, 'Jack', 'W.', 'Hall', 'jack.hall@university.edu', 'Male', 'Historical Research', 'Project Member', 1009, 109, 1),
(35, 'Kevin', 'O.', 'Carter', 'kevin.carter@university.edu', 'Male', 'Artifact Conservation', 'Project Member', 1009, 109, 4),
(36, 'Noah', 'A.', 'Adams', 'noah.adams@university.edu', 'Male', 'Art History', 'Project Member', 1009, 109, 1),
(37, 'Laura', 'T.', 'Evans', 'laura.evans@university.edu', 'Female', 'Genetics', 'Principle Investigator', 1010, 110, 1),
(38, 'Mia', 'Z.', 'Scott', 'mia.scott@university.edu', 'Female', 'Genomic Sequencing', 'Project Member', 1010, 110, 4),
(39, 'Zoe', 'B.', 'Mitchell', 'zoe.mitchell@university.edu', 'Female', 'Molecular Biology', 'Project Member', 1010, 110, 1),
(40, 'Renee', 'D.', 'Turner', 'renee.turner@university.edu', 'Female', 'Biomedical Science', 'Project Member', 1010, 110, 4),
(41, 'Robert', 'D.', 'Clark', 'robert.clark@university.edu', 'Male', 'Biochemistry', 'Principle Investigator', 1011, 111, 2),
(42, 'Quincy', 'C.', 'Mitchell', 'quincy.mitchell@university.edu', 'Male', 'Chemical Engineering', 'Project Member', 1011, 111, 3),
(43, 'Adam', 'B.', 'Walker', 'adam.walker@university.edu', 'Male', 'Microbiology', 'Project Member', 1011, 111, 1),
(44, 'Ulysses', 'G.', 'Roberts', 'ulysses.roberts@university.edu', 'Male', 'Material Science', 'Project Member', 1011, 111, 3),
(45, 'Megan', 'L.', 'Hall', 'megan.hall@university.edu', 'Female', 'Urban Planning', 'Principle Investigator', 1012, 112, 3),
(46, 'Walter', 'I.', 'Collins', 'walter.collins@university.edu', 'Male', 'Civil Engineering', 'Project Member', 1012, 112, 1),
(47, 'Olivia', 'F.', 'Parker', 'olivia.parker@university.edu', 'Female', 'Traffic Modeling', 'Project Member', 1012, 112, 2),
(48, 'Carl', 'M.', 'Jackson', 'carl.jackson@university.edu', 'Male', 'Systems Analysis', 'Project Member', 1012, 112, 1);

-- -----------------------------------------------------
-- Mockup data for table 'Student_assistant'
-- -----------------------------------------------------
INSERT INTO `Student_assistant` (`sa_id`, `sa_firstname`, `sa_middlename`, `sa_lastname`, `sa_email`, `sa_gender`, `sa_hours`, `sa_responsibility`, `sa_rate`, `sa_start`, `sa_end`, `Project_p_id`, `Project_Donor_d_id`, `Department_dp_id`) VALUES
(1, 'William', 'E.', 'Taylor', 'william.taylor@university.edu', 'Male', 20, 'Administrative Support', 15.00, '2024-01-20 09:00:00', '2025-01-10 17:00:00', 1001, 101, 3),
(2, 'Sophia', 'F.', 'Anderson', 'sophia.anderson@university.edu', 'Female', 25, 'Data Processing', 15.00, '2024-02-01 09:00:00', '2025-01-15 17:00:00', 1001, 101, 4),
(3, 'James', 'G.', 'Thomas', 'james.thomas@university.edu', 'Male', 15, 'Financial Tracking', 15.00, '2024-03-05 09:00:00', '2025-08-30 17:00:00', 1002, 102, 1),
(4, 'Isabella', 'H.', 'Jackson', 'isabella.jackson@university.edu', 'Female', 18, 'Administrative Support', 15.00, '2024-04-10 09:00:00', '2025-09-01 17:00:00', 1002, 102, 2),
(5, 'Ryan', 'I.', 'White', 'ryan.white@university.edu', 'Male', 10, 'Logistics Coordination', 15.00, '2024-06-01 09:00:00', '2026-05-15 17:00:00', 1003, 103, 3),
(6, 'Chloe', 'J.', 'Harris', 'chloe.harris@university.edu', 'Female', 12, 'Fieldwork Support', 15.00, '2024-07-01 09:00:00', '2026-05-20 17:00:00', 1003, 103, 4),
(7, 'Samantha', 'Q.', 'Morgan', 'samantha.morgan@university.edu', 'Female', 18, 'Grant Writing', 18.00, '2024-06-15 09:00:00', '2026-06-05 17:00:00', 1004, 104, 3),
(8, 'Ethan', 'C.', 'Perez', 'ethan.perez@university.edu', 'Male', 20, 'Research Documentation', 18.00, '2024-07-01 09:00:00', '2026-06-10 17:00:00', 1004, 104, 4),
(9, 'Alexis', 'W.', 'Roberts', 'alexis.roberts@university.edu', 'Female', 12, 'Data Entry', 15.00, '2024-07-05 09:00:00', '2025-06-30 17:00:00', 1005, 105, 1),
(10, 'Caleb', 'Z.', 'Phillips', 'caleb.phillips@university.edu', 'Male', 15, 'Sample Collection', 15.00, '2024-08-01 09:00:00', '2025-07-01 17:00:00', 1005, 105, 2),
(11, 'Rachel', 'X.', 'Collins', 'rachel.collins@university.edu', 'Female', 14, 'Equipment Procurement', 16.00, '2024-08-20 09:00:00', '2025-08-10 17:00:00', 1006, 106, 3),
(12, 'Peter', 'Y.', 'Edwards', 'peter.edwards@university.edu', 'Male', 18, 'Technical Support', 16.00, '2024-09-01 09:00:00', '2025-08-15 17:00:00', 1006, 106, 4),
(13, 'Brian', 'A.', 'Young', 'brian.young@university.edu', 'Male', 25, 'Research Assistant', 15.00, '2024-09-05 09:00:00', '2026-08-30 17:00:00', 1007, 107, 3),
(14, 'Diana', 'K.', 'Hill', 'diana.hill@university.edu', 'Female', 20, 'Survey Distribution', 15.00, '2024-09-10 09:00:00', '2026-09-01 17:00:00', 1007, 107, 2),
(15, 'George', 'H.', 'Baker', 'george.baker@university.edu', 'Male', 22, 'Documentation', 17.00, '2024-10-15 09:00:00', '2025-10-05 17:00:00', 1008, 108, 1),
(16, 'Julia', 'N.', 'Adams', 'julia.adams@university.edu', 'Female', 25, 'Security Analysis', 17.00, '2024-11-01 09:00:00', '2025-10-10 17:00:00', 1008, 108, 4),
(17, 'Mark', 'D.', 'Roberts', 'mark.roberts@university.edu', 'Male', 19, 'Historical Research', 15.00, '2024-11-10 09:00:00', '2025-11-01 17:00:00', 1009, 109, 3),
(18, 'Pamela', 'L.', 'Collins', 'pamela.collins@university.edu', 'Female', 15, 'Site Assistance', 15.00, '2024-11-15 09:00:00', '2025-11-05 17:00:00', 1009, 109, 2),
(19, 'Samuel', 'Y.', 'Jackson', 'samuel.jackson@university.edu', 'Male', 28, 'Lab Assistance', 18.00, '2024-12-05 09:00:00', '2026-11-30 17:00:00', 1010, 110, 1),
(20, 'Wendy', 'B.', 'Garcia', 'wendy.garcia@university.edu', 'Female', 22, 'Data Analysis', 18.00, '2024-12-10 09:00:00', '2026-12-01 17:00:00', 1010, 110, 4),
(21, 'Zachary', 'F.', 'Brown', 'zachary.brown@university.edu', 'Male', 17, 'Report Generation', 15.00, '2025-01-05 09:00:00', '2025-12-30 17:00:00', 1011, 111, 3),
(22, 'Cindy', 'L.', 'Taylor', 'cindy.taylor@university.edu', 'Female', 15, 'Chemical Mixing', 15.00, '2025-01-10 09:00:00', '2026-01-01 17:00:00', 1011, 111, 2),
(23, 'Frank', 'R.', 'White', 'frank.white@university.edu', 'Male', 20, 'Fieldwork Support', 16.00, '2025-02-20 09:00:00', '2027-02-10 17:00:00', 1012, 112, 1),
(24, 'Irene', 'V.', 'Clark', 'irene.clark@university.edu', 'Female', 25, 'Traffic Simulation', 16.00, '2025-03-01 09:00:00', '2027-02-15 17:00:00', 1012, 112, 4);

-- -----------------------------------------------------
-- Mockup data for table 'Installment'
-- -----------------------------------------------------
INSERT INTO `Installment` (`i_id`, `i_amount`, `i_%budget`, `i_date`, `i_status`, `Project_p_id`, `Project_Donor_d_id`, `Donor_d_id`) VALUES
(2001, 1000000.00, 40.00, '2024-01-20 10:00:00', 'Complete', 1001, 101, 101),
(2002, 1500000.00, 60.00, '2024-06-20 10:00:00', 'Complete', 1001, 101, 101),
(2003, 1925000.00, 55.00, '2024-03-05 10:00:00', 'Complete', 1002, 102, 102),
(2013, 1575000.00, 45.00, '2024-09-05 10:00:00', 'Complete', 1002, 102, 102),
(2014, 630000.00, 35.00, '2024-05-25 10:00:00', 'Complete', 1003, 103, 103),
(2015, 720000.00, 40.00, '2025-05-25 10:00:00', 'Complete', 1003, 103, 103),
(2016, 450000.00, 25.00, '2026-05-25 10:00:00', 'Complete', 1003, 103, 103),
(2004, 1890000.00, 45.00, '2024-06-15 10:00:00', 'Complete', 1004, 104, 104),
(2017, 2310000.00, 55.00, '2025-06-15 10:00:00', 'Complete', 1004, 104, 104),
(2005, 750000.00, 50.00, '2024-07-10 10:00:00', 'Complete', 1005, 105, 105),
(2018, 750000.00, 50.00, '2025-01-10 10:00:00', 'Complete', 1005, 105, 105),
(2006, 1050000.00, 50.00, '2024-08-20 10:00:00', 'Complete', 1006, 106, 106),
(2019, 630000.00, 30.00, '2024-11-20 10:00:00', 'Complete', 1006, 106, 106),
(2020, 420000.00, 20.00, '2025-05-20 10:00:00', 'Complete', 1006, 106, 106),
(2007, 540000.00, 45.00, '2024-09-05 10:00:00', 'Complete', 1007, 107, 107),
(2021, 660000.00, 55.00, '2025-03-05 10:00:00', 'Complete', 1007, 107, 107),
(2008, 2400000.00, 50.00, '2024-10-15 10:00:00', 'Complete', 1008, 108, 108),
(2022, 2400000.00, 50.00, '2025-04-15 10:00:00', 'Complete', 1008, 108, 108),
(2009, 495000.00, 45.00, '2024-11-10 10:00:00', 'Complete', 1009, 109, 109),
(2023, 605000.00, 55.00, '2025-02-10 10:00:00', 'Complete', 1009, 109, 109),
(2010, 1600000.00, 50.00, '2024-12-05 10:00:00', 'Complete', 1010, 110, 110),
(2024, 1600000.00, 50.00, '2025-06-05 10:00:00', 'Complete', 1010, 110, 110),
(2011, 1260000.00, 45.00, '2025-01-05 10:00:00', 'Complete', 1011, 111, 111),
(2025, 980000.00, 35.00, '2025-06-05 10:00:00', 'Complete', 1011, 111, 111),
(2026, 560000.00, 20.00, '2025-11-05 10:00:00', 'Complete', 1011, 111, 111),
(2012, 1500000.00, 50.00, '2025-02-20 10:00:00', 'Complete', 1012, 112, 112),
(2027, 1500000.00, 50.00, '2026-02-20 10:00:00', 'Complete', 1012, 112, 112);
