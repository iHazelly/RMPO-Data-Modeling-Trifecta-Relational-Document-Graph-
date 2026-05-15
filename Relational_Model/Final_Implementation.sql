-- 1. Find all active projects in "Research and Development" category
-- Type: BR/OTP - Implementer: Paradorn
SELECT p_id, p_title, p_description, p_status, p_contract_start_date, p_contract_end_date, budget_amount
FROM Project 
WHERE p_category = 'Research and Development' 
  AND p_status IN ('On going', 'Incomplete');

-- 2. List all projects funded by donors of type "Research Organization"
-- Type: JOIN/CA - Implementer: Paradorn
SELECT p.p_id, p.p_title, p.p_category, p.budget_amount, 
       d.d_name AS donor_name, d.d_email, d.d_telephone
FROM Project p
JOIN Donor d ON p.Donor_d_id = d.d_id
WHERE d.d_type = 'Research Organization'
ORDER BY p.p_title;

-- 3. Calculate total budget amount by research area for current year
-- Type: GROUP/BP - Implementer: Paradorn
SELECT ra.ra_type AS research_area,
       COUNT(p.p_id) AS project_count,
       SUM(p.budget_amount) AS total_budget,
       AVG(p.budget_amount) AS average_budget
FROM Research_areas ra
JOIN Research_areas_has_Project rahp ON ra.ra_id = rahp.Research_areas_ra_id
JOIN Project p ON rahp.Project_p_id = p.p_id AND rahp.Project_Donor_d_id = p.Donor_d_id
WHERE YEAR(p.p_contract_start_date) = YEAR(CURDATE())
GROUP BY ra.ra_type
ORDER BY total_budget DESC;

-- 4. Show project details with donor information and installment schedule
-- Type: JOIN/OTP - Implementer: Paradorn
SELECT p.p_id, p.p_title, p.p_status, p.budget_amount,
       d.d_name AS donor_name, d.d_type, d.d_email, d.d_address,
       i.i_id AS installment_id, i.i_amount, i.i_date, i.i_status,
       CONCAT(i.`i_%budget`, '%') AS budget_percentage
FROM Project p
JOIN Donor d ON p.Donor_d_id = d.d_id
LEFT JOIN Installment i ON p.p_id = i.Project_p_id AND p.Donor_d_id = i.Project_Donor_d_id
ORDER BY p.p_id, i.i_date;

-- 5. Identify projects ending within next 3 months
-- Type: BR/BT - Implementer: Paradorn
SELECT p_id, p_title, p_contract_end_date, p_status,
       DATEDIFF(p_contract_end_date, CURDATE()) AS days_remaining
FROM Project 
WHERE p_contract_end_date BETWEEN CURDATE() AND DATE_ADD(CURDATE(), INTERVAL 3 MONTH)
  AND p_status != 'Complete'
ORDER BY p_contract_end_date ASC;

-- 6. Calculate average project duration by category
-- Type: GROUP/BP - Implementer: Thet Htun Swe
SELECT p_category,
       COUNT(*) AS project_count,
       AVG(p_duration) AS average_duration_months,
       MIN(p_duration) AS min_duration,
       MAX(p_duration) AS max_duration
FROM Project
GROUP BY p_category
ORDER BY average_duration_months DESC;

-- 7. List all international organization donors and their contact details
-- Type: BR/OTP - Implementer: Thet Htun Swe
SELECT d_id, d_name, d_email, d_address, d_telephone
FROM Donor 
WHERE d_type = 'International Organization'
ORDER BY d_name;

-- 8. Calculate total funding received from each donor type by year
-- Type: GROUP/BP - Implementer: Paradorn
SELECT d.d_type AS donor_type,
       YEAR(p.p_contract_start_date) AS project_year,
       COUNT(p.p_id) AS projects_funded,
       SUM(p.budget_amount) AS total_budget_allocated,
       SUM(COALESCE(inst_total.received_amount, 0)) AS total_amount_received
FROM Donor d
JOIN Project p ON d.d_id = p.Donor_d_id
LEFT JOIN (
    SELECT Project_p_id, Project_Donor_d_id, 
           SUM(CASE WHEN i_status = 'Complete' THEN i_amount ELSE 0 END) AS received_amount
    FROM Installment
    GROUP BY Project_p_id, Project_Donor_d_id
) inst_total ON p.p_id = inst_total.Project_p_id AND p.Donor_d_id = inst_total.Project_Donor_d_id
GROUP BY d.d_type, YEAR(p.p_contract_start_date)
ORDER BY project_year DESC, total_budget_allocated DESC;

-- 9. Identify top 5 research areas by total funding received
-- Type: GROUP/BP - Implementer: Paradorn
SELECT ra.ra_type AS research_area,
       COUNT(p.p_id) AS total_projects,
       SUM(p.budget_amount) AS total_funding_allocated,
       SUM(COALESCE(inst_received.amount_received, 0)) AS total_funding_received,
       ROUND((SUM(COALESCE(inst_received.amount_received, 0)) / SUM(p.budget_amount)) * 100, 2) AS funding_efficiency_percent
FROM Research_areas ra
JOIN Research_areas_has_Project rahp ON ra.ra_id = rahp.Research_areas_ra_id
JOIN Project p ON rahp.Project_p_id = p.p_id AND rahp.Project_Donor_d_id = p.Donor_d_id
LEFT JOIN (
    SELECT Project_p_id, Project_Donor_d_id,
           SUM(CASE WHEN i_status = 'Complete' THEN i_amount ELSE 0 END) AS amount_received
    FROM Installment
    GROUP BY Project_p_id, Project_Donor_d_id
) inst_received ON p.p_id = inst_received.Project_p_id AND p.Donor_d_id = inst_received.Project_Donor_d_id
GROUP BY ra.ra_type
ORDER BY total_funding_received DESC
LIMIT 5;

-- 10. Show project timeline and payment schedule
-- Type: JOIN/BT - Implementer: Paradorn
SELECT p.p_id, p.p_title, p.p_contract_start_date, p.p_contract_end_date,
       p.p_duration AS duration_months,
       i.i_date AS payment_date, i.i_amount, i.i_status,
       DATEDIFF(i.i_date, p.p_contract_start_date) AS days_from_start
FROM Project p
LEFT JOIN Installment i ON p.p_id = i.Project_p_id AND p.Donor_d_id = i.Project_Donor_d_id
ORDER BY p.p_id, i.i_date;

-- 11. List projects with their completion percentage based on installments received
-- Type: JOIN/BT - Implementer: Thet Htun Swe
SELECT p.p_id, p.p_title, p.budget_amount,
       COALESCE(SUM(CASE WHEN i.i_status = 'Complete' THEN i.i_amount ELSE 0 END), 0) AS amount_received,
       ROUND((COALESCE(SUM(CASE WHEN i.i_status = 'Complete' THEN i.i_amount ELSE 0 END), 0) / p.budget_amount) * 100, 2) AS completion_percentage,
       p.p_status
FROM Project p
LEFT JOIN Installment i ON p.p_id = i.Project_p_id AND p.Donor_d_id = i.Project_Donor_d_id
GROUP BY p.p_id, p.p_title, p.budget_amount, p.p_status
ORDER BY completion_percentage DESC;

-- 12. Update project status when contract end date is reached
-- Type: U/OTP - Implementer: Thet Htun Swe
UPDATE Project 
SET p_status = 'Complete'
WHERE p_contract_end_date <= CURDATE() 
  AND p_status = 'On going'
  AND budget_status = 'Complete';

-- 13. Insert new installment record for approved project payments
-- Type: I/OTP - Implementer: Paradorn
INSERT INTO Installment (i_amount, `i_%budget`, i_date, i_status, Project_p_id, Project_Donor_d_id, Donor_d_id)
VALUES 
(500000.00, 25, '2025-09-15 10:00:00', 'Complete', 1002, 102, 102),
(750000.00, 30, '2025-10-01 10:00:00', 'Incomplete', 1003, 103, 103);

-- 14. Delete projects ID = 1001 and associated records
-- Type: D/OTP - Implementer: Paradorn
-- Note: Due to foreign key constraints, delete in proper order
DELETE FROM Student_assistant WHERE Project_p_id = 1001;
DELETE FROM Staff WHERE Project_p_id = 1001;
DELETE FROM Installment WHERE Project_p_id = 1001;
DELETE FROM Project_has_Keyword WHERE Project_p_id = 1001;
DELETE FROM Research_areas_has_Project WHERE Project_p_id = 1001;
DELETE FROM Project WHERE p_id = 1001;

-- 15. Calculate monthly burn rate for active projects
-- Type: GROUP/BP - Implementer: Paradorn
SELECT p.p_id, p.p_title,
       p.budget_amount,
       p.p_duration,
       ROUND(p.budget_amount / p.p_duration, 2) AS monthly_budget_allocation,
       COALESCE(staff_cost.monthly_staff_cost, 0) AS monthly_staff_cost,
       COALESCE(student_cost.monthly_student_cost, 0) AS monthly_student_cost,
       ROUND((COALESCE(staff_cost.monthly_staff_cost, 0) + COALESCE(student_cost.monthly_student_cost, 0)), 2) AS total_monthly_burn_rate
FROM Project p
LEFT JOIN (
    SELECT Project_p_id, Project_Donor_d_id,
           COUNT(*) * 5000 / p_duration AS monthly_staff_cost
    FROM Staff s
    JOIN Project p ON s.Project_p_id = p.p_id AND s.Project_Donor_d_id = p.Donor_d_id
    GROUP BY Project_p_id, Project_Donor_d_id, p_duration
) staff_cost ON p.p_id = staff_cost.Project_p_id AND p.Donor_d_id = staff_cost.Project_Donor_d_id
LEFT JOIN (
    SELECT Project_p_id, Project_Donor_d_id,
           SUM(sa_hours * sa_rate * 4.33) AS monthly_student_cost
    FROM Student_assistant
    GROUP BY Project_p_id, Project_Donor_d_id
) student_cost ON p.p_id = student_cost.Project_p_id AND p.Donor_d_id = student_cost.Project_Donor_d_id
WHERE p.p_status = 'On going'
ORDER BY total_monthly_burn_rate DESC;


-- 16. Track project keyword trends over the past 5 years
-- Type: GROUP/BT - Implementer: Paradorn
SELECT k.k_type AS keyword,
       YEAR(p.p_contract_start_date) AS project_year,
       COUNT(p.p_id) AS projects_using_keyword,
       SUM(p.budget_amount) AS total_budget_with_keyword
FROM Keyword k
JOIN Project_has_Keyword phk ON k.k_id = phk.Keyword_k_id
JOIN Project p ON phk.Project_p_id = p.p_id AND phk.Project_Donor_d_id = p.Donor_d_id
WHERE p.p_contract_start_date >= DATE_SUB(CURDATE(), INTERVAL 5 YEAR)
GROUP BY k.k_type, YEAR(p.p_contract_start_date)
ORDER BY keyword, project_year DESC;



-- 17. For all ongoing projects, show the total number of installments, the number of incomplete installments, and the number of complete installments.
-- Type: GROUP/JOIN/BP - Implementer: Jirapat
SELECT p.p_id, 
       p.p_title,
       COUNT(i.i_id) AS total_installments,
       SUM(CASE WHEN i.i_status = 'Complete' THEN 1 ELSE 0 END) AS complete_installments,
       SUM(CASE WHEN i.i_status = 'Incomplete' THEN 1 ELSE 0 END) AS incomplete_installments
FROM Project p
LEFT JOIN Installment i ON p.p_id = i.Project_p_id AND p.Donor_d_id = i.Project_Donor_d_id
WHERE p.p_status = 'On going'
GROUP BY p.p_id, p.p_title
ORDER BY p.p_title;

-- 18. Identify projects that have passed their contract end date but are still 'On going'.
-- Type: BR/BP - Implementer: Jirapat
SELECT p.p_id,
       p.p_title,
       p.p_contract_end_date,
       DATEDIFF(CURDATE(), p.p_contract_end_date) AS days_overdue,
       d.d_name AS donor_name
FROM Project p
JOIN Donor d ON p.Donor_d_id = d.d_id
WHERE p.p_status = 'On going' 
  AND p.p_contract_end_date < CURDATE()
ORDER BY days_overdue DESC;


-- 19.  For all ongoing projects, calculate the total estimated budget to be spent in each year (based on the contract end date).
-- Type: GROUP/JOIN/BP - Implementer: Paradon
SELECT YEAR(p.p_contract_end_date) AS forecast_year,
       COUNT(p.p_id) AS projects_ending,
       SUM(p.budget_amount) AS total_budget
FROM Project p
WHERE p.p_status = 'On going'
GROUP BY YEAR(p.p_contract_end_date)
ORDER BY forecast_year;

-- 20. For each ongoing project, show the project lead (Principal Investigator), the total number of staff, and the project budget, to help in planning staff for new projects with similar budgets.
-- Type: JOIN/GROUP/BP/PA - Implementer: Jirapat
SELECT p.p_id,
       p.p_title,
       p.budget_amount,
       CONCAT(s.s_firstname, ' ', s.s_lastname) AS principal_investigator,
       staff_count.total_staff
FROM Project p
LEFT JOIN Staff s ON p.p_id = s.Project_p_id 
                 AND p.Donor_d_id = s.Project_Donor_d_id 
                 AND s.s_role = 'Principle Investigator'
LEFT JOIN (
    SELECT Project_p_id, Project_Donor_d_id, COUNT(*) AS total_staff
    FROM Staff
    GROUP BY Project_p_id, Project_Donor_d_id
) staff_count ON p.p_id = staff_count.Project_p_id AND p.Donor_d_id = staff_count.Project_Donor_d_id
WHERE p.p_status = 'On going'
ORDER BY p.budget_amount DESC;


-- 21. Identify the areas of expertise with the fewest staff members in ongoing projects, for future recruitment planning.
-- Type: JOIN/GROUP/REC - Implementer: Jirapat
SELECT s.s_area_of_expertise,
       COUNT(s.s_id) AS staff_count
FROM Staff s
JOIN Project p ON s.Project_p_id = p.p_id AND s.Project_Donor_d_id = p.Donor_d_id
WHERE p.p_status = 'On going'
GROUP BY s.s_area_of_expertise
ORDER BY staff_count ASC;

-- 22. Identify available staff members (not currently part of an ongoing project) who can be assigned to new projects.
-- Type: BR/REC - Implementer: Jirapat
SELECT DISTINCT s.s_id,
       CONCAT(s.s_firstname, ' ', s.s_lastname) AS staff_name,
       s.s_area_of_expertise,
       d.dp_name AS department
FROM Staff s
JOIN Department d ON s.Department_dp_id = d.dp_id
JOIN Project p ON s.Project_p_id = p.p_id AND s.Project_Donor_d_id = p.Donor_d_id
WHERE p.p_status = 'Complete'
  AND s.s_id NOT IN (
      SELECT s2.s_id
      FROM Staff s2
      JOIN Project p2 ON s2.Project_p_id = p2.p_id AND s2.Project_Donor_d_id = p2.Donor_d_id
      WHERE p2.p_status = 'On going'
  )
ORDER BY s.s_area_of_expertise, staff_name;