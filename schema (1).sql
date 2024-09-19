create table `users` (
    `id` INT AUTO_INCREMENT,
    `first_name` varchar(32),
    `last_name` varchar(32),
    `username` varchar(32) unique not null,
    `password` varchar(128) not null,
    primary key(`id`)
);

create table `schools_uni` (
    `id` int AUTO_INCREMENT,
    `users_id` int,
    `name` varchar(32),
    `type` ENUM('Primary', 'Secondary', 'Higher Education') NOT NULL,
    `location` varchar(32),
    `year_founded` year not null,
    primary key(`id`),
    foreign key(`users_id`) references `users`(`id`)
);

create table `companies` (
    `id` int AUTO_INCREMENT,
    `users_id` int,
    `name` varchar(32),
    `industry` enum('Technology', 'Education', 'Business'),
    `location` varchar(32) ,
    primary key(`id`),
    foreign key(`users_id`) references `users`(`id`)
);

create table `connections` (
    `id` int AUTO_INCREMENT,
    `people_connections_id` int,
    `schools_uni_connections_id` int,
    `companies_id` int,

    `start_date_uni` date not null,
    `end_date_uni` date not null,
    `type_degree` varchar(32),

    `start_date_company` date not null,
    `end_date_company` date not null,
    `type_position` varchar(32),
    primary key(`id`),
    foreign key(`people_connections_id`) references `users`(`id`),
    foreign key(`schools_uni_connections_id`) references `schools_uni`(`id`),
    foreign key(`companies_id`) references `companies`(`id`)
);


