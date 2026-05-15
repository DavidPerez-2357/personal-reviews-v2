
CREATE TABLE category (
    id INTEGER PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    color VARCHAR(7) NOT NULL,
    icon VARCHAR(255) NOT NULL,
    deleted INTEGER NOT NULL DEFAULT 0 CHECK (deleted IN (0, 1))
);

CREATE TABLE folder (
    id INTEGER PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    image_path VARCHAR(255),
    deleted INTEGER NOT NULL DEFAULT 0 CHECK (deleted IN (0, 1)),

    parent_id INTEGER,
    category_id INTEGER NOT NULL,

    FOREIGN KEY (parent_id) REFERENCES folder(id) ON DELETE CASCADE,
    FOREIGN KEY (category_id) REFERENCES category(id) ON DELETE CASCADE
);

CREATE TABLE item (
    id INTEGER PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    description TEXT,
    image_path VARCHAR(255),
    deleted INTEGER NOT NULL DEFAULT 0 CHECK (deleted IN (0, 1)),

    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_at TIMESTAMP DEFAULT NULL, -- update manually

    category_id INTEGER NOT NULL,
    folder_id INTEGER,

    FOREIGN KEY (category_id) REFERENCES category(id) ON DELETE CASCADE,
    FOREIGN KEY (folder_id) REFERENCES folder(id) ON DELETE SET NULL
);

CREATE TABLE review (
    id INTEGER PRIMARY KEY,
    rating INTEGER NOT NULL CHECK (rating >= 1 AND rating <= 10),
    comment TEXT NOT NULL,
    deleted INTEGER NOT NULL DEFAULT 0 CHECK (deleted IN (0, 1)),

    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_at TIMESTAMP DEFAULT NULL, -- update manually

    item_id INTEGER NOT NULL,

    FOREIGN KEY (item_id) REFERENCES item(id) ON DELETE CASCADE
);

CREATE TABLE review_image (
    id INTEGER PRIMARY KEY,
    image_path VARCHAR(255) NOT NULL,

    review_id INTEGER NOT NULL,

    FOREIGN KEY (review_id) REFERENCES review(id) ON DELETE SET NULL -- images are stored in the filesystem, so we keep it to delete the image file after
);